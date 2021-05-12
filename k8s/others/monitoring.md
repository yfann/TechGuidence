
## tips
+ metrics API
    + 获取node或pod的当前使用量
+ kube-state-metrics
    + 使用client-go与Kubernetes集群通信,不断轮询api-server

## level of service
+ SLI(service level indicators)
    + unit:rate,average,percentile,fraction
    + request latency
    + error rate
    + requests per second
    + availability(几个9)

+ SLO(objectives)
    + SLI的目标值
        + SLI<=target
+ SLA(agreements)



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

## prometheus k8s metrics
+ Node exporter
    + cpu 
    + mem
    + network
    + monitor nodes
+ kube-state-metrics 
    + pod metrics
    + resource
    + focused on orchestration metadata: deployment, pod, replica status, etc.
    + a simple service that listens to the Kubernetes API server and generates metrics about the state of the objects such as deployments, nodes, and pods
+ Metrics server
    +  focused on implementing the resource metrics API: CPU, file descriptors, memory, request latencies, etc
    + cluster-wide aggregator of resource usage data
+ Kubernetes control plane metrics
    + etcd
    + dns
    + kubelet

## ref

+ [Resource metrics pipeline](https://kubernetes.io/zh/docs/tasks/debug-application-cluster/resource-metrics-pipeline/)
+ [kubernetes/metrics](https://github.com/kubernetes/metrics)
+ [Tools for Monitoring Resources](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)

+ [借助 Elastic Stack 实现可观察性](https://www.elastic.co/cn/blog/observability-with-the-elastic-stack)
+ [Service Level Objectives](https://sre.google/sre-book/service-level-objectives/)

<!-- k8s metrics -->
+ [elastic metricbeat-----Kubernetes metrics](https://www.elastic.co/guide/en/beats/metricbeat/7.9/exported-fields-kubernetes.html)
+ [kubernetes/kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)
    + [kubernetes/kube-state-metrics](https://github.com/kubernetes/kube-state-metrics/tree/master/docs)
+ [从容器监控kube-stats-metrics看k8s众多组件](https://segmentfault.com/a/1190000023177361)
+ [Tools for Monitoring Resources](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)
    + `metrics.k8s.io`
        + cpu/memory
    + `custom.metrics.k8s.io`
    + `external.metrics.k8s.io`


<!-- prometheus -->
+ [部署 Prometheus 和 Grafana 监控 Pod 指标](http://docs.dubhe.ai/docs/setup/monitor-pod-indicator-information/)
+ [k8s监控指标汇总，prometheus采集k8s原理解析](https://segmentfault.com/a/1190000038888544)
+ [Kubernetes Pod Metrics](https://grafana.com/grafana/dashboards/747)