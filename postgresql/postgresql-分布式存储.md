# postgresql
+ 全局事物节点(GTM)
    + 一个cluster只能有一个GTM
    + 生成全局唯一的事物ID
    + 全局事物状态
    + 序列等全局信息

+ Coordinator
    + Datanode与application间的接口
    + 接收用户请求，生成分布式查询，把语句发往数据节点

+ datanode
    + replicated table
    + distributed table

## 索引
+ btree
    + 适合所有

+ hash
    + 等值查询
        + 字符串特别长

+ gin(倒排索引)
    + 适合多值类型，例如数组、全文检索、TOKEN

+ gist
    + 同用索引接口，可以实现b-tree,r-tree

+ sp-gist
    + 同用索引接口,提供了空间分区，更好的支持非平衡数据结构
        + 几何类型，范围类型，IP

+ BRIN
    + 块级索引 
        + BRIN记录并不是以行号为单位记录索引明细，而是记录每个数据块或者每段连续的数据块的统计信息

+ rum
    + 全文索引

+ bloom
+ zombodb
    + 可以直接读写ES

+ bitmap
    + bitmap的KEY是列的值，VALUE是BIT（每个BIT对应一行）
## ref
+ [《PostgreSQL技术内幕——原理探索》](https://pg-internal.vonng.com/#/)
+ [干货 | PostgreSQL数据表文件底层结构布局分析](https://zhuanlan.zhihu.com/p/471815579)
+ [深入浅出PostgreSQL B-Tree索引结构](https://developer.aliyun.com/article/53701)
+ [一文看懂分布式数据库原理和 PostgreSQL 分布式架构](https://www.51cto.com/article/614396.html)
+ [PostgreSQL 9种索引的原理和应用场景PostgreSQL 9种索引的原理和应用场景](https://developer.aliyun.com/article/111793)