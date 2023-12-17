## var

+ `var intVal int = 1`


+ `var balance [10] float32` 数组
    - `var balance = [5]float32{1000.0, 2.0, 3.4, 7.0, 50.0}`
    - `var balance = [...]float32{1000.0, 2.0, 3.4, 7.0, 50.0}`


+ `const LENGTH int = 10`
```go
// 常量用作枚举
// 常量表达式中，函数必须是内置函数
const (
    Unknown = 0
    Female = 1
    Male = 2
)
// iota  编译器修改，const会重置第一个iota为0
const (
        a = iota   //0
        b          //1
        c          //2
        d = "ha"   //独立值，iota += 1
        e          //"ha"   iota += 1
        f = 100    //iota +=1
        g          //100  iota +=1
        h = iota   //7,恢复计数
        i          //8
)
```

+ `a,b = b,a`
    - `_,b=5,7`  `_`只写变量，用于丢弃值

+ 类型转换
```go
var sum int = 17
var mean float32
mean = float32(sum)
```

+ package level variable会在main开始前初始化
    + local variable在function执行时初始化

+ new(T)
    + creates an unnamed variable of type T
    + initializes it to the zero value of T
    + return *T
```go
p := new(int)   
fmt.Println(*p)
```
+ variable escape from function
    + need heap-allocated(before it's in stack)
```go
var global *int

func f() {                      
    var x int                  
    x = 1                       
    global = &x              
}
```

## 指针
+ `var ptr *int` 指针变量
    - `&i` 取内存地址
    - `*ptr` 取值
    - nil 空指针


```go
// e.i.
x := 1
p := &x         // p, of type *int, points to x
fmt.Println(*p) // "1"
*p = 2          // equivalent to x = 2
fmt.Println(x)  // "2"

// e.i.
var p = f()

func f() *int {
    v := 1
    return &v
}

// e.i.
func incr(p *int) int {
    *p++ // 非常重要：只是增加p指向的变量的值，并不改变p指针！！！
    return *p
}
```




## 简短声明
+ `i := 100 `

+ 简短变量声明左边的变量至少有一个是new的
```go
in, err := os.Open(infile)
// 第二个err赋值
out, err := os.Create(outfile)
```

## new()
+ `new(T)`
    + 初始化T的零值
    + 返回地址类型(*T)

```go
p := new(int)   // p, *int 类型, 指向匿名的 int 变量
fmt.Println(*p) // "0"
*p = 2          // 设置 int 匿名变量的值为 2
fmt.Println(*p) // "2"



func newInt() *int {
    return new(int)
}

func newInt() *int {
    var dummy int
    return &dummy
}
```



## tips
<!-- 赋值 -->
+ `i, j = j, i` 

+ 编译器会自动选择在栈上还是在堆上分配局部变量的存储空间
    + 和var,new无关
    + 和生命周期有关(闭包)

```go
var global *int

func f() {
    var x int
    x = 1 //堆上分配
    global = &x
}

func g() {
    y := new(int) //栈上分配
    *y = 1
}
```