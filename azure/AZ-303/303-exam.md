70



## Cosmos DB account

+ Container
    + Parition key
        + 一旦存在不可更改
        + 通过Change Feed Processor 和 Bulk Executor Library migrate

+ elastic pool on a single Az SQl DB server

+ server-side transactions
    + 不同的DB要部署在同一个VM中
    + When both the database management system and client are under the same ownership (e.g. when SQL  Server is deployed to a virtual machine), transactions are available and the lock duration can be controlled.
    + 同一个Az SQL DB Server的不同DB间不能产生事务??
    + Az 没有分布式事务
    + partition key 范围产生事务
    + Az SQL server支持本地事务

+ EnableCrossPartitionQuery

## net

+ Network security groups(NSG)
    + 加入network interface(每个VM 一个interface)

+ load Balance
    + http,https各一个rules


## tips

+ Azure Resource Manager (ARM) 

+ Site-to-Site VPN
    + 高可用方案
        + 2个Virtual network gateway, 2个 local network gateways, 4个public IP

## ref

+ [Understanding Transactions in Azure](https://docs.particular.net/nservicebus/azure/understanding-transactionality-in-azure)
    + Network partitions result in slow or in doubt transactions
