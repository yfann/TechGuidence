
# KEDA(Kubernetes Event-Driven Autoscaling)
+ a Kubernetes-based Event Driven Autoscaler.
+ 允许用户在 Kubernetes 上构建自己的以事件驱动的应用程序

## KEDA vs HPA
+ HPA
    + HPA根据CPU，内存扩展workload
    + 无法从0到1，从1到0

+ KEDA可以更具消息数量扩展
    + 根据MQ中的消息数量扩展MQ的实例数

## tips

+ azure function

## ref
+ [keda](https://keda.sh/docs/2.8/concepts/#architecture)
+ [KEDA｜Kubernetes中基于事件驱动的自动伸缩](https://cloud.tencent.com/developer/article/1692169)
+ [Kubernetes HPA 很好用吧，那是你还没遇上更强的 KEDA (基于事件驱动的自动伸缩)...](https://blog.csdn.net/easylife206/article/details/121550937)