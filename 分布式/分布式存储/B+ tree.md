# B+ tree
+ 减少磁盘IO
+ 叶子节点存储数据
    + 非叶子节点索引数据
+ 树越高，磁盘IO越多
    + 要求索引字段尽量小，非叶子节点可以容纳更多数据，树的高度越低
+ page(更具硬盘设计)
    + 包含key和其他page的引用

## B tree vs LSM tree
+ LSM tree
    + 写入快
        + 顺序写比随机写快
    + leveled compaction
        + 磁盘碎片少
    + 相同的key可能在多个segment中有副本

+ B  tree
    + 读取快
    + 每次写入，先写WAL,再写page
    + 容易产生fragmentation
    + key只在一个位置
        + 事务一般是在key范围上加锁实现的，所以B tree更容易实现事务

+ write amplification（写放大问题）

## ref
+ [一文读懂 MySQL 索引 B+树原理！](https://www.modb.pro/db/81587)
+ [B+树原理以及Go语言实现](https://segmentfault.com/a/1190000041696709)