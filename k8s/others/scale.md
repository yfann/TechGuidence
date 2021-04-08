## metrics 类型
+ resource metrics
    + `metrics.k8s.io`
    + `type:Resource`
    + `type: ContainerResource`
        + 根据应用容器的Cpu,忽略sidecar的消耗
    + metrics server提供
        + 做为集群插件启动
    + metrics API to HPA
        + cpu/memory

+ custom metrics
    + `custom.metrics.k8s.io`
    + `type: pods/object`
    + your cluster must be able to communicate with the API server providing the custom Metrics API
    + 各种第三方Adapter


+ external Metrics API
    + `external.metrics.k8s.io`
    + `type: External`
    + not related to any k8s object
    + 各种第三方Adapter

## Metrics Server
+ collect resource metrics from kubelet
+ expose metrics through Metrics API
    + for 
        + CPU/Memory based for HPA
        + Vertical Pod Autoscaler
+ `kb get po -l k8s-app=metrics-server --all-namespaces`
+ `kubectl get apiservices --all-namespaces`

## tips
+ multiple resource metrics for a HPA
    + k8s 1.6+


## ref
+ [Horizontal Pod Autoscaler](https://kubernetes.io/zh/docs/tasks/run-application/horizontal-pod-autoscale/)
+ [Vertical Pod Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler)

+ [kubernetes-sigs/metrics-server](https://github.com/kubernetes-sigs/metrics-server)
+ [kubernetes/metrics](https://github.com/kubernetes/metrics)

+ [ingress](https://kubernetes.io/zh/docs/concepts/services-networking/ingress/)