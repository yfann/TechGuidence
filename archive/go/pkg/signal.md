
## tips

+ signal 进程间通信
    + 信号发生时会中断进程的正常流程，进入信号处理函数，完成后再回到中断的地方继续执行
+ kill (term signal)
+ ctrl + c (INT signal)
+ 无缝重启
    + 进程重启不需要关闭监听的端口
## code
```go
//  sigs 可以接受SIGINT,SIGTERM
 sigs := make(chan os.Signal, 1)
 signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)

```

## ref
+ [os/signal](https://books.studygolang.com/The-Golang-Standard-Library-by-Example/chapter16/16.03.html)
+ [Linux Signal及Golang中的信号处理](https://colobu.com/2015/10/09/Linux-Signals/)