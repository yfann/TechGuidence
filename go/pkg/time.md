

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
## tips

+ UTC(Universal Time Coordinated)
    + 0时区 `2021-03-10 10:30:00 +0000 UTC`
    + 中国区 UTC+8 `2021-03-10 10:30:00 +0800 CST`

+ time.Now()
    + 返回local时间`2021-03-10 10:24:17.5457407 +0800 CST m=+0.008998301`

+ time.Parse()
    + 返回UTC时区时间

+ time.Unix(sec,nsec)

+ <t>.Unix()
    + 返回UTC时间距离1970-01-01 00:00:00的秒数
    + local时间先换算为UTC时间，再计算秒数

+ Zone()
    + 返回时区

+ time.LoadLocation
    + 根据时区名创建时区

+ time.ParseInLocation
    + 转换为本地时区时间
    + time.ParseInLocation("2006-01-02 15:04:05", "2021-03-10 10:30:00", time.Local)

+ time.UTC()

+ `time.Now().Format("2006-01-02-15-04-05")`


## ref
+ [Golang time.Timer and time.Ticker](https://www.jianshu.com/p/2b4686b8de4a)
+ [go 本地时间和UTC时间互相转化](https://www.jianshu.com/p/cc3ffdaa0b8c)
+ [time](https://golang.org/pkg/time/#Parse)
+ [Format a time or date [complete guide]](https://yourbasic.org/golang/format-parse-string-time-date-example/)