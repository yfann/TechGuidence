# rust async/await

## async
+ Async开销是0
+ async与多线程多事并发模型，两者不互通
+ async 底层也是基于线程实现，但是它基于线程封装了一个运行时，可以将多个任务映射到少量线程上，然后将线程切换变成了任务切换，后者仅仅是内存中的访问，因此要高效的多
+ async 标记的语法块会被转换成实现了Future特征的状态机

## Future traint
+ 惰性，被轮询(poll)时才会运行
+ 一个在未来某个时间点被调度执行的任务
+ 与同步调用阻塞当前线程不同，当Future执行并遇到阻塞时，它会让出当前线程的控制权，这样其它的Future就可以在该线程中运行，这种方式完全不会导致当前线程的阻塞。
+ `async fn`的返回值是`Future`
+ Future的执行需要executor
    + `block_on(future);`
        + 阻塞当前线程等待future完成
    + `futures::join!(f1, f2);`
        + 等待多个future完成 
    + `hello_cat().await;`
        + 等待异步调用完成，不会阻塞当前线程(等待的过程中当前方法可能挂起，线程去执行其他异步方法)








## tips
+ 并发框架
    + actix
    + tokio

+ 高并发适合IO密集型
    + web
    + 数据库连接
    + 适合async模型
        + 一旦IO阻塞，任务可以切走，性能高于线程的上下文切换

+ 并行（线程数等于核数）
    + 适合CPU密集型任务
    + 适合用多线程

+ 编译器会为每一个async函数生成状态机

+ block_on
    + 会阻塞当前线程

## ref
+ [浅析 rust 大明星 Tokio](https://zhuanlan.zhihu.com/p/1923366370063660292)