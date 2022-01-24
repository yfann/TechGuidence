
# Flannel

+ 网络规划实现

+ 给集群中的Node提供一个三层网络
    + 不控制如何组网，只关心流量如何在Node间流动

+ CNI
    + 容器网络的API
    + instances：
        + Flannel
            + Overlay，将 TCP 数据包装在另一种网络包里面进行路由转发和通信
            + flanneld
                + 在每个主机上，为host分配子网，为Pod分配IP
                    + 同一主机下不同pod属于同一子网，不同host的pod属不同子网
                + etcd存储网络配置
                + 数据包通过VXLAN,UDP,host-gw模式转发
                + docker0->flannel0
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

## tips

+ flannel0接收docker网桥数据，维护路由表，对数据封包转发(VXLAN)

+ 路由表存在etcd中
    + 保证每个node上的flannel看到的数据一致

+ Pod内容器通信
    + Pod内容器在同一个Network Namespace下，共享同一网卡，可以直接通信

+ 同主机Pod间容器通信
    + Docker会在每个主机上建一个Docker0网桥，主机上所有pod的容器都接入网桥，可以通信

+ 跨主机Pod间容器通透性
    + CNI

## ref

+ [循序渐进理解CNI机制与Flannel工作原理***网络***](https://blog.yingchi.io/posts/2020/8/k8s-flannel.html)
    + TUN设备
    + 隧道
+ [Flannel原理](https://bbs.huaweicloud.com/forum/thread-83838-1-1.html)