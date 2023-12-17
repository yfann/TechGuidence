## defer

+ `defer func()`

+ 在函数return 或异常前调用,函数的最后一刻才执行

+ 用来关闭或释放资源

+ 多个defer 倒序执行

+ 可以获取或改变函数的返回结果 result
```go
func double(x int) (result int){
    defer func() {fmt.Printf("double(%d) = %d\n",x,result)}()
    return x+x
}

_ = double(4)

// double(4) = 8
```

+ goroutine中,异常结束时用defer函数打印堆栈信息
    + 异常发生时所有的defer函数倒序执行直至返回main

+ `recover()`
    + defer函数内部调用
    + 正常时返回nil,异常时返回异常值
    + 外部函数异常时->defer func()执行->recover() 返回异常值->外部函数 正常退出
