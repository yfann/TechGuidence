
## tips
+ 提前处理错误
```go
err := request()

if err != nil {
 // handling error
 return // or continue, etc.
}
// proceed to further
```

+ 局部变量用短变量
    - 基本规则：距离声明的地方越远，变量名需要越具可读性。
    - 作为一个函数接收者，1、2 个字母的变量比较高效。
    - 像循环指示变量和输入流变量，用一个单字母就可以。
    - 越不常用的变量和公共变量，需要用更具说明性的名字。

+ 使用类型选择语句
```go
func Write(v interface{}) {
 switch v.(type) {
 case string:
   s := v.(string)
   fmt.Printf(“%T\n”,s)
 case int:
   i := v.(int)
   fmt.Printf(“%T\n”,i)
 }
}


func Write(v interface{}) {
 switch x := v.(type) {
 case string:
   fmt.Printf(“%T\n”,x)
 case int:
   fmt.Printf(“%T\n”,x)
 }
}
```

## ref
+ [我们必须遵循的 12 个 Go 语言最佳实践](https://zhuanlan.zhihu.com/p/189396216)
+ [Effective Go](https://golang.org/doc/effective_go.html)