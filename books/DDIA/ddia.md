## Design data intensive application


## nonfunctional requirements
+ Reliability
    + fault-tolerant
+ Scalability
    + scaling up
    + scaling out
    + fan-out
+ Maintainability


## cloud system
+ flexibility
+ elasticity

## storage

+ log-structured
    + segment
    + compaction
        + 去重
    + tombstone（逻辑删除）
        + 合并时真实删除
    + Sorted String Table(SSTable)
        + LSM(日志结构合并树，合并和压缩排序文件原理的存储引擎)
            + Lucene
    + Bloom filters (优化不存在的查询)
    + memtable
+ page-oriented
    + B-tree
+ B树
    + B树查询快
    + 带有预写日志(write-ahead log)WAL
    + 写
        + 写入WAL
        + 写入树页面本身

+ LSM树
    + LSM树写入快
    + 写放大（write amplification）
    + 支持比B树更高的吞吐
+ 索引
    + 聚集索引
        + 在索引中存所有的行数据
    + 非聚集索引
        + 索引中存储数据的引用

## 编码

+ 序列化(serialization)or编组(marshalling)
    + 内存数据 -----Encoding-----> 字节序列

+ 反序列化(deserialization),，反编组 (unmarshalling）
    + 内存数据 <-----decoding----- 字节序列

+ Marshal vs Serialization
    + Marshal 不仅传输对象的状态，还会传递对象的方法

+ 语言内置编码（和编程语言绑定）
    + java.io.Serializable
    + python:pickle


+ 可以被多种编程语言读写的标准编码
    + JSON
        + 不区分整数和浮点数，而且不能指定精度
        + 支持Unicode字符串，不支持二进制数据
            + Base64
        + 都有可选的模式支持
    + XML
        + 不能区分数字和字符串
        + 支持Unicode字符串，不支持二进制数据
            + Base64
        + 都有可选的模式支持
    + CSV
        + 不能区分数字和字符串
        + 没有模式
    + 二进制编码
        + 二进制json
            + MessagePack、BSON、BJSON、UBJSON、BISON 和 Smile 等
        + 基于模式的二进制编码            
            + Thrift
            + protocol buffer
            + Avro

<!-- tips -->
+ 不同进程直接不共享内存，传递数据要编码
    + 内存

## tips
+ SLO, service level objectives
+ SLA, service level agreements

## ref
+ [DDIA](http://ddia.vonng.com/#/ch2)

+ [第三章：存储与检索](http://ddia.vonng.com/#/ch3)