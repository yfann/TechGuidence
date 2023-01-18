# sync.Once
+ 每一次对Do()的调用都会锁定mutex
+ 在第一次调用时，boolean变量的值是false，Do会调用loadIcons并会将boolean变量设置为true。随后的调用什么都不会做

## code
```go
var loadIconsOnce sync.Once
var icons map[string]image.Image
// Concurrency-safe.
func Icon(name string) image.Image {
    loadIconsOnce.Do(loadIcons)
    return icons[name]
}
```

## ref
+ [sync.Once惰性初始化](https://docs.hacknode.org/gopl-zh/ch9/ch9-05.html)