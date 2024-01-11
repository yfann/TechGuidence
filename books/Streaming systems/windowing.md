# windowing

+ processing time window

+ evnet time window
    + 需要考虑何时complete
        + 因为processing time 和 event time没有对应关系
    + reflect the times at which those events actually happened
    + correctness
    + drawbacks：windows must often live longer (in processing time) than the actual length of the window itself
        + Buffering
            + Due to extended window lifetimes, more buffering of data is required.
        + Completeness
            + watermark

## fixed time window
+ time-based aggregations
+ handle out-of-order or late
+ no overlap
+ continuously updating

## sliding time winodws
+ overlap
+ can move or slide over the data stream 
+ use cases
    + compute running aggregates
        + 计算最近60秒内的平均值，数据每30秒更新一次
            + 定义一个60 秒的窗口，每30秒移动一次
    + anomaly detection 

## session windows
+ groups data elements based on periods of inactivity or "gaps" in the data stream
+  session windows are useful for grouping data elements that are related to specific events or activities, such as user sessions or device usage. This allows you to compute event- or device-level metrics.
+ use cases
    + user session
    + device-level metrics

## single global window
+  This means that all elements in the data stream are processed together and no windowing is applied

+ process all the data elements in your data stream as a whole, without breaking them up into smaller windows

+ use cases
    + filter out invalid data
    +  your data streams are already time-stamped and you want to process events in the order they arrive

+ The single global window with a default trigger generally requires the entire data set to be available before processing, which is not possible with continuously updating data. To perform aggregations on an unbounded PCollection that uses global windowing, you should specify a non-default trigger for that PCollection.

## ref
+ [beam windowing](https://tour.beam.apache.org/tour/java/windowing/windowing-concept)