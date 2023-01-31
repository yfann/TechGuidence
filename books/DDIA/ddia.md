## Design data intensive application


## nonfunctional requirements
+ Reliability
    + fault-tolerant
+ Scalability
    + scaling up
        + shared-memory architecture
        + shared-disk architecture
            + NAS
    + scaling out
        + node
        + shared-nothing
    + fan-out
    
+ Maintainability


## cloud system
+ flexibility
+ elasticity

## storage

+ log-structured
    + segment
    + compaction
        + 去重
    + tombstone（逻辑删除）
        + 合并时真实删除
    + Sorted String Table(SSTable)
        + LSM(日志结构合并树，合并和压缩排序文件原理的存储引擎)
            + Lucene
    + Bloom filters (优化不存在的查询)
    + memtable
+ page-oriented
    + B-tree
+ B树
    + B树查询快
    + 带有预写日志(write-ahead log)WAL
    + 写
        + 写入WAL
        + 写入树页面本身

+ LSM树
    + LSM树写入快
    + 写放大（write amplification）
    + 支持比B树更高的吞吐
+ 索引
    + 聚集索引
        + 在索引中存所有的行数据
    + 非聚集索引
        + 索引中存储数据的引用

## 编码

+ 序列化(serialization)or编组(marshalling)
    + 内存数据 -----Encoding-----> 字节序列

+ 反序列化(deserialization),，反编组 (unmarshalling）
    + 内存数据 <-----decoding----- 字节序列

+ Marshal vs Serialization
    + Marshal 不仅传输对象的状态，还会传递对象的方法

+ 语言内置编码（和编程语言绑定）
    + java.io.Serializable
    + python:pickle


+ 可以被多种编程语言读写的标准编码
    + JSON
        + 不区分整数和浮点数，而且不能指定精度
        + 支持Unicode字符串，不支持二进制数据
            + Base64
        + 都有可选的模式支持
    + XML
        + 不能区分数字和字符串
        + 支持Unicode字符串，不支持二进制数据
            + Base64
        + 都有可选的模式支持
    + CSV
        + 不能区分数字和字符串
        + 没有模式
    + 二进制编码
        + 二进制json
            + MessagePack、BSON、BJSON、UBJSON、BISON 和 Smile 等
        + 基于模式的二进制编码            
            + Thrift
            + protocol buffer
            + Avro

<!-- tips -->
+ 不同进程直接不共享内存，传递数据要编码
    + 内存

## 分布式数据

+ 可伸缩
    + scale up(vertical scaling)
        + shared-memory architecture
        + shared-disk architecture
            + NAS
    + scale out(horizontal scaling)
        + shared-nothing architecture

+ 高可用

+ 低延迟

## 复制
+ replica（副本）
    + 如何保证数据落到所有副本上

<!-- 复制算法 -->
<!-- single leader -->
+ master/slave
+ write->leader---replication log/change stream-->follower
    + 只有leader接收写操作
+ 同步更新folloewr/异步更新follower
    + semi-synchronous（半同步）
        + leader写入，至少一个follower同步，其他follower异步
+ 添加新的follower
    1. 获取leader某时刻的一致性快照
    2. 快照复制到新的follower
    3. new follower连接到leader,拉取快照之后的所有数据变更
    4. follower处理完快照之后的基于数据变更后，它caught up leader
+ 故障切换(failover)
    + follower提升为leader
    + Timeout确认leader失效
    + old leader从故障恢复时，重新加入集群，new leader可能会有写冲突
        + split brain
+ 复制日志的实现
    + 方式1. 每个写请求(statement)发给其他follower
        + 可能有不确定值
            + NOW()
            + 自增id
    + 方式2. 传输预写式日志（WAL）
        + 写操作通常追加到日志中
            + SSTables
            + B树
    + 方式3. 逻辑日志复制
    + 方式4. 基于触发器的复制

+ 复制延迟
    + eventual consistency
    + replication lag（复制延迟
    + issues(读异步follower时的问题)
        + 读不到新值
            + solution: read-after-write consistency/read-your-writes consistency
                + read leader
                + 客户端记住最近一次写入的时间戳，和follower比较, 只读有最新记录的follower
                    + 逻辑时间戳
                        + 日志序列号
        + moving backward in time(client读取多次时，可能读到新值，也可能读到旧值)
            + solution: 单调读(Monotonic reads)
                + 这是一个比 强一致性（strong consistency） 更弱，但比 最终一致性（eventual consistency） 更强的保证
                + 如果先前读取到较新的数据，后续读取不会得到更旧的数据
                + 保证client总是从同一个replica读取，根据用户ID散列选择replica
        + 不同Partition直接由于延迟不同，导致事件发生顺序混乱
            + solution: 一致前缀读（consistent prefix reads）
                + 保证: 如果一系列写入按某个顺序发生，那么任何人读取这些写入时，也会看见它们以同样的顺序出现
                + partitioned或sharded会遇到此类问题
                + 确保任何因果相关的写入都写入相同的partition

<!-- multi leader -->
+ 有多个数据中心
    + 离线的客户端同步
    + 协同编辑同一个文档
+ 写冲突
    + solution
        + 都写入同一个leader
        + 收敛（convergent）
            + 最后写入胜利（LWW, last write wins）
                + 每个写入一个时间戳，最大的最为胜利者
            + 合并冲突(Git)
+ 多主复制拓扑
    + circular topology
    + star topology
    + all-to-all topology
<!-- leaderlesss -->

+ 当故障节点重新接入集群时，可能读到旧值
    + 读请求可以并行的发送到多个节点，根据版本号确定哪个更新
    + 故障节点赶上错过的写入
        + 读修复（Read repair）
        + 反熵过程（Anti-entropy process）

+ 读写法定人数（quorum）
    + w + r > n

## 分区（partition/sharding）

 + 偏斜(skew)
    + 一些分区比其他分区有更多的数据或查询
        + hot spot

+ 根据键的范围分区
+ 根据键的散列分区
    + 一致性哈希(consistent hashing)
        + partition boundaries

+ 根据次级索引分区
    + document-based
        + 文档分区索引/本地索引
            + 分散/聚集(scatter/gather)
                + 查询发送到所有分区，并合并所有返回的结果
    + term-based
        + 全局索引
            + 特定的词在特定的分区
                + 不需要 分散 / 收集 所有分区，客户端只需要向包含关键词的分区发出请求
            + 写入速度慢且复杂
                + 对全局次级索引的更新通常是异步的
+ 再平衡(rebalancing)
    + 将负载从集群中的一个节点向另一个节点移动的过程
        + 固定分区数量

+ 路由
    + Zookeeper维护分区到节点的映射(包括key range的映射)
    + 流言协议(gossip protocol)
        + 传播集群状态变化       
## tips
+ SLO, service level objectives
+ SLA, service level agreements
+ Replication vs Partitioning
    + Replication
        + 在几个不同的节点上保存数据的相同副本，提供冗余
    + Partitioning
        + 大型数据库拆分为不同子集(partition,分区),不同分区指派给不同节点(sharding,分片)

+ eventual consistency
    + read-your-rites
    + monotonic read
+ 复制的一致性与 共识（consensus
+ 大规模并行处理（MPP, Massively parallel processing）
## ref
+ [DDIA](http://ddia.vonng.com/#/ch2)

+ [第三章：存储与检索](http://ddia.vonng.com/#/ch3)