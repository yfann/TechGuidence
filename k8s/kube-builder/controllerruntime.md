




## tips
+ CreateOrUpdate()
```go
CreateOrUpdate(ctx, client, obj, mutate)
client.Get(obj)
mutate(obj)
//If obj did not exist, client.Create(obj)
//If obj did exist, client.Update(obj)
```
    + mutate() 
        + 更改obj内容
        + 应该精确的在field上修改，而不是整体覆盖
            + 整体覆盖可能会导致metadata丢失而update()失败，或status丢失

+ SetControllerReference()
    + ownerReferences
        + CR controller创建的obj应该加上ownerReferences，这样CustomResource删除时，相关的资源也会被删除
        + garbage collector



## ref
+ [Package controllerruntime](https://pkg.go.dev/sigs.k8s.io/controller-runtime@v0.6.3)
+ [kubernetes-sigs/controller-runtime](https://github.com/kubernetes-sigs/controller-runtime/blob/v0.2.2/pkg/controller/controllerutil/controllerutil.go#L124)
<!-- details -->
+ [How we built a controller using KubeBuilder with Test Driven development, Part 1](https://engineering.pivotal.io/post/gp4k-kubebuilder-lessons/)

+ [Garbage Collection](https://kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/)
+ [ControllerRef proposal](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/api-machinery/controller-ref.md)