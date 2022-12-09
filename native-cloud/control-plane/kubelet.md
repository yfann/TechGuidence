
# kubelet
+ 每个node上的节点代理
    + 基于PodSpec工作
        + 确保Pod Spec中描述的容器正常运行
        + pod生命周期管理
    + 通过cAdvisor监控容器和node
        + 向api server上报node的使用情况

## Virtual-Kubelet

+ 模拟出Node
    + pod可以被调度到Virtual-Kubelet伪装出的虚拟节点

+ 用于k8s集群连接到其他API
    + k8s节点由其他服务支持(无服务器的容器平台)


## ref
+ [一文看懂 Kubelet](https://zhuanlan.zhihu.com/p/338462784)
+ [后Kubernetes时代的虚拟机管理技术之Virtual-Kubelet篇](https://www.kubernetes.org.cn/9574.html)
+ [后Kubernetes时代的虚拟机管理技术之Virtual-Kubelet篇](https://www.kubernetes.org.cn/9574.html)