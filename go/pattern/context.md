## context package
+ 协程的上下文，追踪协程的状态
+ carrying deadlines, cancelation signals, and request-scoped values between processes.
+ 用于取消sub process,sub request,sub goroutine
+ 在多个goroutine中使用

+ `func Background() Context`empty context，used by main function, initialization, and tests, and as the top-level Context for incoming requests.

+ `func context.TODO() Context`empty context,place holder

+ context可以派生，当父context取消后，派生出的也会被取消

+ context可以传递key-value pairs

## sample
```go
type Context interface {
    // Done returns a channel that's closed when this Context is canceled.
    Done() <-chan struct{}

    // Err indicates why this context was canceled after the Done channel is
    // closed. If Done is not yet closed, Err returns nil.
    Err() error

    // Deadline returns the time when this Context should be canceled; it
    // returns ok==false if no deadline is set.
    Deadline() (deadline time.Time, ok bool)

    // Value returns the value associated with this context for key, or nil
    // if no value is associated with key. Use with care.
    Value(key interface{}) interface{}
}
```

```go
// 方法
func WithDeadline(Context, time.Time) (Context, CancelFunc)

func WithTimeout(Context, time.Duration) (Context, CancelFunc)

func WithCancel(Context) (Context, CancelFunc)

func WithValue(parent Context, key, val interface{}) Context
```


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