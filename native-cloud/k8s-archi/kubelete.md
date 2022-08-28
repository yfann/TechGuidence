## Kubelet

+ 保证pod/container达到期望状态
    + PodSpec

+ 容器健康检查
    + livenessProbe

+ 资源使用监控(CPU,Memory,网络...)
    + CAdvisor

## Virtual-Kubelet

+ 模拟出Node
    + pod可以被调度到Virtual-Kubelet伪装出的虚拟节点

+ 用于k8s集群连接到其他API
    + k8s节点由其他服务支持(无服务器的容器平台)


## ref
+ [后Kubernetes时代的虚拟机管理技术之Virtual-Kubelet篇](https://www.kubernetes.org.cn/9574.html)