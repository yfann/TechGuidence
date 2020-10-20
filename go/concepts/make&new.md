## make
+ 初始化内置数据结构
    + slice (零值为nil,make是初始化值)
    + map
    + chan

```go
slice := make([]int, 0, 100)
hash := make(map[int]bool, 10)
ch := make(chan int, 5)
```
## new
+ 根据传入的类型分配内存空间并返回指针
```go
p1 := new(int)
// 等价于
var p2 *int
i := 0
p2 = &i
```