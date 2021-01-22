

## time.ticker
```go
d := time.Duration(time.Second*2)

t := time.NewTicker(d)
defer t.Stop()

for {
        <- t.C

        fmt.Println("timeout...")
}
```

## time.timer
```go
d := time.Duration(time.Second*2)

t := time.NewTimer(d)
defer t.Stop()

for {
        <- t.C

        fmt.Println("timeout...")
// need reset
t.Reset(time.Second*2)
}
```


## time.After
+ 延时处理
```go
// func After(d Duration) <-chan Time { return NewTimer(d).C }
// 超时处理
go Get("http://baidu.com/")
 
func Get(url string) {
    response := make(chan string)
    response = http.Request(url)

    select {
    case html :=<- response:
        println(html)
    case <-time.After(time.Second * 5):
        println("超时处理")
    }
}
```

+ 一段时间后自动执行函数
```go
f := func(){fmt.Println("I Love You!")}
time.AfterFunc(time.Second*2, f)
time.Sleep(time.Second * 4)
```


## ref
+ [Golang time.Timer and time.Ticker](https://www.jianshu.com/p/2b4686b8de4a)