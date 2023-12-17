## ==
+ 类型必须相同
    + 没有隐式转换

+ 浮点比较考虑精度
```go

var a float64 = 0.1
var b float64 = 0.2
var c float64 = 0.3
fmt.Println(a + b == c) // false
```

+ 数组，结构体比较时：逐元素比较
    + 数组长度不同无法比较

+ 引用类型直接比较地址
    + slice之间不能比较,只能和nil比较
        + slice的指针也不能比较，包含slice的都不能比较
    + map只能和nil比较
        + 不能比较的类型不能作为map的key


+ 接口类型(动态类型和动态值)
    + 动态类型相同和动态值相等，则接口相等
    + 不考虑接口类型
```go
var f *os.File
var r io.Reader = f
var rc io.ReadCloser = f
fmt.Println(r == rc) // true
```
## tips
+ reflect.DeepEqual

## ref
+ [深入理解Go之==](https://darjun.github.io/2019/08/20/golang-equal/)