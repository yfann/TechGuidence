
# mysql 

+ select for update
    + 高并发场景
    + 事物中才会生效
        + COMMIT后释放锁
    + 查询时，查询条件有主键，锁行。否则锁表

+ InnoDB
    + 默认是行锁
    + 

+ 数据库隔离级别

+ 幻读


+ 高并发下，如何安全的修改同一行数据


## 索引
+ InnoDB
    + 支持聚集索引
        + 一般用不可更新的主键
            + 更新主键成本高
    + 自适应哈希索引
        + 当MySQL注意到某些索引值被使用的非常频繁时，会在内存中基于B-Tree所有之上再创建一个哈希索引，这就让B-Tree索引也具有哈希索引的一些优点，比如快速哈希查找。这是一个完全自动的内部行为，用户无法控制或配置。
+ MyISM
    + 索引都是非聚集索引
        + 叶子节点data存放是数据记录的指针地址

+ 索引下推
    + 在索引遍历过程中，对索引中包含的字段先做判断，直接过滤掉不满足条件的记录，减少回表次数

+ `explain <sql>`
    + 查看执行计划



## tips
+ 如果要有持久性保证，那就WAL，但是要注意部分写问题。
+ 如果要控“分布”的数据节点，经典的2PC是一个不错的解决方案。
+ 要做原子性，就要支持完整且可靠的回滚机制，记录修改前的版本，并且对于这份记录做持久性保障。
+ 要做事务动作，持久性（解决不丢）、原子性（支持回滚）、隔离性（并发下的控制） 缺一不可。
+ 并发问题不好解了，要么不要并发，直接串行（上锁），或者以串行的方式去并发（数据不共享）。
+ 牺牲可靠性，使用缓冲批次读写，对于吞吐的提升真的很大，规避IO时，相当好用。
+ 顺序读写、随机读写性能差异很大，尤其是在大量IO的场景下，整体的差异会更大，WAL 中日志顺序写，数据文件异步写，然后写入加缓冲，性能比次次fsync要快太多太多。
+ 要写好where，得对索引门清，能用主键查的就用主键。
+ 尽可能避免null，会导致索引、索引统计、值比较很麻烦，然后要做索引，区分度最好高一些。
+ 范围查询会导致索引失效，所以优先使用 = in等操作，避免失效，记住最左。
+ 优化索引是能修改当前的，就不要新增新的索引，会增加维护成本和速度（索引页会多，插入缓冲的消费也会更慢），并且需要更大的空间。
+ 推荐使用联合索引，减少辅助索引的数量，一次辅助索引查找就找到主键值。
+ where 子句中对字段进行表达式操作或者函数操作，都会导致引擎放弃使用索引而进行全表扫描

## ref

+ [关"SELECT FOR UPDATE"的一些概念](https://www.huaweicloud.com/articles/2941282344610781fd8418a7947a027d.html)
+ [如何理解Mysql索引以及它的底层原理？](https://www.zhihu.com/question/436110377/answer/2951704887)
+ [MySQL索引失效原理是什么](https://www.zhihu.com/question/421944348/answer/2664024847)