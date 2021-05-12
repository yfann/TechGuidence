
## tips
+ 网络层(ip,port)控制流量

+ 应用为中心
    + 隔离pod
+ 策略累积
    + Ingress/Egress并集
+ 为了允许两个 Pods 之间的网络数据流，源端 Pod 上的出站（Egress）规则和 目标端 Pod 上的入站（Ingress）规则都需要允许该流量。 

+ 集群的入站和出站机制通常需要重写数据包的源 IP 或目标 IP
    + loadbalancer


## ref
+ [网络策略](https://kubernetes.io/zh/docs/concepts/services-networking/network-policies/)
+ [网络插件](https://kubernetes.io/zh/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/)
+ [Why You Should Test Your Kubernetes Network Policies](https://www.inovex.de/blog/test-kubernetes-network-policies/)

+ [Guide to Kubernetes Ingress Network Policies](https://www.openshift.com/blog/guide-to-kubernetes-ingress-network-policies)
<!-- alicloud -->
+ [使用网络策略（Network Policy）](https://www.alibabacloud.com/help/zh/doc-detail/97621.htm)