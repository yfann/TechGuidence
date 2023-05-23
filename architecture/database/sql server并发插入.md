# sql server

## table hint
+ ROWLOCK
+ NOLOCK
+ NOWAIT
+ KEYLOCK
    + 需要主键

## 隔离级别
+ Read uncommitted
+ Read committed
+ Repeatable read
+ Serizable


## 并发导致的问题
+ 脏读
    + read uncommited
+ 不可重复读
    + 同一个事务中多次读取同一数据，可能结果不一样
+ 幻读
    + 一个事务先后读取一个范围的记录，两次读取条数不同

## 锁
+ 共享锁(s锁)
    + 记录锁（record lock）的一种，当读取一行记录时，为了防止别人修改，需要添加S锁。
+ 排他锁（x锁）
    + 记录锁（record lock）的一种，当修改一行记录时，为了防止别人同时进行修改，需要添加X锁。
+ 间隙锁（Gap Lock）
    + 锁定一个间隙，间隙锁加在索引之间的空隙上或者第一个索引之前/最后一个索引之后，主要目的是防止幻读。
+ 插入意向锁（Insert Intention Lock）
    + 插入意向锁也是一种间隙锁，在事务插入行之前，会在意图插入的间隙加插入意向锁。不同的事务向同一个间隙加插入意向锁并不冲突。插入意向锁与间隙锁（Gap Lock）冲突。
    + 插入意向锁是行锁
        + 意向锁是表锁
    + 插入意向锁是一种特殊的间隙锁 —— 间隙锁可以锁定开区间内的部分记录。
    + 插入意向锁之间互不排斥，所以即使多个事务在同一区间插入多条记录，只要记录本身（主键、唯一索引）不冲突，那么事务之间就不会出现冲突等待
+ next key锁
    + 索引记录上的记录锁（record lock）和索引记录之前的间隙上的间隙锁（Gap Lock）的组合。

## heap table
+ 没有 clustered index
+ 不能保证顺序
+ RID(row identifier)
    + FileID:PageID:SlotID
    + 8-byte
    + 比clustered index key小
+ 可以建立 nonclustered index
+ 使用heap table
    + 插入数据快
        + 适用于大量插入数据的情况
+ 不使用heap
    + 总是按序返回查询结果
    + 频繁group
        + Data must be sorted before it is grouped
    + 频繁范围查询
    + 查询时如果没有nonclusterd index会全表扫描
    + 频繁update
        + page大小不够时，会创建指针指向新page
        + 查询时会增加IO

## tips
+ heap table

+ with nolock
    + for select
    + 提升查询效率
        + 查询时不受排它锁阻塞
        + 不阻止其他事务修改读取的数据
    + 会脏读，不可重复读，幻读
    + 相当于隔离级别read uncommitted
    + table hint
        + 覆盖查询优化器的默认行为

+ 强制插入数据用rowlock
    + insert into <table_name> WITH (ROWLOCK)
    + alter table <table_name> set (LOCK_ESCALATION = DISABLE)

+ 查看锁
    + sp_lock

+ 批量插入数据时会升级成表锁
    + 否则创建大量的行锁影响性能

+ 行锁升级表锁
    + sql server中的一个对象上的锁有阈值（threshold: 5000）
        + 一旦超过阈值则会升级

## ref
+ [Multi-thread batch inserts to one table without wait](http://www.reporting-services.eu/index.php/2020/08/09/multi-thread-batch-inserts-to-one-table-without-wait/)
+ [说说with(nolock)的使用](https://juejin.cn/post/7030795133758996511)
+ [SQL Server table hints – WITH (NOLOCK) best practices](https://www.sqlshack.com/understanding-impact-clr-strict-security-configuration-setting-sql-server-2017/)
+ [论 MySql InnoDB 如何通过插入意向锁控制并发插入](https://zhuanlan.zhihu.com/p/344542398)
+ [Sql Server 哈希分区高并发插入数据](https://www.modb.pro/db/54830)

<!-- heap -->
+ [Understanding CRUD Operations Against Heaps and Forwarding Pointers](https://www.sqlservercentral.com/articles/understanding-crud-operations-against-heaps-and-forwarding-pointers)
+ [Heaps (Tables without Clustered Indexes)](https://learn.microsoft.com/en-us/sql/relational-databases/indexes/heaps-tables-without-clustered-indexes?view=sql-server-ver16)