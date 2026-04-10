# asyncio 
+ 单线程并发模型
    + 避免锁
    + 高性能 I/O
    + 可预测执行顺序
+ asyncio.run(main())
    + 主事件循环
    + 内部为
    ```py
    new_event_loop()
    → set_event_loop()
    → run_until_complete()
    → close()
    ```
+ event loop 是 asyncio 的调度器
    + 协程是被 event loop 调度的任务
    + event loop 本质是一个 while 循环（调度器）
    + 一个线程不可能同时执行两个“调度主循环”
    + 一个 loop 不能跨线程使用

+ loop和线程一一对应
    + 一个线程最多只能有一个“正在运行”的 event loop，
    + 而一个 event loop 只属于一个线程。
    + Thread（线程）
        └── Event Loop（事件循环）
                └── Tasks / Coroutines（协程任务）

## await
+ 挂起当前协程，释放 CPU 控制权
    + 当 await 的异步操作完成时，当前协程会恢复执行，继续往下运行，直到再次遇到 await 或执行完成。
+ 当 await 处于嵌套结构时，每一层 await 遇到异步任务都会 挂起当前协程，直到内层 await 完成，外层协程才能恢复执行。
    + 嵌套 await 会逐层挂起，直到最深层任务完成后逐层恢复
+ 事件循环会调度下一个可执行的任务，通常是下一个 await 任务，或者其他等待执行的任务

## asyncio.sleep()
+ 异步非阻塞
+ 主动让出控制权，避免协程独占 CPU 资源。
    + 当前协程挂起，指定时间后恢复执行，不会阻塞整个事件循环
+ 底层
    + 向事件循环注册一个定时器任务，seconds后回调当前协程
    + 让出Event loop 控制权，event loop继续执行其他任务，不会被sleep()阻塞
    + event loop继续执行，直到时间到达seconds
    + 当定时器到达设定时间，事件循环会 将任务标记为完成，唤醒挂起的协程，使其继续执行后续代码

+ vs time.sleep()
    + time.sleep()完全阻塞线程，期间无法执行其他任务
    


## 事件循环（Event loop）
+ 作用
    + 注册并管理异步任务
    + 监听 I/O 事件（如网络请求、文件操作）
    + 调度协程的执行（控制 await 语句）
    + 管理 Future、Task 等异步对象
    + 执行定时任务（如 asyncio.sleep()）
+ 工作原理
    + while 任务队列不为空:
        - 取出下一个任务
        - 执行任务，遇到 await 挂起
        - 监听 I/O 或定时器，等待完成
        - 任务完成后恢复执行

+ asyncio.run(main())
    + 启动事件循环
    + 执行main()

+ loop = asyncio.get_running_loop()
    + 得到当前事件循环
+ task = loop.create_task(foo()) 
    + 向事件循环添加任务

+ asyncio VS threading
    + asyncio
        + I/O密集型
        + 非真正并行
        + 非阻塞
        + 协程
    + threading
        + CPU密集型
        + 真正并行
        + 可能阻塞
        + 线程

## Coroutine
+ `async def`开启一个协程
    + 直接调用是不会执行，只是返回一个待执行的coroutine对象，没有把他交给事件循环执行
+ `await ....`
    + 交给事件循环执行，并等待结果
+ `asyncio.create_task(...)`
    + 交给事件循环后台执行，不等待
+ `asyncio.gather(...)`
    + 消费多个coroutine对象

## python协程(Coroutine) VS 线程

+ Coroutine
    + 单线程并发，基于事件循环
    + 协作式调度，await让出控制权
    + 轻量级，无thread切换开销
    + I/O密集型

+ thread
    + 多线程并发
    + 抢占式调度,cpu负责
    + 重量级
    + CPU密集型

## asyncio.to_thread()
+ 在异步代码中运行同步阻塞函数
    + 会自动将同步任务放入线程池中执行
    + 不会阻塞event loop

+ 可用于
    + CPU密集计算
    + 同步IO
        + 文件或数据库读取   

## 协程并发

+ asyncio.create_task() 
    + 创建一个后台运行的任务，立即调度执行
    + await task
        + 手动等待
    
+ asyncio.gather()
    + 并发执行
    + 收集他们的返回结果
    + 会自动等待所有协程返回
```py
    await asyncio.gather(task1(), task2())
```

## asyncio.Queue
+ 线程安全，异步队列
+ coroutine之间的数据通信
    + 如果队列满了，`await queue.put(1)` 会等待直到有空位。
    + 如果队列空了，`data = await queue.get()` 会等待直到有新数据。
+ queue.task_done() 
    + queue.get()取出数据后，queue.task_done()标记task完成, queue.join()才能知道任务完成 
    + queue.join()等待所有任务完成，然后继续执行
        + 任务多少根据queue.put()的数量来定



## asyncio.get_running_loop()
+ 返回当前线程中正在运行的 event loop
+ 用途
```py
# 创建异步任务
loop = asyncio.get_running_loop()
loop.create_task(coro())

# 执行阻塞代码
loop = asyncio.get_running_loop()

result = await loop.run_in_executor(
    None,  # 默认线程池
    blocking_func
)

# 定时任务
loop.call_later(2, callback)
```

## asyncio.new_event_loop()
+ 创建新事件循环
    + 一般在子线程中使用
```py
import asyncio
import threading

def worker():
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)

    loop.run_until_complete(asyncio.sleep(1))
    loop.close()

threading.Thread(target=worker).start()
```

## asyncio.wait_for()
+ 在指定时间内等待一个协程完成，否则就取消它并抛出超时异常
+ await 一个 Task + 注册一个定时器




## asyncio.Lock()
+ 协程之间的互斥锁（mutex
    + 保证同一时间只有一个协程可以进入某个临界区（critical section

+ 单线程的并发问题
    + coroutine在await时会切换执行
    + 共享变量/资源可能被“交叉修改”
    + 这就产生了“竞态条件”（race condition）

+ 原理
    + 内部维护一个状态：locked / unlocked
    + 和一个等待队列（FIFO）
    + action
        + 获取锁 -> 如果锁被占用 → 当前协程被挂起（await）
        + 锁释放后 → 唤醒下一个等待者
        + 不会阻塞线程，只是让协程“排队等待”

+ code
```py
lock = asyncio.Lock()

async def incr():
    global counter
    async with lock:
        tmp = counter
        await asyncio.sleep(0)
        counter = tmp + 1

# ==
await lock.acquire()
try:
    ...
finally:
    lock.release()
```

## tips
+ 异步阻塞
    + async中使用了time.sleep(),会阻塞整个事件循环
+ async await vs creat_task
## ref
+ [asyncio — Asynchronous I/O](https://docs.python.org/3/library/asyncio.html)