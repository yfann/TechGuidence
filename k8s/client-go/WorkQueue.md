
## Work Queue

+ a work queue is a component that can be used by the event handler to handle queuing of state changes and help to implement retries
+ priority queue
+ `k8s.io/client-go/util/workqueue`
<!-- 延迟添加到work queue -->
+ DelayingInterface
+ RateLimitingInterface 

## code
```go
type Interface interface {
    Add(item interface{})
    Len() int
    Get() (item interface{}, shutdown bool)
    // controller finish get()返回的item时，需要调Done()
    Done(item interface{})
    ShutDown()
    ShuttingDown() bool
}
```
