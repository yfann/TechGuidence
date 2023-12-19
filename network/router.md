
## 三层路由
+ 可以跨子网
    + 三层路由器允许将大型网络划分成更小的子网
+ IP路由
+ 网关

## 二层路由
+ 二层路由器工作在数据链路层，主要用于同一子网内的通信。
+ 它使用 MAC 地址来进行路由
+ 划分广播域
    + 减少广播风暴
+ Switching
    + MAC Switching
        + Switch 使用 MAC 地址表来学习和记忆连接到各个端口的设备的 MAC 地址。这样，Switch 能够根据目标设备的 MAC 地址来转发数据帧
    + VLAN Switching
        + Switch 可以在不同的 VLAN 之间进行交换，提供更好的网络隔离


## tips
+ 子网
    + 实现逻辑隔离
    + 好地管理网络流量和减少广播域的大小
+ 广播风暴（Broadcast Storm）
    + 它指的是网络中大量的广播消息导致网络传输速率急剧增加，从而引起网络性能的严重下降
    + 广播（将信息发送到网络中的所有设备）
        + ARP请求
            + 将IP解析为MAC
            + 只有拥有目标IP地址的设备会响应
        + 广播地址（Broadcast Address）
            + 通常是目标MAC地址为全1的地址（FF:FF:FF:FF:FF:FF）
        + DHCP请求
            + 动态主机配置协议（DHCP）用于动态分配IP地址
            + 发送DHCP请求，获取IP地址
        + 网络发现协议
            + mDNS
            + LLMNR


## ref
+ [天天讲路由，那 Linux 路由到底咋实现的！？](https://www.51cto.com/article/698945.html)
+ [linux route 命令工作原理](https://blog.csdn.net/aibisoft/article/details/23135637)