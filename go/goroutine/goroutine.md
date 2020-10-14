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



## tips
+ `go method()`启动一个goroutine
+ 每个request被一个goroutine处理
    + 可能一个goroutine会创建出多个goroutine
        + context来来处理goroutine间的切换，cancel

## 通道

+ 可以使一个goroutine发送特定值到另一个goroutine
+ `ch := make(chan int)`无缓存通道
    + `make(chan int,0)`无缓存通道
    + `make(chan int,3)`容量为3的缓存通道
+ 可以 == 比较
+ send,receive
    + <-
    + `ch <- x` 发送
    + `x = <- ch` 接收表达式
    + `<- ch`接收，丢弃结果
    + `close(ch)`关闭通道,后续没有值了,之后不能再执行发送操作

+ 无缓存通道（同步通道）
    + 发送和接收都是阻塞操作，直到另一个goroutine接收或发送值
    + 发送和接收同步

