
## tips
+ metrics type
    - resource(cpu,memory)
        ```yml
         metrics:
            - type: Resource
                resource:
                name: cpu
                target:
                    type: Utilization
                    averageUtilization: 50
        ```
    - pod(不同Pod间平均,仅支持AverageValue)
    ```yml
    type: Pods
    pods:
      metric:
        name: packets-per-second
      target:
        type: AverageValue
        averageValue: 1k
    ```
    - Object(描述相同namespace的其他对象,并非获取,target支持Value和AverageValue。对于AverageValue类型,API返回的度量指标将按照 Pod 数量拆分，然后再与target值比较)
    ```yml
    type: Object
    object:
        metric:
            name: requests-per-second
        describedObject:
            apiVersion: networking.k8s.io/v1beta1
            kind: Ingress
            name: main-route
        target:
            type: Value
            value: 2k
    ```

+ aggregated API
    - metrics.k8s.io
        + metric-server
            - 实现了Resoure Metrics API
            - 从每个Node的Kubelet公开的Summary API采集
        + Heapster
            - 也可用Heapster实现 
        + /apis/metrics.k8s.io/
        + 不存数据，只能获取当前值
    - custom.metrics.k8s.io
    - external.metrics.k8s.io

+ Metrics Server
    - `/apis/metrics.k8s.io/v1beta1/namespaces/<namespace-name>/pods/<pod-name>` k8sAPI获取Pod resource metrics c

## ref
<!-- practice -->
+ [Horizontal Pod Autoscaler演练](https://kubernetes.io/zh/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)
+ [Kubernetes HPA Autoscaling with Kafka metrics](https://medium.com/google-cloud/kubernetes-hpa-autoscaling-with-kafka-metrics-88a671497f07)
+ [Horizontal Pod Autoscaling (HPA) triggered by Kafka event](https://medium.com/@ranrubin/horizontal-pod-autoscaling-hpa-triggered-by-kafka-event-f30fe99f3948)
+ [Autoscaling on multiple metrics and custom metrics](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics)
+ [Kubernetes HPA 使用详解](https://www.qikqiak.com/post/k8s-hpa-usage/)
<!-- detail -->
+ [Pod 水平自动伸缩](https://kubernetes.io/zh/docs/tasks/run-application/horizontal-pod-autoscale/)
+ [资源指标管道](https://kubernetes.io/zh/docs/tasks/debug-application-cluster/resource-metrics-pipeline/)
+ [Kubernetes Metrics Serve](https://github.com/kubernetes-sigs/metrics-server)
+ [Kubernetes monitoring architecture](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/monitoring_architecture.md)
+ [Metrics](https://github.com/kubernetes/metrics)
+ [Metrics API Implementations](https://github.com/kubernetes/metrics/blob/master/IMPLEMENTATIONS.md)
+ [Aggregation layer](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/)