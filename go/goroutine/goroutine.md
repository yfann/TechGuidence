## goroutine

+ 每一个并发执行的活动为goroutine
+ main为主goroutine
+ main退出后所有goroutine强制退出
+ 比线程轻量
    + goroutine栈内存2KB，可以扩大到1GB
        + 线程固定2MB
    + goroutine的调度由go自身的调度器完成(go内部事件，通道，互斥量)
        + 线程的调度由OS的内核完成
    + 协程同线程类似于线程同进程
        + 多个协程绑到同一个线程上执行
+ 每个request被一个goroutine处理
    + 可能一个goroutine会创建出多个goroutine
        + context来来处理goroutine间的切换，cancel

## 语法
+ `go f()` new goroutine





## ref
+ [Goroutines和Channels](https://docs.hacknode.org/gopl-zh/ch8/ch8.html)