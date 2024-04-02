# database scale

## replication
+  Replication is making copies of data, called replicas, and storing them on different nodes.
## partitioning
+ partitioning implies the subsets in local
## sharding
+ Sharding implies the subsets are distributed across multiple nodes


## replication

+ distributing replicas benefits
    + scale storage
    + scale memory
    + scale processing
        + parallel processing
    + locality

+ single-leader replication
    +  the entire database must fit into a single host.
    + scaling reads
    + primary-secondary leader failover
        +  If the primary leader fails, the failover process promotes the secondary leader to primary. 
    + multi-level replication
        + scale reads further
    + samples
        + MySQL binlog-based replication

+ Multi-leader replication
    + Multi-leader and leaderless replication are techniques to scale writes and database storage size. They require handling of race conditions, which are not present in single-leader replication.
    + consistency
        + clock skew
            + 由于信号传输的延迟或信号传输路径的不对称性，导致不同部件接收到的时钟信号时间上存在微小的差异，这就是时钟偏差。
            + 无法用不同node上的时间决定操作顺序
        + read-after-write consistency
+ Leaderless replication
    + quorum
        + the minimum number of nodes that must be in agreement for consensus
+ HDFS replication


## sharding
+ Sharded RDBMS
    + JOIN query
    + aggregation
        + reduce database write rates
        + implement with streaming pipeline


## ref
+ [Sharding with Amazon Relational Database Service](https://aws.amazon.com/blogs/database/sharding-with-amazon-relational-database-service/)