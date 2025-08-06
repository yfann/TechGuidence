## tokio

+ tokio 是协作式的调度器
+ 用spawn_blocking创建阻塞线程去完成cpu密集型任务
    + spawn_blocking创建单独的 OS 线程，该线程并不会被 tokio 所调度
    + 果某个 CPU 密集的异步任务是通过 tokio 创建的，CPU 密集的任务很可能会一直霸占着 CPU，此时 tokio 的调度方式决定了该任务会一直被执行，这意味着，其它的异步任务无法得到执行的机会，最终这些任务都会因为得不到资源而饿死。