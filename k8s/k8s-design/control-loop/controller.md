

## Control loop

1. read state of resources,event-driven
2. change state of objects in the cluster
3. Update status of the resource in step 1 via the API server in etcd
4. repeat cycle

+ 根据当前状态决定 next command
    + 如果没有next command --> steady state

## Kubernetes is based on events
+ Edge-driven triggers（事件触发）
    - At the point in time the state change occurs, a handler is triggered—for example, from no pod to pod running.
    - latency 由处理events的 worker threads数量决定

+ Level-driven triggers(polling 轮询)
    + The state is checked at regular intervals and if certain conditions are met (for example, pod running), then a handler is triggered.
    + latency 由轮询的间隔决定


## Optimistic Concurrency
+ Omega’s parallel scheduler
+ When concurrent write happens, it rejects the latter of the two write operations. It is then up to the client (controller, scheduler, kubectl, etc.) to handle a conflict and potentially retry the write operation.
```go
// retry loop
var err error
for retries := 0; retries < 10; retries++ {
    // foo的ObjectMeta中包含resource version
    // resource version conflict error
    foo, err = client.Get("foo", metav1.GetOptions{})
    if err != nil {
        break
    }

    <update-the-world-and-foo>

    _, err = client.Update(foo)
    if err != nil && errors.IsConflict(err) {
        continue
    } else if err != nil {
        break
    }
}
```
+ resource version
    + etcd key/value version.
    + etcd maintains a counter that increases each time the value of a key (which holds the object’s serialization) is modified



## ref
+ [The Mechanics of Kubernetes](https://dominik-tornow.medium.com/the-mechanics-of-kubernetes-ac8112eaa302)
+ [Control Loop](https://kubernetes.io/zh/docs/concepts/architecture/controller/)
+ [Level Triggering and Reconciliation in Kubernetes](https://hackernoon.com/level-triggering-and-reconciliation-in-kubernetes-1f17fe30333d)