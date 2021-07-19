## categories
+ Storage for VM
    + disk
        + persistent block storage
    + files
        + managed file share

+ Unstructured Data
    + Blobs 
        + REST based cloud object store
    + Data Lake store
        + HDFS as a service

+ Structured Data
    + tables
    + key/vaule
    + NoSQL

## tiers
+ Standard
    + HDD
    + 不能转换为Premium

+ Premium
    + SSD
    + VM disk and databases


## storage account

+ General-purpose v2(GPv2)
    + support latest features

+ Blob storage account
    + support block blobs

+ General-purpose v1(GPv1)
    + access to all az storage services



## storage service

+ Az container(Blobs)
    + 存储Az object,unstructured data
    + storage account -> container(Bucket in oss) -> Blob
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
    + multiple VM share the same files
    + 配置文件,诊断日志

+ Az queue
    + 消息存储
    + 存要异步处理的消息

+ Az table
    + Cosmos DB的一部分
    + Az Cosmos DB Table API

## Az storage account Replication

+ LRS（本地冗余）
    + 3个副本
    + hardware failure
    + across fault domains 
    + one region

+ ZRS
    + 3个副本
    + Availability Zone

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
    + Blob or Queue storage

+ data transit
    + https

+ Az disk encryption
    + encrypte VM disk

+ Shared Access Signatures

+ 授权
    + Az AD(RBAC)
        + only Blob and queue storage
    + Shared Key
        + Storage Account Access Keys
        + request authorization header
    + Shared access signature(SAS)
        + delegate access
        + shared access signature URI
            + SAS token as Parameter
            + expiry time
            + IP range
        + account SAS/service SAS
    + Anonymous access to contianers and blobs
    + Resource Scope
        + an individual container
        + the storage account

## Authorize access to Blobs and Queues using AAD

+ storage accounts created with Az Resource Manager deployment model supports AAD
+ 先获取OAuth2 token，再访问Blob or Queue service
+ 如果app是在Az VM中，可以用managed identity去访问blobs or queues
+ build-in RBAC
    + Storage Blob Data Owner
    + Storage Blob Data Contributor

## Firewalls and VNet

+ public endpoint is accessible through the internet

+ specified IP addresses

+ Network rules(all network protocols to Az storage)
    + REST/SMB
    + Az portal
    + Storage Explorer
    + AZCopy

+ Classic  storage accounts don't support firewalls and VNet

## managment

+ import/export jobs
    + shipping disk drives to an Az datacenter
        + block,page blogs and Az files
    + cases
        + migrating data to the cloud
        + content distribution
        + backup
        + data recovery
    + large dataset & low-bandwidth

+ AzCopy
    + Az Blob and file storage
    + acount to acount
        + blob service only
    + large data & high-bandwidth

+ Az data box

+ auth
    + AAD
    + SAS tokens

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