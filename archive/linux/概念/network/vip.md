
# vip

+ vip可以漂移在不同的device上

+ 一般用于高可用

+ 每台主机都有ARP缓存(ARP协议)，存储同一个网络内的IP与MAC的映射
    + 以太网中的主机发送数据时会会先从缓存查询IP的MAC
    + 发生切换时，新的主机会向网络发送ARP数据包，更新VIP与MAC的对应关系

+ 创建Vip的两种方式
    + 别名IP
    + 辅助IP

## cmd


<!-- 别名ip -->
+ `ifconfig eth0:1 192.168.1.22 broadcast 192.168.1.2 netmask 255.255.255.0 up` 添加
    + 设置vip: 192.168.1.22
    + `ping 192.168.1.22`
    
+ `ifconfig eth0:1 192.168.1.22 broadcast 192.168.1.2 netmask 255.255.255.0 down`  删除

+ `ifconfig -a` 查看

<!-- 辅助ip -->
+ `ip addr add <ip> dev eth0`

+ `ip addr del <ip> dev eth0`

+ `ip a` 查看


<!-- 卡机启用 -->
+ 写在`/etc/rc.local`，开机自动配置
<!-- or -->
+ /etc/sysconfig/network-scripts
    + cp ifcfg-eth0 ifcfg-eth0:1
        + 并更改ip,重启网卡



## tips

+ vip主机不能直接连Internet
    + NAT


    


## ref
+ [实体 IP 与虚拟 IP(VIP)是什么](https://zhuanlan.zhihu.com/p/371401849)
+ [LVS专题-(3) 虚拟ip理解](https://www.cnblogs.com/crazylqy/p/7741958.html)
<!-- issues -->
+ [ECS 上使用 vip 的解决方案](https://kinkinlu.com/2019/10/17/ECS-%E4%B8%8A%E4%BD%BF%E7%94%A8-vip-%E7%9A%84%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/a)