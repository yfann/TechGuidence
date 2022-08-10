# kube-proxy


+ 实现k8s service的一部分，保证发往service的流量负载均衡到正确的Pod
    + Pod网络代理
    + 服务发现
    + 负载均衡(L4)(仅支持TCP,UDP，不支持HTTP)
    + pod---------->Service
    + NodePort----->Service
    + 管理endpoints
    + 负责service的实现
    + VIP----->IPtables-------->kube-proxy

+ per-node daemonset(也可以直接在node上运行)
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


## 服务发现
+ pod中的环境变量，service需要比pod先创建
+ kubeDNS

## tips
+ Cluster IP(Virtual IP)

## ref
+ [一文看懂 Kube-proxy](https://zhuanlan.zhihu.com/p/337806843)
+ [Kubernetes 【网络组件】kube-proxy使用详解](https://blog.csdn.net/xixihahalelehehe/article/details/115370095)