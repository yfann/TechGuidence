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

+ reducing database writes
    + aggregating events
        +  aggregating/combining multiple events into a single event
        + implement
            + streaming pipeline
    + sampling

+ reducing database reads
    + caching
    + approximation


+ partitioning
    + level 7 load balancer
        + The load balancer can be configured to process incoming events and forward them to certain hosts depending on the events’ contents.
## caching
+ read strategies
    + cache-aside
    + read-through
+ write strategies
    + write-through
    + write-back
        + The application writes data to the cache, but the cache does not immediately write to the database. The cache periodically flushes updated data to the database. 
    + Write-around
        + In write-around, the application only writes to the database.
+ caching as a separate service
    + Services are designed to be stateless, so each request is randomly assigned to a host. Since each host may cache different data, it is less likely to have cached any particular request that it receives.
    + If we cache on hosts, the cache will be wiped out every time our service gets a deployment, which may be multiple times every day.
    + We can scale the cache independently of the services that it serves 
    + If many clients simultaneously send the same request that is a cache miss, our database service will execute the same query many times. Caches can deduplicate requests and send a single request to our service. This is called request coalescing, and it reduces the traffic on our service.
+ cache warming
    +

## ref
+ [Caching in a cloud-native app](https://learn.microsoft.com/en-us/dotnet/architecture/cloud-native/azure-caching)