## make

+ `func make(Type, size IntegerType) Type`
+ 只能用于下面类型的初始化(本身为引用类型)
    + slice (零值为nil,make是初始化值)
    + map
    + chan

```go
slice := make([]int, 0, 100)
hash := make(map[int]bool, 10)
ch := make(chan int, 5)
```



## new
+ 只能用来分配内存
    + struct也可以

+ `func new(Type) *Type`

+ 根据传入的类型分配内存空间并返回指针，指向零值
```go
p1 := new(int)
// 等价于
var p1 *int
i := 0
p1 = &i
```