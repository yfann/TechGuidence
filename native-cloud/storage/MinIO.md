# MinIO 
+ High Performance Object Storage
+ S3 campatibvle API
+ on premise



## file storage
    + File-based storage systems must scale out by adding more systems, rather than scale up by adding more capacity.
    + NAS
    + DAS
    + rely on a single path to data

## block storage
+ Each block of data is given a unique identifier
+ That means that some data can be stored in a Linux® environment and some can be stored in a Windows unit.
+ Block storage is often configured to decouple the data from the user’s environment and spread it across multiple environments that can better serve the data.
    +  the underlying storage software reassembles the blocks of data from these environments and presents them back to the user.
+ storage-area network (SAN)
+ it can be retrieved quickly
+ it can be accessed in a different operating system
+ he more data you need to store, the better off you’ll be with block storage.
+ It has limited capability to handle metadata
+ 云硬盘(给云主机当硬盘)
+ 不独立使用

## object storage
+ a flat structure in which files are broken into pieces and spread out among hardware.
+ repository
    + keep objects
+ require simple HTTP API
+ for public cloud storage
    + static data
+ 可单独使用
+ 通过API访问



## ref
+ [MinIO](https://docs.min.io/minio/baremetal/)
+ [对象存储（Object-based Storage）](https://blog.51cto.com/cmdschool/1904905)
+ [File storage, block storage, or object storage?](https://www.redhat.com/en/topics/data-storage/file-block-object-storage)
+ [NAS](https://www.redhat.com/en/topics/data-storage/network-attached-storage)
+ [理解云产品中的云硬盘（块存储）、文件存储、对象存储三者的区别](https://zhuanlan.zhihu.com/p/152565663)