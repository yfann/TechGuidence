# OpenKruise

+ k8s标准扩展
+ 原地升级(避免删除Pod)
+ Sidecar管理
    + 可以在单独的CR中定义sidecar container
+ 跨多可用区部署
    + 每个可用区上创建一个workload

## CRD
+ CloneSet
    + 原地升级
    + 发布顺序可配
    + 灰度发布

+ SidecarSet

## ref
+ [Kubernetes应用管理器OpenKruise之CloneSet](https://zhuanlan.zhihu.com/p/339040526)