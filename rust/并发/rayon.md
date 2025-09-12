# rayon
+ 数据并行（data parallelism）库
+ 只要把 .iter() 换成 .par_iter()，就能让集合的迭代自动并行执行。
    + 底层帮你处理线程池、任务拆分和调度

## tokio vs rayon
+ tokio
    + 异步 I/O 和任务调度（适合高并发网络应用，比如 web 服务器）。
    + 本质是一个 异步运行时，用 reactor（事件循环）+ executor（执行器） 来调度任务。
        + 异步任务 (Future) + 事件驱动
    + I/O 等待不会阻塞线程，而是注册到操作系统的事件机制（Linux epoll, Windows IOCP）。
    + CPU 密集的任务要手动 offload 到 blocking 线程池（否则会卡住 runtime）。
    + 调度方式
        + M:N 任务调度：很多 async 任务 (M) 映射到少量线程 (N)。
        + 执行器会不断 poll futures，只有准备好运行的任务才会消耗 CPU
        + I/O 驱动靠系统调用（epoll_wait、IOCP），避免闲等。
+ Rayon
    + CPU 密集型的数据并行（适合科学计算、批处理、图像处理等）。
    + 同步任务 + 工作窃取 (work-stealing) 线程池。
    + 它没有异步机制，任务一旦执行就是阻塞型的。
    + 适合 CPU 密集型的“并行数据处理”，比如 map/reduce、递归 divide & conquer。
    + 调度
        + 使用固定大小的 线程池（一般是 CPU 核心数）。
        + 每个线程有本地任务队列，忙时会“窃取”别的线程的任务（work-stealing）。
        + 没有事件循环，所有任务会立即执行，直到完成。

## ref
+ [rayon](https://docs.rs/rayon/latest/rayon/)