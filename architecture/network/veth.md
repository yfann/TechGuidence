# veth
+ Virtual Ethernet
    + 虚拟一台网
+ veth-pair 一对虚拟设备接口
+ 成对出现
    + 一端连着协议栈
    + 一端彼此相连

+ 充当桥梁，连接各自虚拟网络设备
    + namespace相连
    + bridge,OVS之间相连
    + docker container相连

## cmd

<!-- veth0 ping veth1 -->
+ `ping -I veth0 10.1.1.3 -c 2`
<!-- 抓包查看过程 -->
+ `tcpdump -nnt -i veth0`


## ref
+ [一文总结 Linux 虚拟网络设备 eth, tap/tun, veth-pair ](https://www.cnblogs.com/bakari/p/10494773.html)
<!-- debug -->
+ [Linux 虚拟网络设备 veth-pair 详解，看这一篇就够了](https://www.cnblogs.com/bakari/p/10613710.html)