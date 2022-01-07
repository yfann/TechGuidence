page: 104

## VM

+ recovery services vault
    + backup for multiple Az VMs
    + Shared Access Authorization

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

## storage

+ mount an Az file share
    + use primary storage key
    + Shared access signature（SAS）doesn't support

+ Az storage account
    + store backup files
+ Az storage Explorer
    + 从Az blob storage上传下载数据
## net

+ Network security groups(NSG)
    + 加入network interface(每个VM 一个interface)

+ load Balance
    + http,https各一个rules
    + web tier to application tire
        + internal Az standard LB
    + health prob
        + 根据健康状况动态添加或删除VM到LB
    + inbound/outbound rules
    + backend address pool

+ app on VM only accept traffic from Az Front Door
    + NSG with service tags

## security

+ access control
    + Az AD
    + SAS(Shared access signature)
        + Shared Access Authorization policy

+ key vault
    + access policy

+ Roles
    + owner role
        + can do everything
    + security admin role
        + in security center only
        + security policies
        + alerts
        + recommendations
    + network contributor
        + manage network
    + contributor
        + can manage
        + cann't assign RBAC

+ MFA and SSPR(self-service passowrd reset)
    + SMS(short message service)
    + Az AD pwd
    + Ms Authenticator app
    + Voice call
+ MFA only
    + app pwd auth
+ SSPR only
    + email
    + security questions

## App service

+ App service plan
    + Backup and restore feature
        + support tiers
            + Standard
            + Preminum
            + Isolated

+ Application Gateway
    + Web application firewall(WAF)
    + SSL
    + cookie-based session affinity
    + round robin
    + content-based routing

## Az AD

+ Active Diredctory Federation service
    + allow sharing of identity information outside a company's network

## tips

+ Azure Resource Manager (ARM) 

+ Site-to-Site VPN
    + 高可用方案
        + 2个Virtual network gateway, 2个 local network gateways, 4个public IP

+ Access control(IAM)

+ Azure Front Door
    + public Azure Load Balancer

+ SLA
    + 2 VM in available set
        + 99.5%
    + diffrent available zone in same Az region
        + 99.9%    

## ref

+ [Understanding Transactions in Azure](https://docs.particular.net/nservicebus/azure/understanding-transactionality-in-azure)
    + Network partitions result in slow or in doubt transactions
