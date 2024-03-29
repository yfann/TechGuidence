# VLAN（Virtual Local Area Network，虚拟局域网）
+ 虚拟局域网（VLAN）允许将一个物理网络划分为多个逻辑网络，每个 VLAN 看起来像是一个独立的网络
    + 并且它们之间的通信就好像它们在不同的物理网络中一样

+ 隔离流量
    + 不同 VLAN 中的设备在逻辑上被隔离，这意味着它们的广播和多播流量不会跨越 VLAN 边界。这提高了网络的安全性和性能

+ 使用 VLAN 需要支持 VLAN 的交换机。交换机能够根据 VLAN 标签将流量划分到正确的 VLAN。

+ VLAN 通常通过交换机和路由器实现。
    + 交换机用于在同一物理网络上划分 VLAN，而路由器则用于在不同 VLAN 之间进行通信


## vlan vs lan
+ LAN 是一个物理层面上的概念，指的是地理上较小的网络。
    + VLAN 是一个逻辑层面上的概念，通过在物理网络上创建虚拟分割，允许逻辑上的隔离。
+ LAN 是通过物理隔离实现的，而 VLAN 是通过逻辑隔离实现的。
    + VLAN 允许在同一物理网络中的设备进行逻辑上的划分，而它们仍然可以连接到同一个交换机。
+ LAN 可能跨越一个建筑、校园或公司办公室
    + 而 VLAN 可能存在于任何大小的网络中，包括跨越不同地理位置的网络。

## vlan vs 子网
+  VLAN 操作在数据链路层，而子网操作在网络层。
+  VLAN 的主要目的是实现逻辑上的隔离，允许在同一物理网络中创建多个逻辑网络。子网的主要目的是对 IP 地址进行逻辑划分，以提高路由效率