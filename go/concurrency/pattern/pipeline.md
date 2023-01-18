# pipeline
+ 高效利用IO和多核CPU

+ source -> stage -> stage -> ... -> sink
    + 同步pipeline: 多个stage必须在同一个协程中有序进行

+ pipeline(a series of stages connected by channels,where each stage is a group of goroutines running the same function)
    + first stage(source,producer)
        + outbound channels
    + stages
        + inbound,outbound channels
    + last stage(sink,consumer)
        + inbound channels

## Fan-out
+ Multiple functions can read from the same channel until that channel is closed

## fan-in
+ A function can read from multiple inputs and proceed until all are closed by multiplexing the input channels onto a single channel that’s closed when all the inputs are closed

## tips
+ 同步异步pipeline
+ outbound
    + stages close their outbound channels when all the send operations are done
+ inbound 
    + stages keep receiving values from inbound channels until those channels are closed.

## ref
+ [Go Concurrency Patterns: Pipelines and cancellation](https://go.dev/blog/pipelines)
+ [golang 进阶必备——pipeline【最佳实践】](https://zhuanlan.zhihu.com/p/598761593)
