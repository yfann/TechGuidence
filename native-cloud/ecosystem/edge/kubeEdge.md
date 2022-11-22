

## edge

+ 在边缘 list-watch 无法使用

+ CloudCore to EdgeCore
    + 双向多路复用的边云消息通道
        + WebSocket/QUIC
    + EdgeCore主动发起和云端CloudCore连接
        + CloudCore 
            + list-watch Kubernetes资源的变化，并通过云边双向通道主动将元数据下发至边缘测
            + CloudCore统一负责上行和下行数据的汇聚处理
        + EdgeCore
            + 上行元数据，如边缘侧节点状态和应用状态，EdgeCore通过云边通道上传至CloudCore，CloudCore将接收到的元数据上报到kube-apiserver。

## cloud

+ Edge controller
+ Device controller
+ k8s master
+ cloudhub
    + websocket to Edge node

## edge

+ edgehub
    + to cloudhub

+ MetaManager

+ Edged(Kubelet-lite)

+ DeviceTwin
    + 同步设备信息到语段DMI
    + EventBus
        + MQTT client

+ Edgemesh
    + 边边互通，云边互通


## tips

+ edge 中operator需要访问cloud端
    + 可以使用边缘可靠的list-watch接口

+ 边缘自治

+ k8s CRD
    + DeviceModel
    + Device Instance

## ref
+ [KubeEdge](https://space.bilibili.com/448816706/)
+ [单集群突破10万边缘节点，KubeEdge大规模测试报告发布](https://v1-10.docs.kubeedge.io/zh/blog/scalability-test-report/)