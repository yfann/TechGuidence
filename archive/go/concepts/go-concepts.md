## OOP
+ 封装
    - 某些变量只有同package内的方法可以修改
    - struct
        - 小写变量（同package内可见）
```go
type IntSet struct {
    words []uint64
}
// s.words 同package可见
// whereas the expression *s could be used in any package, s.words may appear only in the package that defines IntSet
```

## err
+ 多值返回err

## panic
+ 中断程序运行

## recover
+ defer 函数调用返回捕获的panic
+ defer 函数在panic抛出前声明
+ 捕获panic 转换成error
```go
func Parse(input string) (s *Syntax, err error) {
    defer func() {
        if p := recover(); p != nil {
            err = fmt.Errorf("internal error: %v", p)
        }
    }()
    // ...parser...
}
```

##  defer
- 释放资源
- 函数返回之前调用
- 多个defer像栈一样倒序调用
- Deferred functions run after return statements have updated the function’s result variables. 
- run when panic occurs
```go
func f() (result int) {
    defer func() {
        result++
    }()
    return 0
}
// 1
// return xxx这一条语句并不是一条原子指令!
// return 0 可以拆成下面的func f() (result int) {
     result = 0  //return语句不是一条原子调用，return xxx其实是赋值＋ret指令
     func() { //defer被插入到return之前执行，也就是赋返回值和ret指令之间
         result++
     }()
     return
}

// example
func bigSlowOperation() {
    defer trace("bigSlowOperation")() // don't forget the extra parentheses
    // ...lots of work...
    time.Sleep(10 * time.Second) // simulate slow operation by sleeping
}

func trace(msg string) func() {
    start := time.Now()
    log.Printf("enter %s", msg)
    return func() { log.Printf("exit %s (%s)", msg, time.Since(start)) }
}

//defer 运行在函数设置返回值之前，可以查看返回值
func double(x int) (result int) {
    defer func() { fmt.Printf("double(%d) = %d\n", x, result) }()
    return x + x
}

func triple(x int) (result int) {
    defer func() { result += x }()
    return double(x)
}

fmt.Println(triple(4)) // "12"
```


## method
+ `func (p Point) Distance(q Point) float64`
    - Point 是receiver
    - copy receiver value
+ 任何命名类型都可以加方法,function也可以加方法
    - pointer 和 interface类型除外
    ```go
    type P *int
    func (P) f() { /* ... */ } // compile error: invalid receiver type
    ```




## struct
+ The name of a struct field is exported if it begins with a capital lette
+ Struct Embedding
```go
var employeeOfTheMonth *Employee = &dilbert
employeeOfTheMonth.Position += " (proactive team player)"
// 等价于
(*employeeOfTheMonth).Position += " (proactive team player)"

// literal
type Point struct{ X, Y int }

p := Point{1, 2}



type tree struct {
    value       int
    left, right *tree
}

```