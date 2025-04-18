# asyncio 

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
## tips
+ 异步阻塞
    + async中使用了time.sleep(),会阻塞整个事件循环
+ async await vs creat_task
## ref
+ [asyncio — Asynchronous I/O](https://docs.python.org/3/library/asyncio.html)