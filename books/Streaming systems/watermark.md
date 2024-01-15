# watermark
+ The watermark is a monotonicly increasing timestamp of the oldest work not yet completed.
    + completeness
        + 可以关闭一个窗口
    + visibility

+ watermark is a function
    + F(P) → E 
        + processing time
        + event time

+ temporal boundaries

+ event-time window close
    + the window does not expect any more data

+ windows are materialized as the watermark passes the end of the window

+ watermark creation
    + data source需要有event time
    + Watermarks are created at input source

+ watermark在event time上最小


+  windows are materialized as the watermark passes the end of the window.

+ shortcoming
    + too slow
        + watermark lag(processing time lag)
        + 主要发生在perfect watermark
        + 导致low latency
    + too fast
        + 主要发生在heuristic watermark
        + watermark移动过快，有些delay data没观测到
        + 导致incorrectness 

+ low watermark
    + he event time of the oldest unprocessed record the system is aware of

+ high watermark
    + the event time of the newest record the system is aware of. 

## perfect watermark
+ Pipelines using perfect watermark creation never have to deal with late data

+ use cases
    + ingress timestamping
        + 入口时间戳（Ingress Timestamping) : 将数据进入系统的时间（即处理时间）当作数据的事件事件。2016年前几乎所有的流计算系统都是这样做的，这种方式非常简单，能保证数据单调递增，但是坏处是处理时间与数据真正的事件事件没有关系，数据真正的事件时间在计算过程中被抛弃了
    + static sets of time-ordered logs
        + 按时间排序的静态日志集（e.g.,an Apache Kafka topic with a static set of partitions）：按时间排序的日志，且大小固定的数据源（比如某个kafka topic中，有固定数量的partition，且每个partition中数据的event time严格单调递增）。这种场景中，只需要知道有几个partition，和每个partition中待处理数据中eventtime最早的事件即可得出watermark。
            + bounded out-of-order processing
                + bounded by the minimum observed event time among those partitions(fixed size)

+ tips
    + 所以使用perfect watermark的关键是保证数据源数据在event time上单调递增

## heuristic watermark(accurate heuristic watermarks)
+ an estimate that no data with event times less than the watermark will ever be seen again
+ Pipelines using heuristic watermark creation might need to deal with some amount of late data
+ use cases
    + Dynamic sets of time-ordered logs
        + 按事件排序的动态日志集：（比如：每个日志文件内部的数据在event time上单调递增，但是文件之间时间没有关系.日志文件的数量不确定）。在这种场景下，可以通过跟踪最早的待处理数据的event time，数据增长率，网络拓扑，可用带宽等信息，来得到一个相比之下非常精确的watermark。
    + Google Cloud Pub/Sub
        + even if a single publisher publishes two messages in order, there’s a chance (usually small) that they might be delivered out of order 

## Watermark Propagation
+ input watermark
    + 来自
        + source specific function
        + minimum of the output watermarks of its upstream sources
+ output watermark
    + captures the progress of the stage itself
    + the minimum of the stage’s input watermark and the event times of all nonlate data active messages within the stage.
    + 会晚于input watermark
        + copmuting takes time

+  event-time latency introduced by a stage(how far delayed behind real time the output of each stage will be.)
    + output watermark - input watermark
    

## tip
+ PIPELINE STAGES
    + 不同srage对数据做不同聚合
    + e.g.  raw data -> per-user aggregates -> per-team aggregates

+ processing time(when)
    + watermark

+ event time(where)
    + windowing

+ late data
    + Late data is any data that arrives after the watermark has advanced past the event time of this data
        + 迟到的数据是指在水印已经超过该数据的事件时间之后到达的任何数据。
    + Late data is only possible with heuristic watermark creation
    + If the heuristic is a reasonably good one, the amount of late data might be very small, and the watermark remains useful as a completion estimate.

## ref
+ [Streaming System 第三章：Watermarks](https://developer.aliyun.com/article/682873)
+ [Chapter 3. Watermarks](https://learning.oreilly.com/library/view/streaming-systems/9781491983867/ch03.html#id24)