# watermark
+ The watermark is a monitonically increasing timestamp of the oldest work not yet completed.
    + completeness
    + visibility

+ event-time window close
    + the window does not expect any more data

## perfect watermark
+ Pipelines using perfect watermark creation never have to deal with late data
+ use cases
    + ingress timestamping
        +  the source watermark simply tracks the current processing time as observed by the pipeline
        + event time is processing time
    + static sets of time-ordered logs
        + e.g., an Apache Kafka topic with a static set of partitions, where each partition of the source contains monotonically increasing event times

## heuristic watermark(accurate heuristic watermarks)
+ an estimate that no data with event times less than the watermark will ever be seen again
+ Pipelines using heuristic watermark creation might need to deal with some amount of late data
+ use cases
    + Dynamic sets of time-ordered logs
        + each individual file containing records with monotonically increasing event times relative to other records in the same file but with no fixed relationship of event times between files
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
