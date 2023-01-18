## context

+ 用来简化对于处理单个请求的多个goroutine之间与请求域的数据、取消信号、截止时间等相关操作

+ 每个request都会有一个goroutine处理，每个goroutine会开启多个goroutine
    + 多个goroutine处理同一个request
        + context可以共享数据（身份信息,认证token）
        + context可以cancel这些goroutines

+ 协程的上下文，追踪协程的状态
+ carrying deadlines, cancelation signals, and request-scoped values between processes.
+ 用于取消sub process,sub request,sub goroutine
+ 在多个goroutine中使用

+ `func Background() Context`empty context，used by main function, initialization, and tests, and as the top-level Context for incoming requests.

+ `func context.TODO() Context`empty context,place holder

+ context可以派生，当父context取消后，派生出的也会被取消

+ context可以传递key-value pairs

## code
```go
// top level process 创建backgroud context后
//  然后把经过修饰的context传入 sub process
func Stream(ctx context.Context, out chan<- Value) error {
    // Create a derived Context with a 10 second timeout and passes it to
    // ServiceCall. It will be cancelled upon timeout, but ctx will not.
    dctx := context.WithTimeout(ctx, time.Second * 10)
    res, err := ServiceCall(dctx)
    if err != nil {                         // Can be true if dctx times out
        return err
    }

    for {
        select {
        case out <- res:                    // Read from res; send to out
        case <-ctx.Done():                  // Triggered when Done closes
            return ctx.Err()
        }
    }
}
```

## ref
+ [Go组件：context学习笔记](https://zhuanlan.zhihu.com/p/548276361)
+ [Golang Context深入理解](https://juejin.im/post/6844903555145400334)
+ [6.1 上下文 Context](https://draveness.me/golang/docs/part3-runtime/ch06-concurrency/golang-context/)