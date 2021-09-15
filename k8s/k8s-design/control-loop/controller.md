

## Control loop

1. read state of resources,event-driven
2. change state of objects in the cluster
3. Update status of the resource in step 1 via the API server in etcd
4. repeat cycle

+ 根据当前状态决定 next command
    + 如果没有next command --> steady state


+ 可以更改cluser obj和集群外对象的状态

## [Kubernetes is based on events](../Events.md)



## Optimistic Concurrency
+ Omega’s parallel scheduler
    + concurrent operations without locks

+ optimistic concurrency
    + resource version conflict error
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

## implementation for controller

+ client-go
    + informer 
    + workqueue
    + sample-controller

+ kubebuilder
    + reconcile创建的resource,状态变化时会触发reconcile

+ operator
    + controller-runtime
    + watch(resource)
    + Kube OpenAPI Specification
    + OwnerReferences
    + composition tree

+ KuDo



## ref
+ [Control Loop](https://kubernetes.io/zh/docs/concepts/architecture/controller/)
+ [Chapter 6. Solutions for Writing Operators](https://learning.oreilly.com/library/view/programming-kubernetes/9781492047094/ch06.html#idm46336859365144)
+ [Level Triggering and Reconciliation in Kubernetes](https://hackernoon.com/level-triggering-and-reconciliation-in-kubernetes-1f17fe30333d)
+ [Kubernetes 控制器的工作原理解读](https://fuckcloudnative.io/posts/a-deep-dive-into-kubernetes-controllers/)

<!-- tools -->
+ [kudo](https://kudo.dev/docs/cli/installation.html#cli-installation)
    + go framework for operator
+ [shell-operator](https://github.com/flant/shell-operator)
    + bash script to implement operator
+ [Kubernetes Clients](https://github.com/kubernetes-client)

<!-- community -->
+ [API Machinery](https://learning.oreilly.com/library/view/programming-kubernetes/9781492047094/ch06.html#idm46336854811816)