
## tips
+ metrics API
    + 获取node或pod的当前使用量

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

## kube-state-metrics
+ kube-state-metrics使用client-go与Kubernetes集群通信,不断轮询api-server

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
<!-- prometheus -->
+ [部署 Prometheus 和 Grafana 监控 Pod 指标](http://docs.dubhe.ai/docs/setup/monitor-pod-indicator-information/)
+ [k8s监控指标汇总，prometheus采集k8s原理解析](https://segmentfault.com/a/1190000038888544)