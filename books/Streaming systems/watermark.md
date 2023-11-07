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

## heuristic watermark
+ an estimate that no data with event times less than the watermark will ever be seen again
    + Pipelines using heuristic watermark creation might need to deal with some amount of late data

