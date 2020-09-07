
## 变量

+ `var intVal int = 1`
    - `intVal := 1` 简写，声明语句
        + `intVal,intVal1 := 1,2`

+ `var ptr *int` 指针变量
    - `&i` 取内存地址
    - `*ptr` 取值
    - nil 空指针

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

## others
+ select
+ goto
```go
goto label;
..
.
label: statement;
```
+ struct
```go
type struct_variable_type struct {
   member definition
   member definition
   ...
   member definition
}

```
```go
type Books struct {
   title string
   author string
   subject string
   book_id int
}

var Book1 Books 

Books{title: "Go 语言", author: "www.runoob.com"}

e2 := example{
    falg: true,
    counter: 10
}
```


## 函数
+ 定义
```go
func function_name( [parameter list] ) [return_types] {
   函数体
}
```

+ 返回多指
```go
func swap(x, y string) (string, string) {
   return y, x
}
```

+ 函数变量
```go
type cb func(int) int

func testCallBack(x int, f cb) {
    f(x)
}

getSquareRoot := func(x int) int {
    return math.Sqrt(x)
}

testCallBack(1, getSquareRoot)
```
+ 闭包
```go
func getSequence() func() int {
   i:=0
   return func() int {
      i+=1
     return i  
   }
}
```

+ 函数方法
```go
func (variable_name variable_data_type) function_name() [return_type]{
   /* 函数体*/
}
```

```go
type Circle struct {
  radius float64
}

//该 method 属于 Circle 类型对象中的方法
func (c Circle) getArea() float64 {
  //c.radius 即为 Circle 类型对象中的属性
  return 3.14 * c.radius * c.radius
}

c1.getArea()
```



## range

```go
nums := []int{2, 3, 4}
sum := 0
for _, num := range nums {
    sum += num
}
```

## map
+ `var map_variable map[key_data_type]value_data_type`
+ `map_variable := make(map[key_data_type]value_data_type)`
+ `countryCapitalMap := map[string]string{"France": "Paris", "Italy": "Rome", "Japan": "Tokyo", "India": "New delhi"}`
+  键值是否存在
```go
capital, ok := countryCapitalMap [ "American" ]
if (ok) {
    fmt.Println("American 的首都是", capital)
} else {
    fmt.Println("American 的首都不存在")
}
```
+ `delete(map, key)`




## ref
+ [Go 语言教程](https://www.runoob.com/go/go-tutorial.html)
+ [Go语言简介](http://c.biancheng.net/golang/intro/)
+ [the-way-to-go_ZH_CN](https://github.com/unknwon/the-way-to-go_ZH_CN/blob/master/eBook/preface.md)
+ [Package template](https://golang.org/pkg/text/template/)
+ [Ultimate Go Programming](https://github.com/ardanlabs/gotraining)
+ [go design](https://github.com/ardanlabs/gotraining/tree/master/topics/go/design)
+ [The Go Programming Language](http://www.gopl.io/)
+ [深入解析Go](https://tiancaiamao.gitbooks.io/go-internals/content/zh/)
<!-- tools -->
+ [vscode go](https://github.com/golang/vscode-go/blob/master/docs/commands.md#go-locate-configured-go-tools)
+ [online go](https://play.golang.org/)