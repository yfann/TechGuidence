# Timeout

+ Timeout allows a process to stop waiting for an answer once it’s clear that an answer may not be coming.

+ 注：当一个方法比较耗时时，指定timeout使其退出

## PARTICIPANTS
+ Client
The client who wants to execute SlowFunction.

+ SlowFunction
The long-running function that implements the functionality desired by Client.

+ Timeout
A wrapper function around SlowFunction that implements the timeout logic


## IMPLEMENTATION

+ 直接在func中使用context
```go
ctx := context.Background()
ctxt, cancel := context.WithTimeout(ctx, 10 * time.Second)
defer cancel()

result, err := SomeFunction(ctxt)
```

+ 第三方func无法用context作为参数
```go
import (
    rando "gitplace.io/random-repo/random-package"
)

func Timeout(arg string) func(context.Context) (string, error) {
    chres := make(chan string)
    cherr := make(chan error)

    go func() {
        res, err := rando.SlowFunction(arg)
        chres <- res
        cherr <- err
    }()

    return func(ctx context.Context) (string, error) {
        select {
        case res := <-chres:
            return res, <-cherr
        case <-ctx.Done():
            return "", ctx.Err()
        }
    }
}

// 调用
func main() {
    ctx := context.Background()
    ctxt, cancel := context.WithTimeout(ctx, 2 * time.Second)
    defer cancel()

    timeout := Timeout("some input value")
    res, err := timeout(ctxt)

    fmt.Println(res, err)
}
```

+ IMPLEMENTING CHANNEL TIMEOUTS
```go
var ch chan int

select {
case m := <-ch:                        // Read from ch; blocks forever
    fmt.Println(m)

case <-time.After(10 * time.Second):   // time.After returns a channel
    fmt.Println("timed out")
}
```