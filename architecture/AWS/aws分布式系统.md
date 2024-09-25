# aws上构建分布式系统

+ work load
    + EC2（Elastic Compute Cloud）
        + auto scaling
    + ECS（Elastic Container Service）/ EKS（Elastic Kubernetes Service）
    + Lambda（Serverless）

+ Elastic Load Balancing (ELB)
    + ALB（Application Load Balancer）：适用于 HTTP/HTTPS 流量，可以根据 URL 路径、头信息等进行流量路由。适合微服务架构。
    + NLB（Network Load Balancer）：适合处理低延迟、高吞吐量的 TCP/UDP 流量。

+ 分布式数据库
    + Amazon RDS（Relational Database Service）
    + Amazon Aurora
        + 兼容 MySQL 和 PostgreSQL 的高性能关系型数据库，具备自动扩展和容错机制。
    + DynamoDB
        + AWS 提供的分布式 NoSQL 数据库，支持大规模的分布式系统。DynamoDB 提供自动分区和分布式存储，适合需要高吞吐量和低延迟的应用程序。
    + ElastiCache：支持分布式缓存（如 Redis、Memcached），用于降低数据库压力，提高性能。

+ MQ
    + SQS（Simple Queue Service）：简单的消息队列服务，用于实现异步任务处理和消息传递。
    + SNS（Simple Notification Service）：用于消息发布和订阅（Pub/Sub）模式的服务，允许将消息广播到多个接收者。
    + Amazon MQ：托管的消息代理服务，支持多种标准消息协议，如 Apache ActiveMQ、RabbitMQ。

+ file storage
    + Amazon S3（Simple Storage Service）：提供分布式的对象存储服务，具备高可用性和扩展性，适用于存储大量静态文件、备份数据或媒体文件。
    + EFS（Elastic File System）：提供可伸缩的文件存储，多个 EC2 实例可以并发访问 EFS，适合需要共享文件系统的分布式应用。
    + FSx：用于运行分布式文件系统，如 FSx for Lustre，适合高性能计算和大数据处理。

+ fault tolence
    + region
    + Availability Zone(AZ)

+ task scheduler
    + AWS batch
    + AWS step functions
    + Amazon EventBridge

+ monitor
    + Amazon CloudWatch
    + AWS X-ray
    + ElasticSearch Service
        + 集成CloadWatch logs

+ network
    + Amazon VPC
    + security group
    + IAM
