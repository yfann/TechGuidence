
## cmd

+ `ip a`  查看ip
    + `ip addr | grep inet`
    + `eth0` Ethernet interface
    + `lo` loopback, the system uses to communicate with itself
    + `wlan0` wireless network
    
+ `ifconfig`
    + `ifconfig -a`
    + `ifconfig eth0`
    + `sudo ifconfig eth1 up`
        + `sudo ifconfig wlan0 down`

+ `cat /etc/sysconfig/network-scripts/ifcfg-eth0`
    + 启动网卡
        + ONBOOT=yes
    + 修改后重启网络服务
        + `sudo service network restart`


+ `route -n`


## iptables

+ `iptalbes -h`

+ `iptables -F` 
    + 关闭防火墙

## tips

+ user/kernel

+ 网卡
    + 一端为协议栈(IP,TCP,UDP)
    + 另一端
        + 驱动程序(物理网卡)

+ tun/tap，vxlan、veth pair 
    + 虚拟网卡

## ref

+ [如何学习 Linux 内核网络协议栈](https://segmentfault.com/a/1190000021227338)

<!-- others -->
+ [ifconfig](https://www.computerhope.com/unix/uifconfi.htm)
+ [Linux Static IP Configuration](https://www.linode.com/docs/guides/linux-static-ip-configuration/)