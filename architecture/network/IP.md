# IP

+ IP地址
    + 网络ID
        + 同一个网络ID下可以直接通信不需要路由器
        + 每个网段的第一个与最后一个不能用
        + 网络位全0，访问同一网段的其他主机时使用
    + 主机ID
        + 主机位全0，IP表示网络地址
        + 主机位全1，IP表示本网段内的广播地址

+ 32位二进制
    + 十进制格式表示
    + 每8位分割，四段


+  IP v6 `::` 等同于IP V4的0.0.0.0


+ dynamic IP
    + ISP(internet service provider)
        + DHCP(动态主机配置协议)
            + provide dynamic IP

+ dynamic DNS
    + 为dynamic IP动态更新DNS

+ 子网
    + 缩小了iP范围
    + 子网掩码
        + 划分子网

## 网络分类

+ A,B,C,D,E类网络
+ A类
    + 前8位为网络地址
    + 最高位0
    + 1.0.0.0~126.0.0.0

+ B类
    + 前16位为网络地址
    + 最高位10
        + 1000 0000 - 1011 1111
    + 128.0.0.0~191.255.255.255

+ C类
    + 前24位为网络地址
    + 最高位110

+ 0.0.0.0
    + 未知地址

+ 255.255.255.255
    + 当前子网的广播地址
    + 指本网段内的所有主机

+ 私有地址
    + 这类地址 不会在Internet出现
        + 只在私网中使用
            + 如果随意设置私网IP，则接入到Internet时会引起混乱
            + 接入Internet时会地址翻译(nat)
    + A类：10.0.0.0~10.255.255.255
    + B类：172.16.0.0~172.31.255.255
    + c类：192.168.0.0~192.168.255.255
    

## CIDR：无类域间路由

+ 子网掩码
    + 32位
        + example: 11111111.11111111.11111000.00000000 (255.255.248.0)
        + example: 192.168.23.35/21 
            + 21位表示网络
            + 掩码：11111111.11111111.11111000.00000000
    + 划分网络地址和主机地址
    + 网络位可以任意指定

+ 在A,B,C类中再化子网

## ref
+ [IP、子网、超网（CIDR）、网段知识讲解](https://blog.csdn.net/qq_39414668/article/details/79594012)
+ [子网、局域网、网段的关系](https://blog.csdn.net/jeffleo/article/details/54174835) 
+ [什么是子网](https://www.cloudflare.com/zh-cn/learning/network-layer/what-is-a-subnet/)
+ [A 类，B 类和 C 类网络地址](https://segmentfault.com/a/1190000030695900)

+ [CIDR的IP地址的表示与划分方法](https://blog.csdn.net/han156/article/details/77817031)
+ [详解IP地址后面斜杠加具体数字](https://blog.csdn.net/hzhsan/article/details/44100215)

