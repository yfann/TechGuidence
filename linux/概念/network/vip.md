
# vip

+ 每台主机都有ARP缓存(ARP协议)，存储同一个网络内的IP与MAC的映射
    + 以太网中的主机发送数据时会会先从缓存查询IP的MAC
    + 发生切换时，新的主机会向网络发送ARP数据包，更新VIP与MAC的对应关系


## cmd

<!-- 设置vip -->
+ `ifconfig eth0:1 192.168.1.22 broadcast 192.168.1.2 netmask 255.255.255.0 up`
    + 设置vip: 192.168.1.22
    + `ping 192.168.1.22`
    + 写在`/etc/rc.local`，开机自动配置

+ `ip addr show eth0`

## tips

+ vip主机不能直接连Internet
    + NAT

+ vip主要用途
    + HA
        + VIP漂移
    


## ref
+ [实体 IP 与虚拟 IP(VIP)是什么](https://zhuanlan.zhihu.com/p/371401849)
+ [LVS专题-(3) 虚拟ip理解](https://www.cnblogs.com/crazylqy/p/7741958.html)