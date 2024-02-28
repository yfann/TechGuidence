# Processing-Time windows
+ use cases
    + usage monitoring
+ processing-time windowing is sensitive to the order that input data are encountered

## convert event-time window to Processing-time window
+ triggers
    + Ignore event time (i.e., use a global window spanning all of event time) and use triggers to provide snapshots of that window in the processing-time axis.
+ ingress time
    + assign ingress times as the event times for data arriving

## ref
+ [Advanced Windowing](https://learning.oreilly.com/library/view/streaming-systems/9781491983867/ch04.html)