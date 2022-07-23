# iptables

+ 防火墙
+ 基于内核的netfilter(packet filtering framework)
    + iptables在用户空间
    + netfilter在内核空间
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

## tips
+ network level
    + not application level

## ref
+ [A Deep Dive into Iptables and Netfilter Architecture](https://www.digitalocean.com/community/tutorials/a-deep-dive-into-iptables-and-netfilter-architecture)
    + [深入理解 iptables 和 netfilter 架构***网络***](https://arthurchiao.art/blog/deep-dive-into-iptables-and-netfilter-arch-zh/)
+ [理解 Istio Service Mesh 中 Envoy 代理 Sidecar 注入及流量劫持](https://jimmysong.io/blog/envoy-sidecar-injection-in-istio-service-mesh-deep-dive/)
+ [iptables](https://wangchujiang.com/linux-command/c/iptables.html)

+ [一个奇葩的网络问题，把技术砖家"搞蒙了"](https://mp.weixin.qq.com/s?__biz=MzkyMTIzMTkzNA==&mid=2247506496&idx=1&sn=c629e22f0de944c0940ffb3a665b726f&chksm=c1842d11f6f3a407e2200d28da9033c23a411bdc64f85ddb756c0ff36d660eed38338e611d1f&scene=21#wechat_redirect)
+ [洞悉linux下的Netfilter&iptables：什么是Netfilter？](https://zhuanlan.zhihu.com/p/486823403)