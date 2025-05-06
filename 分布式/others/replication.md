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