
## tips
+ 不同name space下的Pod通过DNS查找服务
    - `<service name>.<namespace>`
    - 相同namespace下直接查找`<service name>`
+ 服务以`my-svc.my-namespace.svc.cluster-domain.example`名分配给 DNS A或AAAA(IPv4,IPv6)
    - 普通服务会解析成服务的集群IP
    - Headless服务(无集群IP)会解析成服务对应的Pod集合的IP,可以轮询这组IP
+ Deployment或DaemonSet创建的Pods有对应的DNS解析项
    - `pod-ip-address.deployment-name.my-namespace.svc.cluster-domain.example`
## ref
+ [Pod 与 Service 的 DNS](https://kubernetes.io/zh/docs/concepts/services-networking/dns-pod-service/)
+ [Kubernetes DNS-Based Service Discovery](https://github.com/kubernetes/dns/blob/master/docs/specification.md)
+ [DNS域名解析中A、AAAA、CNAME、MX、NS、TXT、SRV、SOA、PTR各项记录的作用](https://itbilu.com/other/relate/EyxzdVl3.html)