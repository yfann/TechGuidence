

## cmd

 + `ifconfig eth0:1 192.168.1.22 broadcast 192.168.1.2 netmask 255.255.255.0 up`
    + 设置vip: 192.168.1.22
    + `ping 192.168.1.22`
    + 写在`/etc/rc.local`，开机自动配置


## ref
+ [实体 IP 与虚拟 IP(VIP)是什么](https://zhuanlan.zhihu.com/p/371401849)