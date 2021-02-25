## endpoint
+ service 转发请求到 endpoint
+ 有selector的service,会把对应的pod ip加入endpoint list中



## service指向外部服务(集群内访问集群外)

+ 方式1: 不指定Selector的服务
    + service转发到集群外的服务(非pod)
    + 不会默认创建endpoint
    + 指向外部服务
        + 创建和service同名的endpoint，endpoint中设置外部服务的IP和端口

+ 方式2：ExternalName类型服务
    + DNS会给<service-name>.<namespace>.svc.cluster.local 创建一个 CNAME 记录
        + my.database.example.com
    + 不会自动创建Cluster IP
        + 通过DNS访问
    + Endpoints 的 IP 地址不能是 127.0.0.0/8、169.254.0.0/16 和 224.0.0.0/24，也不能是 Kubernetes 中其他服务的 clusterIP。

## 集群外访问集群内

+ clusterIP 为虚拟IP,外部无法直接访问
+ 方式1: NodePort,通过 <NodeIP>:NodePort访问
+ 方式2：LoadBalancer,在cloud provider上创建一个外部的负载均衡，请求转发到<NodeIP>:Nodeport
+ 方式3：ingress
+ 方式4： ECMP将Service ClusterIP路由到每个Node,这样可以直接通过ClusterIP访问服务

## Headless 服务
+ 不需要Cluster IP的服务
    + yaml中 clusterIP: None
+ 不指定 Selectors，则添加externalName类型,通过CNAME访问
+ 指定Selector,通过 DNS A 记录设置后端 endpoint 列表
    + dig @<ip>  nginx.default.svc.cluster.local


## 保留源 IP
+ ClusterIP Service：使用 iptables 模式，集群内部的源 IP 会保留（不做 SNAT）。如果 client 和 server pod 在同一个 Node 上，那源 IP 就是 client pod 的 IP 地址；如果在不同的 Node 上，源 IP 则取决于网络插件是如何处理的，比如使用 flannel 时，源 IP 是 node flannel IP 地址。

+ NodePort Service：默认情况下，源 IP 会做 SNAT，server pod 看到的源 IP 是 Node IP。为了避免这种情况，可以给 service 设置 spec.ExternalTrafficPolicy=Local （1.6-1.7 版本设置 Annotation service.beta.kubernetes.io/external-traffic=OnlyLocal），让 service 只代理本地 endpoint 的请求（如果没有本地 endpoint 则直接丢包），从而保留源 IP。

+ LoadBalancer Service：默认情况下，源 IP 会做 SNAT，server pod 看到的源 IP 是 Node IP。设置 service.spec.ExternalTrafficPolicy=Local 后可以自动从云平台负载均衡器中删除没有本地 endpoint 的 Node，从而保留源 IP。

## ingress
+ NodePort需要额外搭建负载均衡

+ LoadBalancer要求k8s必须运行在支持负载均衡的cloud provider上面

+ ingress主要将service暴露在cluster外，可以自定义服务的访问策略

## Virtual IPs and service proxies
+ 每个Node都有kube-proxy实现virtual IP,而不是ExternalName
+ User space proxy mode
    + kube-proxy监控service和Endpoint的变化，并实现SessionAffinity
    + client--->clusterIP(iptable)----->kube-proxy---->pod
+ iptables proxy mode
    + service端安装iptables rules
    + client------>clusterIP(iptables)-------->Node

## ref
+ [服务发现与负载均衡](https://feisky.gitbooks.io/kubernetes/content/concepts/service.html)

+ [ingress](https://feisky.gitbooks.io/kubernetes/content/concepts/ingress.html)

+ [irtual-ips-and-service-proxies](https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies)