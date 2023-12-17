

## tips
+ go中exception处理
    + defer
    + panic
    + recover

+ go panic一个异常， defer中通过recover捕获异常
```go

func main() {
      fmt.Println("c")
   defer func() { // 必须要先声明defer，否则不能捕获到panic异常
      fmt.Println("d")
      if err := recover(); err != nil {
         fmt.Println(err) // 这里的err其实就是panic传入的内容
      }
      fmt.Println("e")
   }()
   f() 
   fmt.Println("f") //这里开始下面代码不会再执行
}

func f() {
   fmt.Println("a")
   panic("异常信息")
   fmt.Println("b") //这里开始下面代码不会再执行
}
// -------output-------
// c
// a
// d
// 异常信息
// e
```

## ref
+ [Go语言 异常panic和恢复recover用法](https://www.jianshu.com/p/0cbc97bd33fb)