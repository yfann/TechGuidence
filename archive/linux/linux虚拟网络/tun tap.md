# tun/tap

+ 虚拟网络设备
+ 用于构建VPN
+ tun/tap设备的用处是将协议栈中的部分数据包转发给用户空间的应用程序，给用户空间的程序一个处理数据包的机会
    + VPN（IPSec）


## cmd
<!-- check tun model -->
+ `modinfo tun`
+ `lsmod | grep tun`

<!-- tunctl tool-->
+ `yum install tunctl`
+ `tunctl help`

<!-- 查看创建的设备-->
+ `ip link list`
+ `ifconfig -a`

<!-- tap绑定ip -->
+ `ip addr add local 192.168.100.1/24 dev tap_test`

+ `ip tunnel help`


### 配置ipip隧道
<!-- 需要tap先连通 -->
+ `lsmod | grep ip` 查看是否有ipip模块
+ `modprobe ipip` 加载ipip模块
<!-- 不同namespace中分别建立tun -->
+ `ip netns exec ns1 ip tunnel add tun1 mode ipip remote 192.168.200.2 local 192.168.100.2 ttl 255`
    + `ip tunnel add tun1 mode ipip` 创建tun类型的设备 tun1, 隧道模式为ipip
    + `remote 192.168.200.2 local 192.168.100.2`
        + 远端192.168.200.2
        + 本地192.168.100.2
        + 对应各自namespace的tap
        + 隧道外层IP
+ `ip netns exec ns1 ip link set tun1 up`
+ `ip netns exec ns1 ip addr add 192.168.50.10 peer 192.168.60.10 dev tun1`
    + tun1是个点对点设备
        + 自身ip: 192.168.50.10
        + 对端IP: 192.168.60.10 
    + 都是ipip隧道的内层IP


## tap
+ 操作二层以太网帧
    + 数据链路层数据包
    + 可以和物理网课桥接
+ /dev/tapX
+ tap也称虚拟以太设备
    + 和Ethernet协议对应
+ 在数据链路层的协议
    + point-to-point protocol
    + Ethernet(以太网)--------对应------> tap
    + High-Level Data Link Protocol
    + Frame Relay(帧中继)
    + Asynchronous Transfer Mode

## tun
+ 网络层(IP)的点对点设备
+ IP层隧道，隧道通信tunel
+ linux的ip隧道基于tun
+ 操作三层IP包
    + 无法和物理网卡桥接
    + 可以通过三层交换(ip_forward)与物理网课连通
+ /dev/tunx
    + 通过设备文件收发数据包
    + application --write data--> /dev/tunx ---data--> 内核协议栈
    + 内核协议栈 ---data--> /dev/tunx <--read data-- application

## tips
+ linux tun模块实现 tun/tap
+ linux支持5种 L3 tunnel
    + ipip
        + IP in IP, IPv4的报文基础上封装IPv4报头文
    + gre
        + 通用路由封装(Generic Routing Encapsulation),任意网络层协议上封装任意其他网络层协议, IPv4/IPv6 over IPv4
    + sit
        + IPv4的报头封装IPv6的报文， IPv6 over IPv4
    + isatap
        + 站内自动隧道寻址协议，IPv4网络中的IPv6/IPv4节点间通信
    + vti
        + Virtual tunnel interface, 为IPsec隧道提供可路由的接口类型

## ref
+ [tap/tun 是什么](https://www.cnblogs.com/bakari/p/10450711.html)
+ [Kubernetes网络自学系列 | 给用户态一个机会：tun/tap设备](https://zhuanlan.zhihu.com/p/595048552)
