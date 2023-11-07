# Streaming Systems
+ A type of data processing engine that is designed with infinite datasets in mind


+ unbounded, unordered data  processing

+ correctness(streaming system需要解决的问题)
    + consistent storage
        + strong consistency is required for exactly-once processing

+ time domain
    + Event time
        + This is the time at which events actually occurred.
    + Processing time
        + This is the time at which events are observed in the system.
    + processing-time lag and event-time skew 

## Data Processing Patterns
<!-- Bounded Data processing-->
+ processing engine
    + MapReduce

<!-- unbounded data processing -->
+ batch
    + fixed windows
    + sessions
        + e.g. for a specific user

+ streaming
    + time-agnostic
        + Time-agnostic processing is used for cases in which time is essentially irrelevant
        + process
            + Filtering
            + Inner joins
    + approximation
    + windowing by processing time
        + monitoring scenarios
    + windowing by event time
        + drawbacks
            + windows must often live longer (in processing time) than the actual length of the window itself
        + buffering
        + Completeness

## window
+ 时间窗口（Time Windows）：这种窗口根据时间来划分数据。时间窗口可以是固定的（例如，每分钟处理一次数据），滑动的（例如，每分钟处理一次数据，但窗口之间可以重叠），或会话型的（根据用户会话的开始和结束时间创建窗口）。

+ 计数窗口（Count Windows）：这种窗口根据数据记录的数量来划分数据。例如，您可以定义一个窗口，包含每个窗口中的前1000个数据记录。

+ 合并窗口（Tumbling Windows）：这种窗口是非重叠的，每个窗口都不包含前一个窗口的数据。合并窗口通常用于批处理和批处理模型的流式化。

+ 滑动窗口（Sliding Windows）：这种窗口是可以重叠的，每个窗口包含前一个窗口的一部分数据。滑动窗口用于连续处理数据流，以确保不错过有趣的数据模式。

## streaming
+ windowing
    + Fixed windows
    + Sliding windows
    + Sessions

+ When in processing time are results materialized?
    + Repeated update triggers
        + 满足条件会立刻更新数据
        + processing-time delay（processing-time延时更新）
            + aligned delays
                + fixed regions of processing time(多长时间更新一次)
                + all updates happen at once
            + unaligned delays
                + 相同的更新间隔，但更新点在每个window都不一样
                + the better choice for large-scale processing because they result in a more even load distribution over time.
        + low latency
        + no way to reason about completeness

    + watermarks(low watermark,Completeness triggers)
        + provide a notion of completeness 
        + Watermarks are temporal notions of input completeness in the event-time domain
        + F(P) → E
            + no more data with event times less than E will ever be seen again
        + types
            + perfect watermark
            + heuristic watermarks
                + provide an estimate of progress that is as accurate as possible
                + it might sometimes be wrong, which will lead to late data
                + windows are materialized as the watermark passes the end of the window
        + Watermark completeness trigger
        + shortcomings
            + too slow
                + high latency
            + too fast
                + lack correctness
    
    + Early/On-Time/Late Triggers
        + combination of update trigger and watermark trigger

+ How do refinements of results relate? 
    + accumulation

## tips
+ Kappa Architecture

+ microbatch engines

+ dataset
    + cardinality
        + Bounded data
        + Unbounded data
    + consititution
        + table
        + stream
            + mapReduce

+ batch is really just a subset of streaming


## ref
+ [Streaming 101: The world beyond batch](https://www.oreilly.com/radar/the-world-beyond-batch-streaming-101/)
+ [Streaming 102: The world beyond batch](https://www.oreilly.com/radar/the-world-beyond-batch-streaming-102/)
+ [How to beat the CAP theorem](http://nathanmarz.com/blog/how-to-beat-the-cap-theorem.html)
+ [Why local state is a fundamental primitive in stream processing](https://www.oreilly.com/content/why-local-state-is-a-fundamental-primitive-in-stream-processing/)


+ [MillWheel: Google是如何在事件流处理上做到exactly one semantic的](https://zhuanlan.zhihu.com/p/30560148)


+ [approximate Top-N](https://www.databricks.com/blog/2015/01/28/introducing-streaming-k-means-in-spark-1-2.html)
+ [Realtime Trending Analysis with Approximate Algorithms](https://pkghosh.wordpress.com/2014/09/10/realtime-trending-analysis-with-approximate-algorithms/)