# watermark
+ The watermark is a monotonicly increasing timestamp of the oldest work not yet completed.
    + completeness
    + visibility

+ event-time window close
    + the window does not expect any more data

## perfect watermark
+ Pipelines using perfect watermark creation never have to deal with late data

+ use cases
    + ingress timestamping
        + 入口时间戳（Ingress Timestamping) : 将数据进入系统的时间（即处理时间）当作数据的事件事件。2016年前几乎所有的流计算系统都是这样做的，这种方式非常简单，能保证数据单调递增，但是坏处是处理时间与数据真正的事件事件没有关系，数据真正的事件时间在计算过程中被抛弃了
    + static sets of time-ordered logs
        + 按时间排序的静态日志集（Static sets of time-ordered logs）：按时间排序的日志，且大小固定的数据源（比如某个kafka topic中，有固定数量的partition，且每个partition中数据的event time严格单调递增）。这种场景中，只需要知道有几个partition，和每个partition中待处理数据中eventtime最早的事件即可得出watermark。

+ tips
    + 所以使用perfect watermark的关键是保证数据源数据在event time上单调递增

## heuristic watermark(accurate heuristic watermarks)
+ an estimate that no data with event times less than the watermark will ever be seen again
+ Pipelines using heuristic watermark creation might need to deal with some amount of late data
+ use cases
    + Dynamic sets of time-ordered logs
        + 按事件排序的动态日志集：一系列动态结构化日志文件（比如：每个日志文件内部的数据在event time上单调递增，但是文件之间时间没有关系）。所有文件的数据进入Kafka后，在event time上就不能保证单调递增了。在这种场景下，可以通过跟踪最早的待处理数据的event time，数据增长率，网络拓扑，可用带宽等信息，来得到一个相比之下非常精确的watermark。
    + Google Cloud Pub/Sub
        + even if a single publisher publishes two messages in order, there’s a chance (usually small) that they might be delivered out of order 

## Watermark Propagation
+ Understanding how watermarks propagate across independent stages is important in understanding how they affect the pipeline as a whole and the observed latency of its results.

+ PIPELINE STAGES
    + e.g.  raw data -> per-user aggregates -> per-team aggregates
    

## tip

+ windowing
    + Fixed windows
    + Sliding windows
    + Sessions

+ input watermark
    + Input watermark 是指在处理流数据时，对于输入数据中的事件时间（event time）的一个度量。
    + 它表示系统认为已经观察到的事件中的最大事件时间。换句话说，它是已处理的事件时间的上界。
    + 用于协调和解决无序事件的问题，确保在处理事件时不会太超前，从而维护正确的事件顺序。

+ output watermark
    + Output watermark 是指由流处理引擎生成的标记，表示输出流中事件时间的一个度量。
    + 它表示系统认为所有已观察到的输入事件已经在输出中得到处理的事件时间的上界。
    + 用于确保在输出中没有来自未来的事件，以保持结果的正确性。


## ref
+ [Streaming System 第三章：Watermarks](https://developer.aliyun.com/article/682873)
+ [Chapter 3. Watermarks](https://learning.oreilly.com/library/view/streaming-systems/9781491983867/ch03.html#id24)