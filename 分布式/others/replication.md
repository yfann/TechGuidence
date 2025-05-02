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


+ Primary/Backup
    + Single, static master
    + Replicated log, slaves are not involved in executing operations
    + No bounds on replication delay
    + Not partition tolerant
    + Manual/ad-hoc failover, not fault tolerant, "hot backup"
+ 2PC
    + Unanimous vote: commit or abort
    + Static master
    + 2PC cannot survive simultaneous failure of the coordinator and a node during a commit
    + Not partition tolerant, tail latency sensitive
+ Paxos
    + Majority vote
    + Dynamic master
    + Robust to n/2-1 simultaneous failures as part of protocol
    + Less sensitive to tail latency

## Primary/backup(P/B) replication
+ asynchronous primary/backup replication 
    + update message
+ synchronous primary/backup replication
    + update message + acknowledge receipt

## 2PC
+ CA
    + 不能解决网络分区问题
+ 和1PC相比多了rollback功能
+ 所以nodes都参与

## Quorum
+ majority
    + N/2+1
    + odd number
+ distinct node roles
    + leader
+ epoch
    + logical clock
    + odes that were partitioned or out of operation will have a smaller epoch number than the current one,

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

+ Partition-tolerant consensus algorithms
    + paxos
    + raft
    + zab