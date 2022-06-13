## container to container network
+ eth0
    + 通过eth0访问外部网络

+ `ip netns add ns1` create ns1 namespace
    + `ls /var/run/netns` or `ip netns`
        + 列出所有挂载点

+ 每个进程都在一个network namespace中通信
    + 默认在root network namespace中，可以访问外部

+ 同一个pod中的container在同一个namespace中，有相同的Ip和端口
    + container通过localhost相互访问

## pod to pod network
+ 每个pod都有一个内部IP

+ 同node中pod之间通信
    + root netns通过veth和pod netns通信（veth相当于网线）
    + root netns中bridge（虚拟交换机,ARP协议寻址）把不同veth端连接在一起，使得pod之间可以通信

+ 跨node pod间通信
    + 每个node都会分配一个CIDR
        + 用来给Pod分配IP
        + 路由IP数据包
    + root ns中的bridge ARP失败的时候，会把数据包发往默认路由(root netns中的eth0).通过CIDR找到正确的node

## pod to service

+ service 相当于pod的VIP
    + clusterIP
+ k8s 负载均衡
    + Linux netfilter
        + 引导包通过网络
    + iptables
        + 用户空间
        + 定义netfilter和转换数据包的规则
        + k8s中由kube-proxy配置
            + watch kube-apiserver
                + service或pod ip变化时，iptables会自动更新
            + iptables中已经做了负载均衡，将Service VIP的流量指向pod IP
<!-- k8s新版本支持 -->
    + IPVS
        + 构建在netfilter之上
        + 实现了linux的传输层负载均衡
        + 合到LVS(linux虚拟服务器)中
## tips

+ CIDR(Classless Inter-Domain Routing)无类别域间路由
    + 用于分配IP,路由IP数据包

## ref
+ [一文搞懂Kubernetes的网络模型：Overlay和Underlay](https://jishuin.proginn.com/p/763bfbd5be01)
+ [干货分享| Kubernetes网络难懂？可能是没看到这篇文章](https://zhuanlan.zhihu.com/p/526586444)
+ [集群网络系统](https://kubernetes.io/zh/docs/concepts/cluster-administration/networking/)