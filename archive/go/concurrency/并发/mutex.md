
## code
```go
var (
    mu      sync.Mutex // guards balance
    balance int
)

func Balance() int {
    mu.Lock()
    defer mu.Unlock()
    return balance
}
```

## ref
+ [sync.Mutex互斥锁](https://docs.hacknode.org/gopl-zh/ch9/ch9-02.html)