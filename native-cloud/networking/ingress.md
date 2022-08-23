
# ingress
+ loadbalance service + ingress controller(nginx)
    + nginx代理请求到不同的service
        + 这样不同service共享一个loadbalancer，公用一个Pulic IP

+ loadbalance type类型对应一个k8s集群外的真实的loadbalancer

## ref
+ [几张大图就把 Kubernetes Ingress 来龙去脉搞清楚了](https://zhuanlan.zhihu.com/p/486016590)
+ [Ingress Controllers：Kubernetes 的瑞士军刀](https://www.kubernetes.org.cn/9840.html)