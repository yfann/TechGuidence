# kubeproxy

## iptables模式

+ iptalbes 高效防火墙，数据处理和过滤
    + 可以hook不同规则

+ kubeproxy中NAT pre-routing Hook
    + 实现NAT    
    + 负载均衡

+ O(n)

+ 负载均衡
    + 只有随机平等的选择算法

## IPVS模式

+ 负载均衡
    + 有不同负载均衡算法

+ 连接过程复杂度O(1)


## tips

+ 性能差异于建立的连接数相关

## ref

+ [kube-proxy 模式对比：iptables 还是 IPVS？](https://blog.fleeto.us/post/iptables-or-ipvs/)