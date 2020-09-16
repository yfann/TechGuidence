
## metris
+ metrics type
    - core metrics
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
    - custom medtrics
        - pod(averageValue不同Pod间平均,被scale的pod和发出metrics的pod是同一个pod)
        ```yml
        type: Pods
        pods:
        metric:
            name: packets-per-second
        target:
            type: AverageValue
            averageValue: 1k
        ```
        - Object(metrics是描述相同namespace的其他对象,并非获取,target支持Value和AverageValue。对于AverageValue类型,API返回的度量指标将按照 Pod 数量拆分，然后再与target值比较)
            + describedObject的配置可以参考`kubectl get --raw "/apis/custom.metrics.k8s.io/v1beta1/namespaces/<namespace>/pods/*/<metrics name>" | jq`的返回值
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
    - External(metrics来自k8s外的对象，会扫描所有返回多个metrics,结果按sum计算)

+ aggregated API
    - metrics.k8s.io
        + metrics server(Metrics Server collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through Metrics API)
            - 实现了Resoure Metrics API
            - 从每个Node的Kubelet公开的Summary API采集
        + /apis/metrics.k8s.io/
        + 不存数据，只能获取当前值
    - custom.metrics.k8s.io
    - external.metrics.k8s.io

+ Metrics Server
    - `/apis/metrics.k8s.io/v1beta1/namespaces/<namespace-name>/pods/<pod-name>` k8sAPI获取Pod resource metrics c


## external
+ kubectl get --raw /apis/external.metrics.k8s.io/v1beta1|jq
+ kubectl get --raw "/apis/external.metrics.k8s.io/v1beta1/namespaces/kube-monitoring/kafka_topic_partition_current_offset?labelSelector=topic=fantest" | jq
```yml
- type: External
  external:
    metric:
      name: queue_messages_ready
    # selector: "queue=worker_tasks"
      selector: 
        matchLabels:
            topic: fantest
    target:
      type: AverageValue
      averageValue: 30
```

## API
+ autoscaling/v1(支持基于CPU的扩展)
+ autoscaling/v1(支持基于CPU,memory的扩展)
+ autoscaling/v2beta2(支持基于CPU,memory,custom metrics)
+ `kubectl api-versions|grep auto`
+ `kubectl get apiservices|grep metrics`


## tips
+ metrics-server(kube-system)

## ref
+ [Pod 水平自动扩缩](https://kubernetes.io/zh/docs/tasks/run-application/horizontal-pod-autoscale/)
+ [Horizontal Pod Autoscaler演练](https://kubernetes.io/zh/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)
<!-- practice -->
+ [Kubernetes HPA Autoscaling with Kafka metrics](https://medium.com/google-cloud/kubernetes-hpa-autoscaling-with-kafka-metrics-88a671497f07)
+ [Horizontal Pod Autoscaling (HPA) triggered by Kafka event](https://medium.com/@ranrubin/horizontal-pod-autoscaling-hpa-triggered-by-kafka-event-f30fe99f3948)
+ [Autoscaling on multiple metrics and custom metrics](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics)
+ [Kubernetes HPA 使用详解](https://www.qikqiak.com/post/k8s-hpa-usage/)
+ [探索Kubernetes HPA:HPA metrics type](https://zhuanlan.zhihu.com/p/89453704)
+ [Horizontal Pod Autoscaler Walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)
+ [使用k8s-prometheus-adapter实现HPA](https://www.cnblogs.com/charlieroro/p/11898521.html)
+ [Kubernetes HPA : ExternalMetrics+Prometheus](https://blog.kloia.com/kubernetes-hpa-externalmetrics-prometheus-acb1d8a4ed50)
<!-- samples -->
+ [Kubernetes HPA with Custom Metrics from Prometheus](https://towardsdatascience.com/kubernetes-hpa-with-custom-metrics-from-prometheus-9ffc201991e)

<!-- detail -->
+ [Pod 水平自动伸缩](https://kubernetes.io/zh/docs/tasks/run-application/horizontal-pod-autoscale/)
+ [资源指标管道](https://kubernetes.io/zh/docs/tasks/debug-application-cluster/resource-metrics-pipeline/)
+ [Kubernetes Metrics Serve](https://github.com/kubernetes-sigs/metrics-server)
+ [Metrics](https://github.com/kubernetes/metrics)
+ [Metrics API Implementations](https://github.com/kubernetes/metrics/blob/master/IMPLEMENTATIONS.md)
+ [Aggregation layer](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/)
+ [HPA v2 API extension proposal](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/autoscaling/hpa-external-metrics.md)
+ [metrics-server](https://github.com/kubernetes-sigs/metrics-server)
<!-- API -->
+ [Custom Metrics API](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/custom-metrics-api.md)
+ [Resource Metrics API](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/resource-metrics-api.md)

<!-- ali -->
+ [阿里云指标容器水平伸缩](https://www.alibabacloud.com/help/zh/doc-detail/151555.htm)

<!-- resource metrics -->
+ [kubernetes-sigs/metrics-server](https://github.com/kubernetes-sigs/metrics-server)
+ [kubernetes/metrics](https://github.com/kubernetes/metrics)
+ [Resource Metrics API](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/resource-metrics-api.md)

<!-- custom metrics-->
+ [Custom Metrics API](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/custom-metrics-api.md)
+ [基于Custom-metrics-apiserver实现Kubernetes的HPA（内含踩坑）](https://www.cnblogs.com/rexcheny/p/10990977.html)

<!-- external metrics-->
+ [HPA v2 API extension proposal](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/autoscaling/hpa-external-metrics.md)
+ [HPA v2 API extension proposal](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/autoscaling/hpa-external-metrics.md#add-labelselector-to-object-and-pods-metric)
+ [External Metrics API](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/external-metrics-api.md#access-control)

<!-- samples -->
+ [k8s-hpa-custom-autoscaling-kafka-metrics](https://github.com/sunnykrGupta/k8s-hpa-custom-autoscaling-kafka-metrics)
+ [custom-metrics-apiserver](https://github.com/kubernetes-sigs/custom-metrics-apiserver)
+ [终于成功部署 Kubernetes HPA 基于 QPS 进行自动伸缩](https://www.cnblogs.com/dudu/p/12217354.html)