
## storage account

+ General-purpose v2(GPv2)
    + support latest features

+ Blob storage account
    + support block blobs

+ General-purpose v1(GPv1)
    + access to all az storage services

## storage service

+ Az container(Blobs)
    + 二进制数据
    + Az object

+ Az file
    + 文件共享
    + 诊断日志

+ Az queue
    + 消息存储
    + 存要异步处理的消息

+ Az table
    + Cosmos DB的一部分
    + Az Cosmos DB Table API

## Az storage account Replication

+ LRS（本地冗余）
    + 3个副本

+ ZRS
    + 3个副本


+ GRS
    + 6个副本
    + 本地数据中心(LRS)+另一个区域(LRS)
+ RA-GRS
+ GZRS
+ RA-GZRS

## tips

+ 结构化数据
    + Blob
        + REST
    + Data Lake Store
        + HDFS

+ 非结构化数据 
    + table

+ 标准/高级
    + HDD/SSD
    + 账号不能转换