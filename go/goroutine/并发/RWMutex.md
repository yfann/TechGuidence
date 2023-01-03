# RWMutex
+ read并行，write互斥
    + multiple readers, single writer lock


## code
```go
var mu sync.RWMutex
var balance int
func Balance() int {
    mu.RLock() // readers lock
    defer mu.RUnlock()
    return balance
}
```

## ref
+ [sync.RWMutex读写锁](https://docs.hacknode.org/gopl-zh/ch9/ch9-03.html)