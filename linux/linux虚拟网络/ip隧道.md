
# IP隧道
+ 为了在TCP/IP网络中传输其他协议的数据包
+ 在源协议数据包上再套上一个IP协议头来实现，形成的IP数据包通过Internet后卸去IP头，还原成源协议数据包，传送给目的站点。对源协议数据来说，就如被IP带着过了一条隧道。

## 实现
+ 隧道就是一条特定的路径
+ 开发一种新的IP封包协议
    + IPIP
+ 也可以通过封包空间把未直接连接的机器绑在一起，从而创建虚拟网络

## 应用
+ IPIP
    + Mobile-IP
    + IP-Multicast
+ VPN(Virtual Private Network)

## ref
+ [什么是 IP 隧道，Linux 怎么实现隧道通信？](https://cloud.tencent.com/developer/article/1432489)
+ [Linux中IP隧道](https://sites.google.com/site/emmoblin/linux-network-1/linux-zhongip-sui-dao)