## const
+ `const pi=3.14`
```go
const (
    pi=3.14
    e=2.71
)

const (
    a = 1
    b
    c = 2
    d
)

fmt.Println(a, b, c, d) // "1 1 2 2"
```

+ boolean,string,number

+ 编译时确定(表达式编译时计算)

+ IOTA(constant generator,从0开始逐渐增1)
```go
type Weekday int

const (
    Sunday Weekday = iota
    Monday
    Tuesday
    Wednesday
    Thursday
    Friday
    Saturday
)
```
