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

+ 问题：复制延迟(replication lag)
    + read-your-writes consistency（read-after-write consistency）
        + 对可能修改的内容，总是从leader读
            + 例如用户个人信息
        + 最近更新从leader读
        + client端记录最近写入的时间戳,follower读取时比较时间戳，确认变更是否已传播到follower
    + moving backward in time
        + 单调读（monotonic reads）比 强一致性（strong consistency） 更弱，但比 最终一致性（eventual consistency） 更强的保证
            + 用户的多次读取不会看到旧值
            + 确保每个用户总是从同一个副本进行读取
    + 一致前缀读（consistent prefix reads）
        + 如果一系列写入按某个顺序发生，那么任何人读取这些写入时，也会看见它们以同样的顺序出现。
        + 任何因果相关的写入都写入相同的分区(partitioned/sharded)
        + 确保所有节点先处理插入，然后再处理更新
<!-- multi leader -->
+ 每个分区都有一个leader
+ 多数据中心
    + 离线的手机相当于一个独立的数据中心，连线后向云端的数据中心复制
    + 协同编辑
+ multi-leader configuration
    + 每个leader也是其他leader的follower
    + 每个leader可以独立工作
+ 问题：写入冲突
    + 避免冲突
        + 确保特定记录的所有写入都通过同一个主库
    + 收敛至一致的状态（convergent
        + 最后写入胜利（LWW, last write wins）
        + 为每个副本分配一个唯一的 ID，ID 编号更高的写入具有更高的优先级
        + 合并值
    + 自定义冲突解决逻辑
        + 应用处理冲突
            + 写时执行/读时执行
+ 复制拓扑（replication topology）
    + 多个leader之间如何复制数据
        + all-to-all
        + 环形拓扑（circular topology）
        + star topology、
<!-- leaderless -->
+ client的请求发送到多个副本，返回最新的值
+ Dynamo 风格
    + Cassandra
+ read repair
    + client读的时候发现旧值时，写入新值
+ 反熵过程（Anti-entropy process）
    + 后台进程检查副本间的数据差异
+ quorum
    + w+r>n
## partition(sharding
+ 分区目标是将数据和查询负载均匀分布在各个节点上
    + 偏斜(skew)：数据不平衡不平衡
        + 热点(hot spot):导致的高负载分区

+ 分区
    + 键范围分区
        + 高效查询
        + 无法避免热点
    + 键散列分区
        + 在分区之间公平地分配键，分区边界可以是均匀间隔的
        + 减少热点
            + 无法消除热点，如微博大V
                + 继续分割主键
        + MongDB
            + 使用基于散列的分区
            + 范围查询都必须发送到所有分区


+ 分区中使用次级索引
    + document-based partition（文档分区索引/本地索引）
        + 用文档 ID 对数据库进行分区（0~499， 500~999）
        + 每个分区维护自己的次级索引
        + 索引key对应 document id 数组
        + 查询要发送到所有分区，合并结果
            +  分散 / 聚集（scatter/gather）
                + MongoDB,Cassandra,Elasticsearch
    + term-based partition(关键词分区/全局索引)
        + 全局索引也必须进行分区，但可以采用与主键不同的分区方式
        + 客户端只需要向包含关键词的分区发出请求
        + 缺点在于写入速度较慢且较为复杂
        + 对全局次级索引的更新通常是异步的

+ 分区再平衡
    + 再平衡（rebalancing: 将负载从集群中的一个节点向另一个节点移动的过程称为 
        + 固定数量的分区
            + 创建比节点更多的分区，并为每个节点分配多个分区
            + 如果一个节点被添加到集群中，新节点可以从当前每个节点中 窃取 一些分区，直到分区再次公平分配
            + 只有分区在节点之间的移动。分区的数量不会改变，键所指定的分区也不会改变。唯一改变的是分区所在的节点
        + 动态分区
            + 按键的范围进行分区的数据库（如 HBase 和 RethinkDB）会动态创建分区
            + 分区的数量与数据集的大小成正比
        + 按节点比例分区
            + 每个节点具有固定数量的分区
            + 每个分区的大小与数据集大小成比例地增长，而节点数量保持不变

+ 请求路由
    + service discovery
        + 允许客户联系任何节点,如果该节点恰巧拥有请求的分区，则它可以直接处理该请求；否则，它将请求转发到适当的节点，接收回复并传递给客户端。
        + 首先将所有来自客户端的请求发送到路由层，它决定了应该处理请求的节点，并相应地转发
        + 要求客户端知道分区和节点的分配
    + 独立的协调服务（zookeeper）
        + 维护分区到节点的可靠映射
        + 路由层订阅zookeeper的变动消息
    + 流言协议（gossip protocol）
        + cassandra用流言协议来传播集群状态的变化
        + 请求可以发送到任意节点，该节点会转发到包含所请求的分区的适当节点

+  大规模并行处理（MPP, Massively parallel processing）
    + 可以在不同node上并行执行