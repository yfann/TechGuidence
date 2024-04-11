# HDFS(Hadoop Distributed File system)
+ 高容错性
+ 高吞吐量
+ 大文件存储
+ HDFS适合做：大文件存储、流式数据访问。
+ HDFS不适合做：大量小文件、随机写入、低延迟读取。
+ 架构
    + NameNode
        + 存储元数据
        + 一个实例
    + DateNode
        + 存储数据，上报给NameNode
        + 多个实例
    + ClientNode
## ref
+ [初识 Hadoop](https://www.cnblogs.com/datadance/p/16287802.html)

+ [分布式存储（二）：GFS与Ceph](https://zhuanlan.zhihu.com/p/690991550)