# 存储引擎

## log-structured
+ index
    + 内存散列

+ segment
    + compaction

+ SSTables(Sorted string table)
    + merge segment高效
    + 内存中memetable有序是个平衡数(红黑树
    + 内存表大于阈值，作为SSTable写入硬盘

+ Bloom filters

## page-oriented


## tips
+ encoding
    + serialization
    + marshalling

+ decoding
    + parsing
        + deserializion

## RPC 
+ gRPC
    + Protocol Buffer实现的RPC
    + 支持流
        + 一次调用可以包含随时间的一系列请求响应
+ Thrift
+ Avro RPC

## ref
+ [复制](http://ddia.vonng.com/#/ch5)