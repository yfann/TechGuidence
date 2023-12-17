
## tips
+ 不同name space下的Pod通过DNS查找服务
    - `<service name>.<namespace>`
    - 相同namespace下直接查找`<service name>`
+ 服务以`my-svc.my-namespace.svc.cluster-domain.example`名分配给 DNS A或AAAA(IPv4,IPv6)
    - 普通服务会解析成服务的集群IP
    - Headless服务(无集群IP)会解析成服务对应的Pod集合的IP,可以轮询这组IP
+ Deployment或DaemonSet创建的Pods有对应的DNS解析项
    - `pod-ip-address.deployment-name.my-namespace.svc.cluster-domain.example`



## A记录 

+ 普通服务
    + `my-svc.my-namespace.svc.cluster-domain.example`
    + 记录着服务的cluster IP

+ 无头服务
    + `my-svc.my-namespace.svc.cluster-domain.example`
    + 记录了selctor pod的ip集合
        + 轮询方式访问

+ pod
    + `pod-ip-address.my-namespace.pod.cluster-domain.example`
    + deployment暴露的pod域名
        + `pod-ip-address.deployment-name.my-namespace.svc.cluster-domain.example`

## SRV记录

+ 命名端口会创建SRV记录
    + 普通服务
        + 解析
            + 端口
            + 或域名`my-svc.my-namespace.svc.cluster-domain.example`
    + 无头服务
        + 解析成多个结果(每个Pod各一个)
            + `auto-generated-name.my-svc.my-namespace.svc.cluster-domain.example`


+ `_my-port-name._my-port-protocol.my-svc.my-namespace.svc.cluster-domain.example`


## ref
+ [自定义 DNS 服务](https://kubernetes.io/zh/docs/tasks/administer-cluster/dns-custom-nameservers/)
+ [Pod 与 Service 的 DNS](https://kubernetes.io/zh/docs/concepts/services-networking/dns-pod-service/)
+ [Kubernetes DNS-Based Service Discovery](https://github.com/kubernetes/dns/blob/master/docs/specification.md)
+ [调试 DNS 问题](https://kubernetes.io/zh/docs/tasks/administer-cluster/dns-debugging-resolution/) 

+ [DNS域名解析中A、AAAA、CNAME、MX、NS、TXT、SRV、SOA、PTR各项记录的作用](https://itbilu.com/other/relate/EyxzdVl3.html)