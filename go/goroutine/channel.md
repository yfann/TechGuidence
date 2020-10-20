## channel

+ goroutine间通信

+ 可以 == 比较

+ pipeline
    + chan串联多个goroutine

## coding
```go
ch := make(chan int)

ch <- x  // a send statement
x = <-ch // a receive expression in an assignment statement
<-ch     // a receive statement; result is discarded
```


+ `close(ch)`关闭通道
    + 发送者close chan，接受者可以停止不必要的等待
    + chan<-发送方 会导致panic
    + 接收方<-chan  如果数据都被接收，返回nil，不再阻塞
    + 额外值表示chan是否被关闭或直接使用range
    + 不能用于只接收chan
```go
// Squarer
go func() {
    for {
        x, ok := <-naturals
        if !ok {
            break // channel was closed and drained
        }
        squares <- x * x
    }
    close(squares)
}()
// 简洁版
for x := range naturals {
    squares <- x * x
}
```

+ 单向chan
    + chan<- int(只发送int的chan)
    + <-chan int(只接收int的chan)
    + 双向chan可以转为单向chan,反之不行
```go
func squarer(out chan<- int, in <-chan int) {
    for v := range in {
        out <- v * v
    }
    close(out)
}


naturals := make(chan int)
squares := make(chan int)
// 隐式地从chan int转换成chan<- int
go squarer(squares, naturals)
```

## 带缓存chan
+ 内部队列
    + 发送者队尾插数据，接收者队头删数据
    + 队列是满的，发送者阻塞
    + 队列是空的，接收者阻塞

+ `ch := make(chan int)`无缓存通道
    + `make(chan int,0)`无缓存通道
    + `make(chan int,3)`容量为3的缓存通道

+ `cap(ch)` 获取容量
    + `len(ch)`

+ 无缓存通道（同步通道）
    + 发送和接收都是阻塞操作，直到另一个goroutine接收或发送值
    + 发送和接收同步

+ sample
```go
// 只接收返回最快的那个请求
// 用无缓存chan时，其他连个会阻塞
func mirroredQuery() string {
    responses := make(chan string, 3)
    go func() { responses <- request("asia.gopl.io") }()
    go func() { responses <- request("europe.gopl.io") }()
    go func() { responses <- request("americas.gopl.io") }()
    return <-responses // return the quickest response

```


## 并行
```go
func makeThumbnails5(filenames []string) (thumbfiles []string, err error) {
    type item struct {
        thumbfile string
        err       error
    }

    ch := make(chan item, len(filenames))
    for _, f := range filenames {
        go func(f string) {
            var it item
            it.thumbfile, it.err = thumbnail.ImageFile(f)
            ch <- it
        }(f)
    }

    for range filenames {
        it := <-ch
        if it.err != nil {
            return nil, it.err
        }
        thumbfiles = append(thumbfiles, it.thumbfile)
    }

    return thumbfiles, nil
}
```

```go
func makeThumbnails6(filenames <-chan string) int64 {
    sizes := make(chan int64)
    var wg sync.WaitGroup // number of working goroutines
    for f := range filenames {
        wg.Add(1)
        // worker
        go func(f string) {
            defer wg.Done()
            thumb, err := thumbnail.ImageFile(f)
            if err != nil {
                log.Println(err)
                return
            }
            info, _ := os.Stat(thumb) // OK to ignore error
            sizes <- info.Size()
        }(f)
    }

    // closer
    go func() {
        wg.Wait()
        close(sizes)
    }()

    var total int64
    for size := range sizes {
        total += size
    }
    return total
}
```