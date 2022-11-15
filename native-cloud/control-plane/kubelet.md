
# kubelet
+ 每个node上的节点代理
    + 基于PodSpec工作
        + 确保Pod Spec中描述的容器正常运行
        + pod生命周期管理
    + 通过cAdvisor监控容器和node
        + 向api server上报node的使用情况

## ref
+ [一文看懂 Kubelet](https://zhuanlan.zhihu.com/p/338462784)
+ [后Kubernetes时代的虚拟机管理技术之Virtual-Kubelet篇](https://www.kubernetes.org.cn/9574.html)