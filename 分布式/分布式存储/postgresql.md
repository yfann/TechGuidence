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
    
## ref
+ [干货 | PostgreSQL数据表文件底层结构布局分析](https://zhuanlan.zhihu.com/p/471815579)
+ [深入浅出PostgreSQL B-Tree索引结构](https://developer.aliyun.com/article/53701)
+ [一文看懂分布式数据库原理和 PostgreSQL 分布式架构](https://www.51cto.com/article/614396.html)