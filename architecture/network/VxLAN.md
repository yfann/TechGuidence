
# VxLAN（Visual eXtensible Local Area Network，虚拟扩展本地局域网）
+ 隧道封装技术
    + 把L2的以太网(Ethernet frames)封装成L4的UDP数据报(datagrams),然后再L3的网络中传播
    + 跨域L3网络，封装感知不到L3的存在，整个过程就像在同一个 L2 广播域中传输一样

+ 物理设备组网向虚拟设备组网过度
    + VLAN最多4094个
        + VID（12bit） 
            + 0~4095

## tips
+ 隧道
+ overlay
+ underlay

+ VTEP(VxLAN Tunnel Point)
    + VxLAN的隧道端点
    + 一个物理机对应一个VTEP，可以被物理机的多个VM共用，TOR交换机只用记录一条VTEP即可(不用记录全部VM的MAC,避免MAC地址表的暴增)

## ref
+ [VxLAN](https://www.cnblogs.com/bakari/p/11131268.html)