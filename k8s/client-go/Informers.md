

## tips
<!-- k8s.io/apimachinery/pkg/watch -->
```go
// Interface can be implemented by anything that knows how to watch and
// report changes.
type Interface interface {
    // Stops watching. Will close the channel returned by ResultChan(). Releases
    // any resources used by the watch.
    Stop()

    // Returns a chan which will receive all the events. If an error occurs
    // or Stop() is called, this channel will be closed, in which case the
    // watch should be completely cleaned up.
    ResultChan() <-chan Event
}


// EventType defines the possible types of events.
type EventType string

const (
    Added    EventType = "ADDED"
    Modified EventType = "MODIFIED"
    Deleted  EventType = "DELETED"
    Error    EventType = "ERROR"
)

// Event represents a single event to a watched resource.
// +k8s:deepcopy-gen=true
type Event struct {
    Type EventType

    // Object is:
    //  * If Type is Added or Modified: the new state of the object.
    //  * If Type is Deleted: the state of the object immediately before
    //    deletion.
    //  * If Type is Error: *api.Status is recommended; other types may
    //    make sense depending on context.
    Object runtime.Object
}
```
+ Informers are a combination of this event interface and an in-memory cache with indexed lookup
+ Under the hood informers first call List on the client to get the set of all objects (as a baseline for the cache) and then Watch to update the cache. 
+ Informers give a higher-level programming interface for the most common use case for watches: in-memory caching and fast, indexed lookup of objects by name or other properties in-memory.


## tips
+ one GroupVersionResource one informer
+ shared informer factory 创建共享informer
+ process
    + in memory store
    + first list call加载对象到store中
    + watch对象变更，更新store中的对象
    + Lister(get,list) store中的对象
        + event handler中的对象是LIster返回的不能直接修改，要先deepcopy再修改

+ 和直接call API相比有lag

## code
```go
// get a shared informer
import (
    ...
    "k8s.io/client-go/informers"
)
...
clientset, err := kubernetes.NewForConfig(config)
informerFactory := informers.NewSharedInformerFactory(clientset, time.Second*30)
podInformer := informerFactory.Core().V1().Pods()
podInformer.Informer().AddEventHandler(cache.ResourceEventHandlerFuncs{
    // 一般用来添加 modified obj to workqueue
    AddFunc: func(new interface{}) {...},
    UpdateFunc: func(old, new interface{}) {...},
    DeleteFunc: func(obj interface{}) {...},
})
informerFactory.Start(wait.NeverStop)
// wait for the first List calls to the clients to finish
informerFactory.WaitForCacheSync(wait.NeverStop)
pod, err := podInformer.Lister().Pods("programming-kubernetes").Get("client-go")
```