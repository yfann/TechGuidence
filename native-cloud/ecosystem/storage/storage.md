## 分布式存储
+ 对象存储
+ 文件存储
+ 块存储
    + 虚拟盘
    + 云盘
        + 随机读写
    + 

## 分布式存储要素
+ 数据分布（中心节点、无中心节点）
    + 每段数据的地址空间分布在不同机器磁盘上，如何找到？
        + 无中心节点
            + 地址端hash mod disknums
        + 有中心节点
            + 持久化对应关系
+ 可靠性(多副本)
    + 客户端写多次
    + 一致性协议
        + WARO(write all read one)
        + Quorum
            + 最终一致性
            + RAFT
+ 数据一致性
+ 可扩展性


## ceph arch

+ 虚拟disk(不同地址空间在不同机器上)
    + object(存储单元)
        + PG:Placement Groups(复制组)
            + OSD:Object storage Device(管理一个磁盘的进程)

+ 多级哈希
    + disk->object(oid)---hash(oid)--->PG(PG id)---CRUSH--->OSD
        + CRUSH
            + root->数据中心->机房->机架->主机->OSD
            + PG均衡分布到OSD

+ 多副本一致性协议
    + WARO
        + 所有副本写完返回客户端



## ref
+ [新一代云原生分布式存储 Curve](https://www.bilibili.com/video/BV1jB4y1v7bo/?spm_id_from=333.999.0.0&vd_source=d3c0a53193a65728ad278e633b3790e5)