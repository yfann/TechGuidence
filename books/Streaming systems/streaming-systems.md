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
    + 
## tips
+ Kappa Architecture
+ streaming engine
    + MillWheel
    + Apache Flink
    + Flink snapshotting
+ microbatch engines
+ dataset
    + cardinality
        + Bounded data
        + Unbounded data
    + consititution
        + table
        + stream
            + mapReduce

## ref
+ [Streaming 101: The world beyond batch](https://www.oreilly.com/radar/the-world-beyond-batch-streaming-101/)
+ [Streaming 102: The world beyond batch](https://www.oreilly.com/radar/the-world-beyond-batch-streaming-102/)
+ [How to beat the CAP theorem](http://nathanmarz.com/blog/how-to-beat-the-cap-theorem.html)
+ [Why local state is a fundamental primitive in stream processing](https://www.oreilly.com/content/why-local-state-is-a-fundamental-primitive-in-stream-processing/)


+ [MillWheel: Google是如何在事件流处理上做到exactly one semantic的](https://zhuanlan.zhihu.com/p/30560148)