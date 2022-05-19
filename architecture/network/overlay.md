# overlay network
+ An overlay network is a virtual network routed on top of the underlay network infrastructure

## underlay network
+ a physical network that lets you connect between the networking devices
    + routers
    + switches
    + firewalls
+ Underlay网络就是传统IT基础设施网络，由交换机和路由器等设备组成，借助以太网协议、路由协议和VLAN协议等驱动
+ 容器网络中的Underlay网络
    + 借助驱动程序将宿主机的底层网络接口直接暴露给容器使用的一种网络构建技术，
        + MAC VLAN
            + 同一个以太网接口上虚拟出多个网络接口，每个虚拟接口都拥有唯一的MAC地址
        + IP VLAN
            + 创建新的虚拟网络接口并为每个接口分配唯一的IP地址
            + 每个虚拟接口将共享使用物理接口的MAC地址
## tips
+ 隧道转发的本质是将容器双方的通信报文分别封装成各自宿主机之间的报文，借助宿主机的网络“隧道”完成数据交换
    + VXLAN协议是目前最流行的Overlay网络隧道协议之一
        + 底层网络没有侵入性

## ref
+ [What Is VXLAN? The Difference Between Overlay And Underlay](https://getlabsdone.com/what-is-vxlan-overlay-and-underlay-networks/)
+ [一文搞懂Kubernetes的网络模型：Overlay和Underlay](https://jishuin.proginn.com/p/763bfbd5be01)