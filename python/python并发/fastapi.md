

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