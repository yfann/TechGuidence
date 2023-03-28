## channel

+ 引用，nil, == 

+ goroutine间通信

+ pipeline
    + chan串联多个goroutine

+ `close(ch)`关闭通道
    + 发送者close chan，接受者可以停止不必要的等待
    + 向close的channel发数据 会导致panic
    + channel被close后还可以读取剩余数据直到读取nil，不再阻塞
    + 额外值表示chan是否被关闭或直接使用range(ok 值)
    + 不能用于单向只接收chan

+ 可以用来等待其他goroutine完成

+ goroutine泄露
    + goroutine一直阻塞无法退出
    + solution
        + buffered channel


## coding
```go
ch := make(chan int)

ch <- x  // a send statement
x = <-ch // a receive expression in an assignment statement
<-ch     // a receive statement; result is discarded
```



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


## select case 

+ 每个 case 都必须是一个通信
+ 所有 channel 表达式都会被求值
+ 所有被发送的表达式都会被求值
+ 如果任意某个通信可以进行，它就执行，其他被忽略
+ 如果有多个 case 都可以运行，Select 会随机公平地选出一个执行。其他不会执行。
+ 如果没有 case 可运行:
    + 如果有 default 子句，则执行该语句。
    + 如果没有 default 子句，select 将阻塞，直到某个通信可以运行；Go 不会重新对 channel 或值进行求值
+ select 会循环检测条件，如果有满足则执行并退出，否则一直循环检测。


## resource leak
+ goroutine如果没有退出则不会被GC

## underlying mechanism
The underlying mechanism of channels in Go involves the use of a data structure called a "synchronization primitive", which is used to coordinate the communication between Goroutines.

Internally, a channel is implemented as a queue of elements of the channel's specified type. When a Goroutine sends a value to a channel, the value is added to the back of the queue. When a Goroutine receives a value from a channel, the value is removed from the front of the queue.

To ensure that the communication between Goroutines is synchronized and safe, Go uses a technique called "channel operations". A channel operation is an atomic operation that involves sending or receiving a value from a channel. When a Goroutine performs a channel operation, it is blocked until the operation can be completed safely.

In addition, Go uses a mechanism called "goroutine scheduling" to manage the execution of Goroutines. Goroutines are lightweight threads of execution that are scheduled independently by the Go runtime. When a Goroutine is blocked on a channel operation, the runtime switches to a different Goroutine, allowing the program to make progress even if some Goroutines are waiting for channel operations to complete.

Overall, the underlying mechanism of channels in Go is a combination of data structures, synchronization primitives, and goroutine scheduling, all of which work together to ensure safe and efficient communication between Goroutines.

## tips
+ Synchronization primitive（同步原语,为了消除race condition）
    + lock
    + semaphore
    + condition variable
    + channel in go

## ref
+ [Go 语言 select 语句](https://www.runoob.com/go/go-select-statement.html)