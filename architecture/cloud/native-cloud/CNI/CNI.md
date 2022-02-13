# CNI


+ 容器网络的API

+ 一个框架用于创建销毁容器时动态配置网络资源
    + 为容器分配IP,加入网络


+ instances：
    + Flannel
    + Calico
        + NetworkPolicy
    + Weave
        + NetworkPolicy

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

## VXLAN

+ 虚拟化隧道通信技术
+ 使用Overlay技术
    + 三层的网络来搭建虚拟的二层网络
        + VXLAN 是在底层物理网络（underlay）之上使用隧道技术，借助 UDP 层构建的 Overlay 的逻辑网络，使逻辑网络与物理网络解耦
        + 只要是三层可达（能够通过 IP 相互通信）的网络就能部署 VXLAN
    + 对原有的网络架构几乎没有影响
+ 虚拟可扩展LAN，封装覆盖协议
    + UDP中封装2层以太帧，来实现大型云部署
+ vs VLAN
    + VLAN子网的个数 2^12
        + VXLAN 2^24
    + VLAN不是Overlay和物理机绑定
+ VTEP（VXLAN Tunnel Endpoints，VXLAN 隧道端点）
    + VXLAN 网络的边缘设备，用来进行 VXLAN 报文的处理（封包和解包）。VTEP 可以是网络设备（比如交换机），也可以是一台机器（比如虚拟化集群中的宿主机
    + VM,container 使得MAC数量巨大.而交换机的内存有序，MAC地址表有限.
    + VXLAN用VTEP将L2 frame封装在UDP中，一个VTEP可以被同一个物理机的所有VM，容器公用
        + 交换机只要记录物理机的MAC即可
+ VNI（VXLAN Network Identifier，VXLAN 网络标识符）
    + VNI 标识不同的 VXLAN 网络，使得不同的 VXLAN 可以相互隔离
+ Tunnel（VXLAN 隧道）
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

+ [VXLAN 基础教程：VXLAN 协议原理介绍](https://zhuanlan.zhihu.com/p/130277008)