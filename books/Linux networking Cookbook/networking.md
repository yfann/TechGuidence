## Router

+ forward packets between networks

+ perform NAT(Network Address Translation)
    + private IP->IPv4

## cmd

+ `ifconfig` 查看网卡
    + `ifconfig eth0 up/down` 开启关闭网卡

+ `ip a` `ip addr` 查看网卡ip,mac
    + `ip a show eth0` 查看指定网卡

+ `ip link` 查看链路层
    + `ip link show eth0`
    + `ip link set eth0 up/down` 启用指定接口

## tips

+ eth0
    + 物理网卡
    + /etc/sysconfig/network-scripts
        + 一个网卡对应一个配置文件

+ lo
    + loopback


## ref
+ [ifconfig 中的 eth0 eth0:1 eth0.1 与 lo](https://www.cnblogs.com/jokerjason/p/10695189.html)