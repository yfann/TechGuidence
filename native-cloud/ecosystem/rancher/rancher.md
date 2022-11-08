
# Rancher
+ k8s管理工具
+ Rancher server
    + 运行在专门的k8s中
    + Rancher UI,CLI,API
    + authentication
    + 管理下游集群
        + RKE创建的集群
        + 云k8s(Amazon EKS ...)

## RKE(Rancher kubernetes engine)
+ k8s安装程序
    + support
        + OS
            + MacOS
            + Linux
            + windows
        + BMS(裸金属服务器)
        + VM

## tips
+ k3s可以用external database 保存集群数据
    + k3s server is stateless
+  hyper-converged infrastructure（HCI）超融合架构
    + 软件定义的基础架构
    + 可以虚化硬件定义的元素
    + 超融合基础架构（hyper-converged infrastructure）与 融合基础架构（converged infrastructure） 最大的区别在于，在 HCI 里面，无论是存储底层抽象还是存储网络都是在软件层面实现的（或者通过 hypervisor 层面实现），而不是基于物理硬件实现的。由于所有软件定义的元素都围绕 hypervisor 实现，因此在超融合基础架构上的所有实例可以联合共享所有受管理的资源。
## ref
+ [rancher docs](https://docs.rancher.cn/)
+ [rancher](https://docs.ranchermanager.rancher.io/zh/)
+ [Rancher Server 和 Components](https://docs.ranchermanager.rancher.io/zh/reference-guides/rancher-manager-architecture/rancher-server-and-components)

+ [RKE2](https://docs.rancher.cn/docs/rke2/_index)