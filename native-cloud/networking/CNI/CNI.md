# CNI(Container Network Interface)


+ 容器网络的API

+ 一个框架用于创建销毁容器时动态配置网络资源
    + 为容器分配IP,加入网络
    + 注容器的网络连接以及当容器删除时移除被分配的网络资源

+ instances：
    + Flannel
    + Calico
        + NetworkPolicy
    + Weave
        + NetworkPolicy
    + Cilium 
        + eBPF

+ 实现模式
    + Overlay
        + 隧道打通，不依赖底层网络
        + 创建Pod快，网络性能差
        + 应用层网络，建立在另一个网络的网络，虚拟链路
    + 路由
        + 靠路由打通，部分依赖底层网络
    + Underlay
        + 底层网络打通，依赖底仓网络
        + 创建pod慢，性能快

## Docker网络

+ none 容器添加到容器的网络堆栈中,没有对外链接

+ host 容器添加到host的网络堆栈中,没有隔离

+ default bridge 容器可以通过IP地址相互链接

+ custom bridge

## Flannel
+ Overlay，将 TCP 数据包装在另一种网络包里面进行路由转发和通信
+ flanneld
    + 在每个主机上，为host分配子网，为Pod分配IP
        + 同一主机下不同pod属于同一子网，不同host的pod属不同子网
    + etcd存储网络配置
    + 数据包通过VXLAN,UDP,host-gw模式转发
    + docker0->flannel0
+ 实现容器间和主机间网络
+ 3层overlay网络
    + 不同环境无需额外配置
+ 每个节点(host)都是一个子网
    + docker桥为容器分配IP
+ 同主机的容器通过docker桥通信
+ 不同主机间容器通过flanneld将数据封装在UDP数据包中
+ 一般用VXLAN作为后端

## Calico
+ 不仅提供主机和pod之间的网络连接，还涉及网络安全和管理
+ 3层，BGP路由协议在主机间路由数据包
    + 不需要将数据包封装在额外的层中
+ Istio集成
+ 支持network policy
    + 强大的网络规则

## Canal
+ Flannel + Calico
+ 双倍的配置

## Weave
+ 每个节点(host)间创建网状overlay网络
    + 智能路由
+ 每台主机安装路由组件
    + Open vSwitch
    + sleeve
+ 支持network policy
+ 网络加密
    + NaCI


## tips


+ Overlay网络：建在现有网络上的虚拟网络
    + 封装: 用于从虚拟网络转换到底层地址空间
    + VXLAN,NVGRE,STT

+ Mesh network: 每个节点连接到其他节点来协作路由

+ BGP(边界网关协议)：管理边缘路由器之间数据包的路由方式
    + 数据从一个网络发到另一个网络
    + CNI插件的路由机制

## ref

+ [Kubernetes CNI网络最强对比：Flannel、Calico、Canal和Weave](https://segmentfault.com/a/1190000018698263)
+ [CNI 这么多，怎么选？| 容器网络系列第1期](https://www.kubernetes.org.cn/9843.html)
+ [VXLAN 基础教程：VXLAN 协议原理介绍](https://zhuanlan.zhihu.com/p/130277008)
+ [云原生钻石课程 | 第6课：Kubernetes网络架构原理深度剖析（上）](https://zhuanlan.zhihu.com/p/487232482)
+ [k8s networking](https://jimmysong.io/kubernetes-handbook/concepts/flannel.html)
    + Flannel
    + Calico
    + Cilium