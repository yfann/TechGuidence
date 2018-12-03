# 微服务

目的是：
+ 快速迭代
+ 持续交付


## 如何拆分服务

+ 垂直拆分（业务维度）



+ 水平拆分（功能维度）

>例如把Message表拆成1024张表，message属于哪张表要根据messageId/1024计算，所以要得到messageId才能找到对应的表。
>实际场景会有根据productId查找messageId的情况，这时要创建大量的映射表才能关联相应数据。


## 高可用

+ 无状态化（微服务冗余）
+ 负载均衡(幂等设计)
+ 异步化（超时机制）
+ 微服务降级（分级管理）
+ 微服务治理

## 微服务架构设计模式

+ 聚合器模式
+ 异步消息设计模式
+ 数据共享设计模式

## tips

+ 协议转换（为了提升性能需要协议转换，网络传输的是JSON，服务内部是Protocol buffers协议，需要在GateWay把JSON转成Protocol Buffers。通用转换，不用解析协议语义如：
在java中`JSON->HashMap<String,Object>`

+ 网络IO(读阻塞多，写阻塞少)

+ 正向代理(客戶端知道代理的存在)，反向代理（客戶端不知道代理的存在）

+ 微服务是一种业务服务

+ CP强一致性，AP最终一致性

+ 数据强一致性（如银行交易系统）不适合微服务，社交场景可以使用微服务

+ push/pull (微博不太适合数据推送，大V有千万粉丝，发一条信息就会推送千万次，造成性能问题。适合数据拉取)

+ Codis基于Redis，方便做Sharding

+ NoSQL sharding可在DB层做，New SQL不用做Sharding了

+ 原来两层为同步架构，中间加了一层Message Queue后就会变为异步架构

>MQ加到离前端越近越好  
>读请求不做异步（当用户使用查询后要立刻返回结果，而不是空白页)  
>写请求如果是数据若一致性可做异步(如社交数据)，强一致性不做异步(如金融数据)

## keywords

+ Protocol Buffers
+ IDC(internet data center) 云以IDC机房为基础
+ IO模型
+ Service Mesh
+ Sharding(分库分表)
+ LAMP架构(Linux-Apache-MySQL-PHP)
+ MQ异步使用
+ VIP(虚拟ip,可以在物理机挂掉后,指向其他物理机)