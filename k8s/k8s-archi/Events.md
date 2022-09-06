

## Kubernetes is based on events

+ a number of independent control loops communicate purely through object changes on the API server and events these changes trigger through informers

+ Edge-driven triggers（事件触发）
    - 发出events
    - At the point in time the state change occurs, a handler is triggered—for example, from no pod to pod running.
    - latency 由处理events的 worker threads数量决定


+ Level-driven triggers(polling 轮询)
    + The state is checked at regular intervals and if certain conditions are met (for example, pod running), then a handler is triggered.
    + latency 由轮询的间隔决定

+ edge-triggerd, level-driven,resync interval
    + 间隔循环 + 事件触发(edge-triggerd)
        + 比较当前状态与期望状态(level-driven)
    + k8s的实现方式
            

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
+ [Level Triggering and Reconciliation in Kubernetes](https://hackernoon.com/level-triggering-and-reconciliation-in-kubernetes-1f17fe30333d)
+ [controller-events](https://learning.oreilly.com/library/view/programming-kubernetes/9781492047094/ch01.html#controller-events)