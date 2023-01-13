# LSM tree（Log Structured merge）
+ 磁盘顺序写
    + 有大吞吐量

+ 是个跨域内存和磁盘的包含多个子树的森林
    + 内存中为Level0,其他Level1,Level2...在磁盘中
    + 磁盘中的“树”，实际是排序好的文件序列
    + 每一层的子树都有一个阈值大小，达到阈值后会进行合并，合并结果写入下一层
    + 只有内存中的树原地排序，磁盘中的树只是追加
        + 内存中的排序树
            + 红黑树，AVL树，跳表，TreeMap


+ 数据操作
    + 插入(只level0)
        + 向level0的顺序树插入数据
    + 删除(只level0)
        + 数据在level0中，则向数据添加墓碑标记
        + 数据在levelN(N>0)中，则在level0中插入模板标记的记录
    + 查询
        + Level0开始到LevelN,一旦找到匹配的key直接返回
    + 合并
        + 每一层level达到阈值合并到下一层level
        + 合并过程中去重，删除有墓碑标记的数据

## tips
+ vs B+ tree
    + 写性能更好

+ vs 倒排索引

+ 应用
    + NoSQL
    + HBase
    + Cassandra
    + RocksDB
    + LevelDB
    + HBase
    + Prometheus
    + ES构建索引
    
+ 内存增删改+磁盘顺序写
    + 高吞吐量

+ 适合写大于读的场景

+ 缺点
    + 查询能力弱
        + 最坏的情况要全表扫描
    + 合并操作涉及大量磁盘IO，比较耗能

## ref
+ [深入浅出分析LSM树（日志结构合并树）](https://zhuanlan.zhihu.com/p/415799237)
+ [磁盘顺序读写和随机读写是什么](https://blog.51cto.com/u_15076236/4148373)