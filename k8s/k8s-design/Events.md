

## Kubernetes is based on events
+ + a number of independent control loops communicate purely through object changes on the API server and events these changes trigger through informers

+ Edge-driven triggers（事件触发）
    - At the point in time the state change occurs, a handler is triggered—for example, from no pod to pod running.
    - latency 由处理events的 worker threads数量决定

+ Level-driven triggers(polling 轮询)
    + The state is checked at regular intervals and if certain conditions are met (for example, pod running), then a handler is triggered.
    + latency 由轮询的间隔决定


+ watch events
    + API server --------(watch events)---------> controller(informer)
        + watch
    + invisible to the user，only the object updates are visible


+ top-level events
    + is a resource like pods...
        + `kubectl get events`
    + from etcd
    + a user-visible logging mechanism




## ref
+ [Events, the DNA of Kubernetes [Updated]](https://www.mgasch.com/post/k8sevents/)