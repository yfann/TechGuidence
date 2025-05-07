# replication
+ synchronous replication
+ asynchronous replication

## 一致性机制对比

| 特性             | M/S               | Gossip           | 2PC              | Quorum           |
|------------------|-------------------|------------------|------------------|------------------|
| **一致性**       | 最终一致性        | 最终一致性       | 强一致性         | 强一致性         |
| **事务支持**     | 完整事务支持      | 本地事务          | 完整事务支持      | 完整事务支持      |
| **延迟**         | 低                | 低               | 高                | 高                |
| **吞吐量**       | 高                | 高               | 低                | 中等              |
| **数据丢失风险** | 有可能丢失        | 有可能丢失       | 无数据丢失        | 无数据丢失        |
| **故障转移能力** | 故障后只读        | 故障后可读写     | 故障后可读写      | 故障后可读写      |


## Primary/backup(P/B) replication
+ asynchronous primary/backup replication 
    + update message
+ synchronous primary/backup replication
    + update message + acknowledge receipt

## 2PC
+ CA
    + 不能解决网络分区问题
+ 和1PC相比多了rollback功能

## Partial quorums
+ eventually consistent
+ R + W > N
+ vector clocks
    + concurrent and out of date updates can be detected.

## probabilistically bounded staleness (PBS)
+ 弱一致性系统对数据副本的读取行为建模
    + Dynamo
    + Cassandra
    + Riak

+ design
    + consistent hashing to determine key placement
    + partial quorums for reading and writing
    + conflict detection and read repair via vector clocks and
    + gossip for replica synchronization

+ PBS 不是保证每次读操作都返回最新值，而是提供概率性保证
    + 在延迟 t 之后，某次读操作返回“最新值”的概率 ≥ p

+ 很多 NoSQL 系统采用最终一致性（Eventual Consistency），但这又不能量化“多久一致”。PBS 介于两者之间，
## tips
+ consensus problems
    + leader election
    + failure detection
    + Mutual exclusion
    + atomic broadcast

+ consensus protocal
    + M/S(Master slave)
    + Gossip
    + 2PC
    + Quorum
        + Paxos
        + Raft

+  any asynchronous replication algorithm can only provide weak durability guarantees

+ single-copy consistency

+ CRDTs: Convergent replicated data types
    + semilattices
    + associative, commutative and idempotent