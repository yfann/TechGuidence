# zookeeper
+ 分布式协调组件
+ 分布式存储
    + 小存储只存元数据
+ zookeeper集群
    + 主从
    + 强一致性
+ 临时节点
    + client创建临时节点，下游服务订阅临时节点
    + 当创建临时节点的客户端与 ZooKeeper 断连之后，这个临时节点就会消失，并且订阅了节点状态变更的客户端会收到这个节点状态变更的通知。
## kafka 抛弃ZooKeeper
+ Kafka自己存储元数据
+ KRaft
    +  Quorum Controller


## ref
+ [Kafka 为什么要抛弃 ZooKeeper？](https://www.zhihu.com/question/624795964/answer/3237670165)