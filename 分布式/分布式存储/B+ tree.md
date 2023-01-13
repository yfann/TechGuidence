# B+ tree
+ 减少磁盘IO
+ 叶子节点存储数据
    + 非叶子节点索引数据
+ 树越高，磁盘IO越多
    + 要求索引字段尽量小，非叶子节点可以容纳更多数据，树的高度越低


## ref
+ [一文读懂 MySQL 索引 B+树原理！](https://www.modb.pro/db/81587)
+ [B+树原理以及Go语言实现](https://segmentfault.com/a/1190000041696709)