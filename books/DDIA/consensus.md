# 共识(consensus)

+ 构建容错系统的最好方法，是找到一些带有实用保证的通用抽象
    + 共识（consensus: 分布式系统最重要的抽象之一
        + 就是让所有的节点对某件事达成一致
            + 例如: leader选举

## 线性一致性（linearizability)cap中的C
+ 原子一致性（atomic consistency/强一致性（strong consistency/立即一致性（immediate consistency）

+ 线性一致性只是对单一对象的保证

+ 让一个系统看起来好像只有一个数据副本,所有的操作都是原子性的
    + 在一个线性一致的系统中，只要一个客户端成功完成写操作，所有客户端从数据库中读取数据必须能够看到刚刚写入的值
    + 线性一致性是一个 新鲜度保证（recency guarantee）

+ 是读取和写入寄存器（单个对象）的 新鲜度保证。它不会将操作组合为事务，因此它也不会阻止写入偏差等问题（请参阅 “写入偏差和幻读”），除非采取其他措施（例如 物化冲突）。

+ 可串行化（Serializability） 是事务的隔离属性
    + 基于两阶段锁定的可串行化实现通常是通常是线性一致性的。

+ 应用
    + leader election
        + 使用锁，防止脑裂
            + 锁必须线性一致
        + zookeeper,etcd 实现分布式锁和领导选举
            + 提供线性一致的写操作
            + 线性一致性读
                + etcd: quorum read
                + zookeeper,读之前sync()
    + 唯一性约束
        + 需要线性一致性
    + 跨信道的时序依赖
        + message queue异步处理数据库中的数据

+ 实现
    + 单主复制（可能线性一致）
    + 共识算法(线性一致)
    + 多主复制(非线性一致)
    + 无主复制(也许不是线性一致)
        + w+r>n
        + LWW(非线性一致)
    + 严格的法定人数读写应该是线性一致性的

+ 线性一致性可以自动保证因果性

##  因果一致（causally consistent）
+  序列号（sequence nunber） 或 时间戳（timestamp） 来排序事件
+ 主库的自增计数器
+ 兰伯特时间戳(counter, node ID)
    +  counter操作数
## tips

+ 分布式一致性
    + 在面对延迟和故障时如何协调副本间的状态

+ 事务隔离性
    + 避免由于同时执行事务而导致的竞争状态

+ 最终一致性
    + 收敛（convergence）

+  Oracle Real Application Clusters（RAC）使用分布式锁

+ 可串行化（Serializability）
    + 事务隔离性
    + 避免由于同时执行事务而导致的竞争状态
+ 线性一致性
    +  是读取和写入寄存器（单个对象）的 新鲜度保证
+ 分布式一致性
    + 在面对延迟和故障时如何协调副本间的状态