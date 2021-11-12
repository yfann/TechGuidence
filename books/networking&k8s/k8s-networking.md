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

+ 