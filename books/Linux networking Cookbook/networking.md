## Router

+ forward packets between networks

+ perform NAT(Network Address Translation)
    + private IP->IPv4

## cmd

+ `ifconfig` 查看网卡
    + `ifconfig eth0 up/down` 开启关闭网卡

+ `ip a`/`ip addr` 查看网卡ip,mac
    + `ip a show eth0` 查看指定网卡

+ `ip link` 查看链路层
    + `ip link show eth0`
    + `ip link set eth0 up/down` 启用指定接口

## tips

+ eth0
    + 物理网卡
    + `/etc/sysconfig/network-scripts` Red Hat/CentOS
        + 一个网卡对应一个配置文件
    + `/etc/network/interfaces` Debian/Ubuntu

+ lo
    + loopback


## router(Connecting servers on the same subnet)
<!-- A---》-B--》-C -->
+ `ip link set dev eth0 up` 开启网卡(A)
+ `ip addr add dev eth0 192.168.0.2/24` 分配ip(A)
+ `ip addr list eth0` 查看eth0(A)
+ `ip route add default via 192.168.0.1` 添加默认路由(A)
    + 192.168.0.1为linux B的eth0 ip
        + 同一个子网中
        + A默认gateway 0.0.0.0
    + 如果不在同一个subnet中，gateway需要指定
    + route forward any non-local packets to IP 192.168.0.1
        + B acts like a router
+ `echo net.ipv4.ip_forward=1 > /etc/sysctl.conf`Enable routing on (B)
    + `sysctl -p /etc/sysctl.conf`Enable routing on(B)
+ B 有两个网卡eth0,eth1
    + 分别关联A,C的eth0


## NAT(local network to Internet)
+ NAT
    + 修改packet header
        + 把source server IP改为router IP
        + source server Ip 为 internal IP(RFC1918)

+ create eth2
    + 连接cable modem or ISP's router
    + IP为DHCP发送来的IP
```sh
# auto eth2
# iface eth2 inet dhcp
```

+ `iptables`
    + to enable NAT
    + interfacing with the Linux kernel firewall
    + the netfilter subsystem

```sh
/sbin/iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
# -t nat   track packet in nat table
# -A add the rule to the chain
# -o specifies the output interface
# -j what to do if matches the rule, MASQUERADE the packet(modify IP)
/sbin/iptables -A FORWARD -i eth2 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
# -m matches a packet property
# eth2(internet)-------packet------->eth0(lan)
# FORWARD 处理router出来的packet
/sbin/iptables -A FORWARD -i eth0 –o eth2 -j ACCE PT
```

## DHCP(Dynamic Host Configuration Protocol)

+  


## ref
+ [ifconfig 中的 eth0 eth0:1 eth0.1 与 lo](https://www.cnblogs.com/jokerjason/p/10695189.html)
+ [Linux 网络接口配置（/etc/network/interfaces）](https://blog.csdn.net/u011077672/article/details/71123319)

<!-- details -->
+ [Connecting two networks](https://learning.oreilly.com/library/view/linux-networking-cookbook/9781785287916/ch01s05.html#ch01lvl2sec12)