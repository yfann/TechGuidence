## postgresql
+ 扩展性强
+ 原生支持
    + json
    + 地理位置
    + 数组
    + text
    + 向量
+ 每行数据tuple
+ 数据表
    + 堆表文件
        + relfilenode唯一ID
        + 超过1G时自动分割
        + 数据页
            + 8KB
            + 方便读取
+ B+树索引
    + 倒过来的树
    + 中间节点是索引页
    + 页子节点是数据页
        + 叶子节点有左右指针组成链表

+ 每一个后端进程处理一个客户端连接
    + postmaster
        + 主控进程处理负责新建后端进程
+ WAL
    + 崩溃时重写数据
    + 顺序写快于数据页的随机写

## MVCC
+ 多版本并发控制（Multi-Version Concurrency Control）
+ 提升并发能力
    + Mysql InnoDB实现高并发的基石
    + 锁的并发能力差
+ 事务的隔离级别
    + 读未提交（Read Uncommitted）
        + 脏读（Dirty Read）
    + 读已提交（Read Committed, RC）
        + 大多数主流数据库（如Oracle、PostgreSQL）默认的隔离级别
        + 不可重复读（Non-Repeatable Read）
    + 可重复读（Repeatable Read, RR）
        + MySQL InnoDB存储引擎的默认隔离级别
            + InnoDB引擎通过引入**临键锁（Next-Key Lock）**这一强大的锁定机制，在RR级别下巧妙地解决了幻读问题
        + 一个事务内部，无论你对同一份数据读取多少次，得到的结果始终是一致的
        + 幻读（Phantom Read）
            + 数据行的增减
    + 串行化（Serializable）
        + 它通过对所有读写操作都加锁的方式，强制所有事务串行执行，一个接一个地排队处理

+ InnoDB MVCC的实现
    + 表的每一行添加两个隐藏字段
        + trx_id（Transaction ID）
            + 每当一个事务开始时，它会获得一个唯一的、单调递增的事务ID。当这个事务修改某行数据时，该行的trx_id就会被更新为当前事务的ID
        + roll_ptr（Rollback Pointer）
            + 它是一个指向undo log中上一版本记录的指针。InnoDB正是通过这个指针，将一行数据的多个历史版本像链表一样串联起来，形成一个“版本链”。
    + Read View
        + RC
            + 事务中每一次SELECT查询开始时，都会重新生成一个新的Read View。
        + RR
            + 仅在事务第一次SELECT查询时，生成一个Read View，并在此后的整个事务期间都复用这个Read View。
## ES
+ 倒排索引




## tips
+ redis
    + GeoHash
        + 地理查询
+ MVCC

