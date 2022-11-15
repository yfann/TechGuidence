## Resource Quota
+ namespace的整体资源
    + 所有container的cpu, memory的request,limit总和

## Limit Ranges
+ 用于单个容器reqeust/limit的默认值

## tips

+ minimize the gap between Request and Usage
+ Crane
+ AHPA
+ QoS
    + Guaranteed
    + Burstable
    + BestEffort

## ref
+ [容器云调度优化及实践](https://www.cnblogs.com/tencent-cloud-native/p/15608942.html)
+ [kubernetes 降本增效标准指南| 资源利用率提升工具大全](https://mp.weixin.qq.com/s/tjpSneIghbGlRpAg1qkhHA)
+ [容器云调度优化及实践](https://www.bilibili.com/video/BV1iD4y117JL/?spm_id_from=333.999.0.0&vd_source=d3c0a53193a65728ad278e633b3790e5)
+ [配置 Pod 的服务质量(QoS)](https://kubernetes.io/zh-cn/docs/tasks/configure-pod-container/quality-service-pod/)
