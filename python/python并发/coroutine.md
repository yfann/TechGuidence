# python coroutine


## Gevent
+ Gevent 是基于 greenlet（Python 轻量级协程）实现的一个并发库，它使用 基于事件的异步编程
+ Monkey Patching：通过 gevent.monkey.patch_all() 使标准库的 I/O 操作变成非阻塞
+ 适用于网络编程：特别适合处理高并发的 Web 服务器、爬虫 等 I/O 密集型任务。
## Eventlet
+ Eventlet 和 Gevent 类似，也是基于 协程 和 Monkey Patching 实现的并发库，但它使用 greenlet + epoll/kqueue 进行事件驱动


## tips
+ Monkey Patch（猴子补丁）
    + Monkey Patch 是指在运行时修改或扩展模块、类、或函数的行为，而不修改其源代码。它通常用于动态修改库或框架的行为，以适应特定需求。