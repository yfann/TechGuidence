# kube-proxy

+ per-node daemon

+ 实现k8s service的一部分，保证发往service的流量负载均衡到正确的Pod

+ 监听
    + service
    + endpoint/endpointslice
    + node
        + 启用服务拓扑(Service Topology)会监听node

+ 支持4种代理模式
    + userspace
    + iptables
        + O(n)
    + ipvs
        + O(1)
    + kernelspace
        + for windows


## ref
+ [一文看懂 Kube-proxy](https://zhuanlan.zhihu.com/p/337806843)