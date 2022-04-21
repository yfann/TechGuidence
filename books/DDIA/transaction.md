## Transaction

+ 为了简化应用编程模型而创建的
    + safety guarantees

+ 隔离级别
    + read committed
    + snapshot isolation
    + serializability

+ ACID
    + Atomicity(*)
        + all-or-nothing
    + Consistency
    + Isolation(*)
        + 解决并发问题(race conditions/竞争条件)
        + 隔离级别
            + 可串行(serializable)
                + 一次执行一个事务，没有并发
            + 非串行的(nonserializable),弱隔离级别
                + 读已提交(Read committed)
                    + 读数据库时只能读取已提交的数据(没有dirty reads)
                    + 写数据库时，只能覆盖已写入的数据(没有dirty writes)
    + Durability

+ BASE
    + Basically Available
    + Soft State
    + Eventual consistency

    
+ 多对象写入
    + multi-object transaction
        + 许多分布式数据存储已经放弃了多对象事务，因为多对象事务很难跨分区实现

+ 单对象写入
    + 一个大对象写了一半，网络断开...
        + 在文档数据模型中，需要一起更新的字段通常在同一个文档中，这被视为单个对象
    + 存储引擎一般对单节点单对象提供原子性和隔离性
        + 原子性
            + write-ahead log
            + CAS,compare-and-set(值没被其他并发改过时，才允许执行写操作) (轻量级事务)
            + atomic increment
        + 隔离性
            + 锁，每次只允许一个线程访问对象

## tips
+ 没有原子性，错误处理就要复杂得多，缺乏隔离性，就会导致并发问题
+ 2PC, two-phase commit
+ Heisenbug(偶然发生的瞬时bug)
+ Bohrbugs(确定性问题)