## goroutine

+ 每一个并发的执行单元叫作一个goroutine

+ main为主goroutine
    + main退出后所有goroutine强制退出
        + goroutine无法被其他goroutine打断

+ goroutine会绑定到线程

+ 每个request被一个goroutine处理
    + 可能一个goroutine会创建出多个goroutine
        + context来来处理goroutine间的切换，cancel

## 语法
+ `go f()` new goroutine


## goroutine调度

+ 调度器会使当前goroutine休眠执行其他goroutine
    + time.Sleep
    + chanel调用
    + mutex阻塞

+ GOMAXPROCS 多少个线程上执行GO代码(默认是CPU核心数)
```go
for {
    go fmt.Print(0)
    fmt.Print(1)
}

$ GOMAXPROCS=1 go run hacker-cliché.go
// 111111111111111111110000000000000000000011111...

$ GOMAXPROCS=2 go run hacker-cliché.go
// 010101010101010101011001100101011010010100110...
```
## goroutine与线程
+ 线程
    + 线程固定2MB的栈
    + 线程的调度由OS的内核完成
+ goroutine
    + 比线程轻量
    + goroutine栈内存2KB，可以扩大到1GB，动态的
    + goroutine的调度由go自身的调度器完成(go内部事件，通道，互斥量)
    + m:n n个线程上调度m个goroutine

## tips
+ CSP(communicating sequential processes) 顺序通信进程
    + 并发编程模型
    + 值会在不同的运行实例(goroutine)中传递

## ref
+ [Goroutines和Channels](https://docs.hacknode.org/gopl-zh/ch8/ch8.html)
+ [Goroutines和线程](https://docs.hacknode.org/gopl-zh/ch9/ch9-08.html)
+ [什么是协程 ？](https://juejin.im/post/6844903921471717389)

+ [深度探索Go语言：抢占式调度(1)](https://www.zhihu.com/zvideo/1394562943225257984)
+ [第八章　Goroutines和Channels](https://docs.hacknode.org/gopl-zh/ch8/ch8.html)