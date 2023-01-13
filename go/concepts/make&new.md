## make

+ func make(Type, size IntegerType) Type
+ 只能用于
    + slice (零值为nil,make是初始化值)
    + map
    + chan

```go
slice := make([]int, 0, 100)
hash := make(map[int]bool, 10)
ch := make(chan int, 5)
```
## new

+ func new(Type) *Type
+ 根据传入的类型分配内存空间并返回指针，指向零值
```go
p1 := new(int)
// 等价于
var p1 *int
i := 0
p1 = &i
```


## ref
+ [Why would I make() or new()?](https://stackoverflow.com/questions/9320862/why-would-i-make-or-new)