# VLan

# VxLAN（Visual eXtensible Local Area Network，虚拟扩展本地局域网）
+ 虚拟化隧道通信技
    + 把L2的以太网(Ethernet frames)封装成L4的UDP数据报(datagrams),然后再L3的网络中传播
    + 跨域L3网络，封装感知不到L3的存在，整个过程就像在同一个 L2 广播域中传输一样

+ VXALN that carries the VLAN over the Layer3 network

+ 使用Overlay技术
    + 三层的网络来搭建虚拟的二层网络
        + VXLAN 是在底层物理网络（underlay）之上使用隧道技术，借助 UDP 层构建的 Overlay 的逻辑网络，使逻辑网络与物理网络解耦
        + 只要是三层可达（能够通过 IP 相互通信）的网络就能部署 VXLAN
    + 对原有的网络架构几乎没有影响

+ 虚拟可扩展LAN，封装覆盖协议
    + UDP中封装2层以太帧，来实现大型云部署


+ VNI（VXLAN Network Identifier，VXLAN 网络标识符）
    + VNI 标识不同的 VXLAN 网络，使得不同的 VXLAN 可以相互隔离

+ Tunnel（VXLAN 隧道）

## VTEP（VXLAN Tunnel Endpoints，VXLAN 隧道端点）
+ VxLAN的隧道端点
    + encapsulate and decapsulate the VXLAN packets

+ 一个物理机对应一个VTEP，可以被物理机的多个VM共用，TOR交换机只用记录一条VTEP即可(不用记录全部VM的MAC,避免MAC地址表的暴增)
+ VXLAN 网络的边缘设备，用来进行 VXLAN 报文的处理（封包和解包）。VTEP 可以是网络设备（比如交换机），也可以是一台机器（比如虚拟化集群中的宿主机
+ VM,container 使得MAC数量巨大.而交换机的内存有序，MAC地址表有限.
+ VXLAN用VTEP将L2 frame封装在UDP中，一个VTEP可以被同一个物理机的所有VM，容器公用
    + 交换机只要记录物理机的MAC即可

## vs VLAN
+ VLAN: L2 network,用于分割广播域
+ VXLAN可以逻辑分割VLAN
+ VLAN子网的个数 2^12 vs VXLAN 2^24
+ VLAN不是Overlay和物理机绑定
+ 物理设备组网向虚拟设备组网过度
    + VLAN最多4094个
        + VID（12bit） 
            + 0~4095
+ 使用STP
+ Vlan 在IP头打标签(tag/untag)
    + Vxlan 在原始帧中添加VxLan头
## tips
+ 隧道
+ overlay
+ underlay
+ Trunk
    + 一个端口(switch)允许N种VLAN标签(默认只支持一种)

## ref
+ [VxLAN](https://www.cnblogs.com/bakari/p/11131268.html)
+ [《跟唐老师学习云网络》 - 什么是VLAN和VXLAN](https://bbs.huaweicloud.com/blogs/111665)
+ [为什么集群需要 Overlay 网络](https://draveness.me/whys-the-design-overlay-network/)