

## fastapi
+ 默认单进程单事件循环
    + UvicornWorker 内部默认 事件循环只在主线程（Worker 线程）中运行。
        + 其他线程（比如 Gunicorn 的 --threads 或 run_in_threadpool 创建的线程）不会自动有事件循环。
        + 这些线程只能跑同步代码，或通过 asyncio.run_coroutine_threadsafe 调用协程（比较少用）。

+ async方法会被丢到事件循环里,如果里面调用了同步操作，整个事件循环会被阻塞
    + 对于同步操作可以用线程池来处理,事件循环不会被阻塞
        + （同步操作是IO时有效,如果是CPU运算则还会卡住整个事件循环，需要多进程来处理）
```py
from starlette.concurrency import run_in_threadpool

@app.get("/good")
async def good_endpoint():
    result = await run_in_threadpool(blocking_task)
    return {"msg": result}

```

+ 多进程处理
```py
from starlette.concurrency import run_in_threadpool
from concurrent.futures import ProcessPoolExecutor
import asyncio

executor = ProcessPoolExecutor()

async def run_in_processpool(func, *args):
    loop = asyncio.get_event_loop()
    return await loop.run_in_executor(executor, func, *args)
```


## gunicorn模式启动的多线程
+ gunicorn方式启动
```sh
CMD ["gunicorn", "-k", "uvicorn.workers.UvicornWorker", "main:app", "--workers", "6", "--threads", "8", "--bind", "0.0.0.0:8888"]
```

+ --threads
    + 同步请求 或 WSGI worker 模式下有效
    
+ 对 ASGI Worker (UvicornWorker) 的 async 方法：
    + async 方法仍在事件循环主线程里执行
    + 不会自动切换到其他线程
    + 也就是说，async 方法里的阻塞同步函数 仍然会阻塞事件循环

## Gunicorn vs uvicorn
+ Uvicorn
    + ASGI Server（轻量、高性能的异步 Web 服务器）。
    + 基于 asyncio（可选 uvloop 提升性能）。
    + 本身非常轻量，只处理一个 进程 + 一个事件循环。
    + 提供 --workers 参数，可以开多进程，但没有 --threads。

+ Gunicorn
    + WSGI/ASGI Server 管理器（多进程管理框架）。
    + 作为 “主管理器”，启动并管理多个 Worker 进程，每个 Worker 再去跑 WSGI/ASGI 应用。
    + 自身原本是 WSGI 服务器（给 Flask/Django 之类用）。
    + 通过 Worker 类 支持 ASGI，比如 uvicorn.workers.UvicornWorker。
    + 强大的 进程/线程管理能力（worker 数量、线程数、超时、优雅重启等）。
    + Gunicorn + UvicornWorker 才是 FastAPI 最常见的生产部署方式
        + Gunicorn 负责：进程数、线程数、守护、信号、优雅重启
        + Uvicorn Worker 负责：异步事件循环、ASGI 协议。
        + 两者结合，既有 性能（Uvicorn）又有 管理能力（Gunicorn）。

##  WSGI vs ASGI
+ WSGI（Web Server Gateway Interface）
    + 同步阻塞：每个请求占用一个线程/进程直到返回结果。
    + 协议：只处理 HTTP/1.0 / HTTP/1.1。
    + 应用：Flask、Django（传统同步模式）
    + Web 服务器（Nginx/Apache/gunicorn） → WSGI Server → Python 应用
    + 不支持 WebSocket、HTTP/2、Server-Sent Events（SSE）等异步协议。
    + 并发依赖多线程或多进程，CPU/I/O 利用不如异步高效。
+ ASGI（Asynchronous Server Gateway Interface）
    + 支持 async def 协程，也能跑同步函数。
    + HTTP/1.1、HTTP/2、WebSocket、SSE 等。
        + 支持长连接（WebSocket）和异步任务。
    + FastAPI、Starlette、Django Channels
    + Web 服务器（Uvicorn/Hypercorn/Nginx） → ASGI Server → Python 应用
    + 应用可以挂起协程等待 I/O，不阻塞事件循环，轻松支持高并发。
    + I/O 密集型场景高效，单进程处理成百上千并发请求。


## BackgroundTasks
+ 来自starlette.background， FastAPI底层依赖Starlette
+ 简化实现
```py
class BackgroundTasks:
    def __init__(self):
        self.tasks: List[BackgroundTask] = []

    def add_task(self, func: Callable, *args, **kwargs):
        self.tasks.append(BackgroundTask(func, *args, **kwargs))

    async def __call__(self):
        for task in self.tasks:
            await task()
# __call__ 方法会在请求结束后被调度执行
# 串行执行 add_task() 注册的函数
```
+ 依赖当前事件循环（asyncio）执行
+ 可以被依赖注入
    + 每次请求到来时，FastAPI 会在内部构造一个新的 BackgroundTasks 实例。
    + 它会和这个请求的 Request、Response 绑定在一起，保证任务只属于当前请求生命周期。
+ 什么周期
    + 从请求开始 → 响应返回 → 执行后台任务 → 生命周期结束

+ 多个请求是并行执行(asyncio),一个请求内是串行执行(BackgroundTasks)


## BackgroundTasks VS asyncio.create_task()
+ BackgroundTasks
    + asyncio事件循环中执行
        + 任务不会立刻放进事件循环，而是被 挂在 response.background 上
        + 只有在 HTTP 响应发完后，Starlette 才会顺序执行这些任务
    + Starlette/FastAPI 提供的工具
    + 语义是 “在 HTTP 响应返回之后执行收尾任务”
    + 生命周期和 请求绑定，不是全局调度
    + 串行执行`add_task()`（task1 → task2 → …）
        + 如果要并发，需要你自己在 handler 里用 asyncio.gather()
    + 场景
        + 轻量级 “收尾” 操作（日志、缓存更新、发通知）
        + 不要求严格并发
        + 希望语义清晰（“请求结束后执行”）
+ asyncio.create_task()
    + asyncio事件循环中执行
        + asyncio.create_task()调用时立即执行
    + 原生 asyncio 提供的 API
    + 语义是 “把一个协程对象放到事件循环中异步执行”
    + 和请求/响应生命周期完全无关
    + 并行执行`create_task()`让协程并发执行，可以天然并行
    + 场景
        + 需要真正的并发处理（多个任务并行）
        + 与 HTTP 请求解耦的长期任务（比如跑一个持续的消费 loop）
        + 需要更精细的控制（取消、超时、异常处理）

## Starlette
+ 基于 ASGI 的轻量级 Python Web 框架
+ FastAPI = Starlette + Pydantic