# 分布式数据
+ horizontal scaling(scaling out)
    + shared-nothing architecture
    + nodes

## replication 
+ 不同node保存相同数据
    + 数据冗余
+
<!-- single leader -->
+ leader    
    + 接收写请求
        + 发送 （replication log/change stream） 到 followers
            + 同步复制
            + 异步复制
            + 半同步（semi-synchronous）
                + follower有同步库也有异步库，同步库不可用时，异步库中选一个作为同步库
+ follower
    + read replicas

+ leader失效
    + failover
    + controller node
        + 指定新的节点

+ 复制实现
    + 基于sql语句的复制
        + leader自己执行语句的同时把语句发给其他follower
        + 缺点
            + 非确定性函数(nondeterministic
                + NOW(),RAND() follower调用和leader的值会不同
                + auto increment
    + 传输WAL
        + leader将自己的WAL发送给follower
        + 缺点
            + 复制与存储引擎紧密耦合
    + 逻辑日志复制(行)
        + logical log与存储引擎解耦
    + 基于触发器的复制

+ 复制延迟
    + 
<!-- multi leader -->
<!-- leaderless -->
## partition
+ sharding