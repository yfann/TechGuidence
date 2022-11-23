
# Measure Performance
<!-- four golden signals -->
+ latency
    + total milliseconds
+ Traffic
    + http requests/second
+ Errors
    + number of 500 responses
+ Saturation
    + percentage of CPU/Memory used


## SLI(Service Level Indicator)
+ Good events/valid events * 100%
## SLO
+ 围绕SLI构建
+ 时间范围内的几个9

## SLA
+ 不满足SLO时的补偿

## tips
+ SRE
+ 性能测试工具
    + ClusterLoader2
    + Edgemark
    + kubemark

## ref
+ [Cloud Storage Service Level Agreement (SLA)](https://cloud.google.com/storage/sla)
+ [一文读懂什么是SLI、SLO、SLA](https://zhuanlan.zhihu.com/p/358149438)
+ [A Primer on Service Level Indicator (SLI) Metrics](https://www.bmc.com/blogs/service-level-indicator-metrics/)
+ [Oreilly SLOs](https://learning.oreilly.com/library/view/slo-adoption-and/9781492075370/ch04.html#defining_slis)
<!-- SLI -->
+ [Kubernetes scalability and performance SLIs/SLOs](https://github.com/kubernetes/community/blob/master/sig-scalability/slos/slos.md#footnote1)
+ [k8s集群可扩展性和性能SLI/SLO](https://www.jianshu.com/p/de768ea3fc19)