## k8s networking


+ relies on CNI

+ All containers must communicate with each other without NAT.

+ Nodes can communicate with containers without NAT.

+ A container’s IP address is the same as those outside the container that it sees itself as.



## Node & Pod  network layout

+ nodes
    + Kubelet
        + CNI plugins
            + manages pod IP addresses and individual container network provisioning.

+ Nodes and pods must have L3 connectivity in this IP address space.
    + L3默认不通外网

+ pod没有MAC，L2没法用

## cluster's network
+ Isolated Networks
    + cluster内部pod互通
    + cluster不能被外网访问
    + security
    + 由于cluster间不互连,不同cluster可以使用相同IP
    + nodes have L3 connectivity with the broader network, but pods do not.

+ Flat networks
    + cluster之间互联
    + 外网可以访问任意cluster的任意pod
    + cluster ip,pod ip,pod CIDR都不相同
    + 可以使用load balancer
    + 需要大量IP,可以划分子网
    + requires a single CIDR for pod IP addresses (for each IP family)

+ Island networks
    + a combination of isolated and flat networks
    + nodes have L3 connectivity with the broader network, but pods do not.
    + 必须经过node访问cluster内部pod
        + iptables
        + pod packets 离开nodes时
            + NAT，SNAT
                + 修改packets source:  pod ip---> node ip
    + NAT转换隐藏了背后真实的Pod IP，只能看到node IP
    + cluster A---->gateway A---->gateway B---->cluster B


## kube-proxy(L4)

+ per-node daemon

+ basic load balancing
    + routing request(outside the cluster)-->service(cluster IP)
    + `--proxy-mode <mode>` rely on `iptables`
        + userspace
        + iptables (default)
            + connection fan-out
            + `iptables -t nat -L KUBE-SERVICES`
        + ipvs
            + load balancing
        + kernelspace
            + windows-only

## CoreDNS

+ KubeDNS
+ access API server
+ dnsPolicy
    + Default
    + ClusterFirst
    + ClusterFirstWithHostNet
    + None
        + need to set `nameservers:`
            + a list of IP the pod will use as DNS servers
        + `searches:`
            +  is a list of DNS search domains for hostname lookup in the pod

+ search path
    + <service>.default.svc.cluster.local->svc.cluster.local->cluster.local->The host search path(pod DNS policy/CoreDNS policy)
    + autopath

## services

+ endpoint
    + pod discovery

+ Nodeport
    + node间会路由
    + 缺点
        + port可能被占用
        + 需要手动填写node IP

+ ClusterIP
    + virtual IP
    + internal load balancer(kube-proxy)
        + a single IP to pods
    + `service-cluster-ip-range`
        + CIDR
    + process
        + View the VETH pair and match with the pod.
        + View the network namespace and match with the pod.
        + Verify the PIDs on the node and match the pods.
        + Match services with iptables rules.

+ Headless
    + `.spec.clusterIP: "None"`
    + the service does not support any load balancing functionality.
    + provisions an Endpoints object and points the service DNS record at all pods that are selected and ready.
    + DNS query时会返回所有的对应的Pod IP，而不是像Cluster IP一样只返回一个cluster IP
    + 使用场景
        + clustered databases 
        + client端决定调用哪个pod
        + The “correct” way to use a headless service is to query the service’s A/AAAA DNS record and use that data in a server-side or client-side load balancer.
        + 自己不带loadbalance,只返回pod ip由外部来做loadbalance

+ ExternalName Service
    + use DNS name instead of selector
    + return a CNAME
    + map a service to DNS name
    + usage
        + migrations of services external to the cluster

+ LoadBalancer
    + exposing TCP or UDP services to the outside world
    + nodeport + loadbalancer(L4)(cloud provider)
    + traffic->load balancer externalIP(port)->load balancer clusterIP->container port(targetPort)

## ingress

+ L7 (HTTP) load balancer

+ ingress controller(manage ingress pods)
    + external load balancer controller
    + internal load balancer controller

+ rules

+ cert-manager

+ multiple ingress controllers
    + `IngressClass`

## Service Mesh
+ an API-driven infrastructure layer for handling service-to-service communication

+ functionality
    + Service Discovery
        + instead of DNS for service discovery
    + Load balancing
    + communication resiliency
    + Security
    + Observability

+ traffic is encrypted with Mutual TLS(mTLS)

+ service mesh
    + Istio
    + Consul
    + AWS App Mesh
    + Linkerd

## tips

+ 外网---->node(network interface)-->bridge---->pod(virtual network inteface)

+ kubelet,kube-proxy
    + 使用iptables

+ container runtime 为每个pod创建 virtual network interface

+ pod has a unique IP, which is shared by all containers in the pod

+ kube-controller-manager
    + 一个进程运行了很多k8s controller

+ Kubelet
    + CNI
        + manages container networking 
    + CRI
        + manages container runtime 

+ IPv4/IPv6 dual stack

+ send traffic to the service’s DNS address, consider a (standard) ClusterIP or LoadBalancer service.


+ loadbalancer(L4) vs ingress(L7)
    + L4 can handle TCP/UDP, cannot handle http/https
    + ingress supports path(http path) based routing

## tools
+ kind
    + MetalLB

## debug

+ removing the label on the pods
    + endpoint controller 会从endpoints上移除这些pods

+ pod probes

+ check yaml ports configuration

+ network policies

+ use dnsutils,netshoot

+ kubelet
    + --kube-api-qps
    + --kube-api-burst
    + --iptables-sync-period
    + --ipvs-sync-period duration

## ref

+ [cluserIP](https://learning.oreilly.com/library/view/networking-and-kubernetes/9781492081647/ch05.html#idm46219936154616)
    