# iptables

+ 防火墙
+ 基于内核的netfilter(packet filtering framework)
+ iptables 与协议栈内有包过滤功能的hook交互 ，这些hook构成了netfilter框架
    + hook
        + 每个网络包经过协议栈时会触发这些hook

## netfilter
+ hooks
    + NF_IP_PRE_ROUTING
    + NF_IP_LOCAL_IN
    + NF_IP_FORWARD
    + NF_IP_LOCAL_OUT
    + NF_IP_POST_ROUTING
## ip tables
+ 规则分为不同的table
    + tables
        + nat table(地址转换)
        + filter table(是否允许包通过)
            + 防火墙
        + Mangle Table
            + 修改包的IP头
        + Raw Table
        + Security Table
            + 给包打上SELinux标记
    + talbe内部规则组成chain
        + 由hook触发

## ref

+ [NAT 穿透是如何工作的：技术原理及企业级实践](https://zhuanlan.zhihu.com/p/450235047)
+ [How NAT traversal works](https://tailscale.com/blog/how-nat-traversal-works/)
+ [ NAT - 网络地址转换](https://arthurchiao.art/blog/nat-zh/)