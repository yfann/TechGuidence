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

## CALM theorem
+ 如果所有操作都具备单调性，那么可以避免复杂的同步协议，实现最终一致性，同时保持高可用性。

+ 单调性与一致性：如果所有操作都是单调的，那么在没有全局同步的情况下，系统可以保证最终一致性（Eventual Consistency），并且可以避免传统的强一致性机制带来的开销。
+ 单调性与活跃性：系统可以通过单调性保证活跃性，即系统可以继续进行操作，即使某些节点的状态不是完全同步。
+ 分布式系统设计：通过设计单调性操作，可以简化一致性问题，实现高可用且有保证的一致性。

+ 使用单调性（Monotonicity
    + 单调性通常表现为数据结构上的某种顺序，或者是操作对数据的增量式更新
    + 单调性：如果一个操作在某个状态下是有效的，那么它在其后续的状态中也应该是有效的。即操作不能“回退”或“撤销”之前做出的改变。
    + 单调读取（Monotonic Reads）：确保读取操作不会“回退”之前的值。如果某个节点读到的数据是某个版本，之后的读取不能回退到旧版本的数据。
    + 单调写入（Monotonic Writes）：确保写操作按照某种顺序进行，不会丢失或覆盖之前的写入。

+ CRDTs（Conflict-free Replicated Data Types）
    + 分布式数据结构
    + 通过设计单调操作（如追加数据而非替换数据）

+ 应用
    + Cassandra
    + Riak
    + Redis
    + Kafka

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

