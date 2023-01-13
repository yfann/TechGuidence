# B+ tree
+ 减少磁盘IO
+ 叶子节点存储数据
    + 非叶子节点索引数据
+ 树越高，磁盘IO越多
    + 要求索引字段尽量小，非叶子节点可以容纳更多数据，树的高度越低

## ref
+ [干货 | PostgreSQL数据表文件底层结构布局分析](https://zhuanlan.zhihu.com/p/471815579)
+ [深入浅出PostgreSQL B-Tree索引结构](https://developer.aliyun.com/article/53701)