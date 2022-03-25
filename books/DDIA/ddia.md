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

## tips
+ SLO, service level objectives
+ SLA, service level agreements

## ref
+ [DDIA](http://ddia.vonng.com/#/ch2)

+ [第三章：存储与检索](http://ddia.vonng.com/#/ch3)