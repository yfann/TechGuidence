
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
+ specific metric used to measure the performance of a service.
+ Good events/valid events * 100%
+ 选取SLI: VALET
    + Volume(容量，流量)
        + QPS/TPS
    + Availability
        + MTBF(Mean Time Between Failure)
            + 两次故障的间隔时间
        + MTTR(Mean Time To Repair)
            + 故障的恢复时间
        + Availability = MTBF / (MTBF + MTTR)
    + Latency
    + Error
        + 5xx
        + 4xx
    + Ticket
        + 故障单
+ current value

## SLO
+ 时间范围内的几个9
+ uptime, latency
    + 99.99% uptime per month
+ goal value



## SLA
+ 不满足SLO时的补偿

## tips
+ SRE
+ 性能测试工具
    + ClusterLoader2
    + Edgemark
    + kubemark
+ measure performance -> SLO
## ref
+ [Cloud Storage Service Level Agreement (SLA)](https://cloud.google.com/storage/sla)
+ [一文读懂什么是SLI、SLO、SLA](https://zhuanlan.zhihu.com/p/358149438)
+ [A Primer on Service Level Indicator (SLI) Metrics](https://www.bmc.com/blogs/service-level-indicator-metrics/)
+ [Oreilly SLOs](https://learning.oreilly.com/library/view/slo-adoption-and/9781492075370/ch04.html#defining_slis)

<!-- SLI -->
+ [Kubernetes scalability and performance SLIs/SLOs](https://github.com/kubernetes/community/blob/master/sig-scalability/slos/slos.md#footnote1)
+ [k8s集群可扩展性和性能SLI/SLO](https://www.jianshu.com/p/de768ea3fc19)
+ [什么是 SLI](https://wallenotes.github.io/2021/10/18/%E5%8F%AF%E9%9D%A0%E6%80%A7/SLI/what_is_sli/)