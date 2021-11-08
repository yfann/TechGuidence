
## commands

+ `ls -lah /proc/<server proc>/fd`
    + list sockets

+ `strace ./main`
    + capture all systemcalls from web server program

+ debug web server
    + `strace`
    + `curl`
    + `telnet`

+ `ifconfig`/`ip`
    + network interface
        + ens(pysical network interface)
        + lo(loopback interface)


## network interface
+ 物理或虚拟
    + computer用来和外部通信 
+ 可被分配多个IP


## Network Namespace(netns)

+ 网络隔离
    + 不同网络拥有不同network interface



## veth pair
+ 连接两个隔离的netns
   + netns0(网络协议)-->veth0--->veth1---->netns1(网络协议)
   + 类似网线串联两台电脑

+ 成对出现虚拟网络设备接口

+ 构建虚拟网络拓扑
    + 随着设备增多，网络变复杂
        + 解决方案：bridge


## tun/tap

+ tun是网络层的虚拟网络设备
    + 收发三层数据报文(IP层数据包...)
    + 用于点对点IP隧道(OpenVPN,IPSec...)
        + 例如OpenVPN的桥接模式可以从外部打一条隧道到本地网络。进来的机器就像本地的机器一样参与通讯，丝毫看不出这些机器是在远程。

+ tap是链路层的虚拟网络设备
    + 等同于以太网设备
    + 收发二层数据包(MAC层，以太网数据包)
    + 用作虚拟机的网卡或普通机器的虚拟网卡
        + 可以和物理网卡通过网桥相连，组成二层网络


## bridge interface

+ 虚拟交换机
    + 类似物理交换机(switch)

+ 二层交换(物理层，链路层)
    + MAC

+ 可以绑定veth pair, tun/tap

+ bridge本身也是一种虚拟网络设备
   + 具有IP,MAC

## loopback interface(环回网络接口)

+ 127.0.0.1(localhost)
+ 只能用于本地communication
+ 网络层实现
    + 网络层发送报文时发现目标IP为本机，则交给loopback interface处理，不进入数据链路层.loopback发送回网络层，交由应用层程序处理

+ 虚拟网卡IP属于本机IP,与宿主机公用一个网络协议栈

+ netns内部IP不属于本机IP,netns有独立的网络协议有自己的loopback interface

## Packet Handling in the Kernel

+ Netfilter
    + hooks
    + userspace的program处理packets
        + drop,modify

+ Conntrack
    + firewall
    + NAT

+ Routing
    + `route`

+ IPVS(IP Virtual Server)
    + Linux connection(L4) load balancer

+ eBPF
    + sandboxed program run in the Kernel
    + `tcpdump`

## iptables
+ 用于创建firewall,audit logs,mutate&reroute packets
+ 使用Netfilter
+ tables
    + chains
        + rules
        + Netfilter hooks
+ functionality
    + Filter
        + firewall-related rules
    + NAT
    + Mangle
        + non-NAT packet-mutating rules


## Network Troubleshooting tools

+ checking connectivity
    + traceroute
    + ping
    + telnet
    + netcat

+ Port scanning
    + nmap

+ Checking DNS records
    + dig

+ Checking HTTP/1
    + cURL
    + telnet
    + netcat

+ Checking HTTPS
    + OpenSSL
    + cURL

+ Checking listening programs
    + netstat


## tips

+ ports
    + 1~1023(well-known ports/privileged port)
        + 需要root权限绑定
    + >=1024(nonprivileged port)
        + 8080
    + external request--->well-known ports---->redirects(load balancer)---->nonprivileged ports(program listening)

+ IP
    + wildcard address(作为socket binding时匹配所有IP)
        + IPv4: 0.0.0.0
        + IPv6: [::]

+ establish tcp connection
    + keepalive????

+ ethX 物理网卡
+ brX linux bridge port
+ vethX veth pair

## ref

+ [网络](../../architecture/network/网络.md)

+ [Linux Bridge 详解](https://zhuanlan.zhihu.com/p/293667316)
+ [Linux tun:tap 详解](https://zhuanlan.zhihu.com/p/293658778)
+ [Linux netns 详解](https://zhuanlan.zhihu.com/p/293659403)
+ [Linux veth pair 详解](https://zhuanlan.zhihu.com/p/293659939)
+ [Linux 环回网络接口](https://zhuanlan.zhihu.com/p/351560182)