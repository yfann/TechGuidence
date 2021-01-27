## Node IP
+ 物理机IP/虚拟机IP
+ 每个Service都会在Node上开通一个端口
    + 外部通过 NodeIP:NodePort访问service
+ `kubectl describe node <nodeName>` 查看IP
    + InternalIP


## Pod IP
+ Docker Engine根据docker网桥的IP地址段分配,虚拟二层网络
+ 同Service下的Pod根据PodIP相互通信
    + 不同Service下的Pod，集群间pod通信用到Cluster IP
+ pod和集群外通信,要用到 Node IP
+ `kubectl describe pod <podName>`

## CLuster IP
+ Service IP,虚拟IP地址。集群内访问使用
    + 外部网络无法Ping通,没有实体网络响应
+ `kubectl describe svc <svcName>`



## tips
+ NodePort、LoadBalane、Ingress(暴露服务给外部使用)