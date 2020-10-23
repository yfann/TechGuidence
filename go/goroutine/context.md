## context
+ 是线程安全的

+ 用来简化对于处理单个请求的多个goroutine之间与请求域的数据、取消信号、截止时间等相关操作

+ 每个request都会有一个goroutine处理，每个goroutine会开启多个goroutine
    + 多个goroutine处理同一个request
        + context可以共享数据（身份信息,认证token）
        + context可以cancel这些goroutines


```go
type Context interface {

Deadline() (deadline time.Time, ok bool)

Done() <-chan struct{}

Err() error

Value(key interface{}) interface{}

}
```

## ref
+ [Golang Context深入理解](https://juejin.im/post/6844903555145400334)
+ [6.1 上下文 Context](https://draveness.me/golang/docs/part3-runtime/ch06-concurrency/golang-context/)