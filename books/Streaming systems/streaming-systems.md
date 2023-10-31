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
+ windowing
    + Fixed windows
    + Sliding windows
    + Sessions
## ref
+ [Streaming 101: The world beyond batch](https://www.oreilly.com/radar/the-world-beyond-batch-streaming-101/)
+ [Streaming 102: The world beyond batch](https://www.oreilly.com/radar/the-world-beyond-batch-streaming-102/)
+ [How to beat the CAP theorem](http://nathanmarz.com/blog/how-to-beat-the-cap-theorem.html)
+ [Why local state is a fundamental primitive in stream processing](https://www.oreilly.com/content/why-local-state-is-a-fundamental-primitive-in-stream-processing/)


+ [MillWheel: Google是如何在事件流处理上做到exactly one semantic的](https://zhuanlan.zhihu.com/p/30560148)


+ [approximate Top-N](https://www.databricks.com/blog/2015/01/28/introducing-streaming-k-means-in-spark-1-2.html)
+ [Realtime Trending Analysis with Approximate Algorithms](https://pkghosh.wordpress.com/2014/09/10/realtime-trending-analysis-with-approximate-algorithms/)