# client go

## Informer

+ 向K8s API server发请求获取resource状态

+ cache
    + 会缓存结果，不会每次都去API server获取
    + ResyncPeriod
        + 对缓存中的对象调用UpdateFunc

+ Listwatcher interface

+ Resource event handler
    + AddFunc
    + UpdateFunc
    + DeleteFunc

## SharedInformer

+ 多个controller共享informer

+ 只创建一份watch

+ 每个controller需要构建自己的queuing和retrying

## workqueue

+ 需要等cache完成同步后再处理


## ref

+ [Chapter 3. Basics of client-go](https://learning.oreilly.com/library/view/programming-kubernetes/9781492047094/ch03.html#client-go)


+ [A deep dive into Kubernetes controllers](https://engineering.bitnami.com/articles/a-deep-dive-into-kubernetes-controllers.html)
+ [Kubewatch, an example of Kubernetes custom controller](https://engineering.bitnami.com/articles/kubewatch-an-example-of-kubernetes-custom-controller.html)
+ [sample-controller](https://github.com/kubernetes/sample-controller)