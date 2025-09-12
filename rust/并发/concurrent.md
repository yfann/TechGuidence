## Concurrent vs Parallel
+ 并发(Concurrent) 是多个队列使用同一个咖啡机，然后两个队列轮换着使用（未必是 1:1 轮换，也可能是其它轮换规则），最终每个人都能接到咖啡
    + 两个队列轮流处理
    + 单核心并发
    + 多核心并发
        + M:N(M个线程,N个CPU)
        + 并发与并行是同时在发生的
+ 并行(Parallel) 是每个队列都拥有一个咖啡机，最终也是每个人都能接到咖啡，但是效率更高，因为同时可以有两个人在接咖啡
    + 两个队列同时处理
    + 多核心并行

## 并发模型
+ OS线程
    + thread pool提升并发能力
    + 上下文切换造成性能开销
    + 适合CPU密集型计算
+ Coroutines(协程)
+ Event driven
+ actor
+ 异步
    + async/await
        + 适合大量IO处理


## async/await
+ 异步编程模型
    + 异步语法糖
    + 异步代码写起来像同步代码

+ C# 的 async/await
    + 基于 Task (任务并发模型)
    + 真正的 多线程并发，支持 CPU 密集型 和 I/O 异步。
    + await 时，编译器会生成 状态机，把后续代码封装成 continuation 回调。

+ Python 的 async/await
    + 基于 协程 (Coroutine)，不是多线程。
    + 依赖 事件循环 (Event Loop)，如 asyncio。
    + await 本质是 yield，让出控制权给事件循环。
    + 不是真并行，而是通过 事件循环切换任务 来实现“伪并发”。
        + 本质是 单线程 + 事件循环。

## Python 协程 vs go routine
+ Python 协程
    + 协作式调度，依赖 事件循环，主要用于 I/O 并发，单线程伪并发
        + 基于 生成器/asyncio 的 用户态协程。
        + 本质是 单线程 + 事件循环。
        + 不是真并行，而是通过 事件循环切换任务 来实现“伪并发”
+ Go 协程（goroutine）
    + 抢占式调度，由 Go runtime 管理，能利用 多核并行，支持大规模并发。
        + Go 语言内置的 轻量级线程。
            + 每个 goroutine 有自己的栈（起始 2KB，可动态扩展）。
        + Go runtime 的 M:N 调度器 管理:
            + M = 操作系统线程
            + N = goroutine
            + Go runtime 负责把成千上万个 goroutine 映射到少量系统线程上运行。
        + 是真并发，多个 goroutine 可以分布在不同 CPU 核上同时运行。


## tips
+ 异步
    + 任务不会阻塞线程，等结果好了再回来
    + 关注的是 任务的执行方式（非阻塞 vs 阻塞）。
    + 实现方式：
        + 回调
        + 事件循环
        + future/promise
        + async/await
    + 可以提升并发能力

+ 协程 (Coroutine)
    + 一种 编程模型 / 控制流机制。
    + 本质上是：函数可以 挂起 (yield) 并在以后 恢复执行。