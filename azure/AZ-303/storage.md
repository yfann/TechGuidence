
## storage account

+ General-purpose v2(GPv2)
    + support latest features

+ Blob storage account
    + support block blobs

+ General-purpose v1(GPv1)
    + access to all az storage services



## storage service

+ Az container(Blobs)
    + 存储Az object
    + storage account->container->Blob
    + 类型
        + block blobs
            + text
            + binary data
                + files
                + images
                + videos
        + Append blobs
            + logging
        + Page blobs
            + frequent read/write
            + VM os and data disks
    + tools
        + AzCopy
        + Az data factory
            + account key
        + Blobfuse
            + virtual file system
            + linux file system
        + Az Data Box Disk
            + on-premise to Blob
        + Az import/Export

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

## pricing
+ tier get cooler
    + 访问代价越高
    + 存储成本降低

+ Outbound data cost

## Storage Security

+ Storage Service Encryption(SSE)
    + 默认

+ Az AD & RBAC supported

+ data transit
    + https

+ Az disk encryption
    + encrypte VM disk

+ Shared Access Signatures

+ 授权
    + Az AD(RBAC)
    + Shared Key
        + acount access key
        + request authorization header
    + Shared access signature(SAS)
        + delegate access
        + shared access signature URI
            + SAS token as Parameter
            + expiry time
            + IP range
        + account SAS/service SAS
    + Anonymous access to contianers and blobs
    + build-in RBAC
        + Storage Blob Data Owner
    + Resource Scope
        + an individual container
        + the storage account

## Firewalls and VNet

+ apply to public endpoint

+ Network rules

+ Classic  storage accounts don't support firewalls and VNet

## managment

+ import/export jobs
    + shipping disk drives to an Az datacenter
        + block,page blogs and Az files
    + large dataset & low-bandwidth

+ AzCopy
    + Az Blob and file storage
    + large data & high-bandwidth

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

+ Diagnostics settings resides in the same Az region of storage account

+ 每个 storage servic(blob service) 对应一个endpoint