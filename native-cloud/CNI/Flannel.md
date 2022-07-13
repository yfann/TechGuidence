
# Flannel

+ Overlay

+ 实现
    + 每个node上运行flanneld,为每个node分配subnet,为node上的pod分配IP,node之间构成虚拟网络，实现集群内跨node通信
        + node间转发数据包
            + 隧道模式
                + UDP
                + VXlan
            + 路由模式
                + HOST-GW

## tips

+ flannel0接收docker网桥数据，维护路由表，对数据封包转发(VXLAN)

+ 路由表存在etcd中
    + 保证每个node上的flannel看到的数据一致

+ Pod内容器通信
    + Pod内容器在同一个Network Namespace下，共享同一网卡，可以直接通信

+ 同主机Pod间容器通信
    + Docker会在每个主机上建一个Docker0网桥，主机上所有pod的容器都接入网桥，可以通信

+ 跨主机Pod间容器通透性
    + CNI

+ Cluster IP, Node IP, Pod IP
    + Pod IP
        + CNI来实现IP的申请及数据包的转发

## ref

+ [循序渐进理解CNI机制与Flannel工作原理***网络***](https://blog.yingchi.io/posts/2020/8/k8s-flannel.html)
    + TUN设备
    + 隧道
+ [Flannel原理](https://bbs.huaweicloud.com/forum/thread-83838-1-1.html)
+ [Kubernetes网络插件详解 - Flannel篇](https://zhuanlan.zhihu.com/p/540281221)