# 微服务


+ API网关模式
    + PC,APP端需要不同数据
    + 服务汇总
    + 协议转换
        + AMQP<---->HTTP
    + 身份认证

+ 聚合器模式
    + 复合微服务
    + API网关

+ 客户端组合模式
    + 客户端从多个微服务拉取数据
    + SPA


+ CQRS(Command Query Responsibility Segregation,命令查询职责分离)
    + 查询来自多个微服务的联合数据

+ Saga
    + 跨多个微服务的事物
    + 多个请求
        + 每个请求更新单个服务中的数据
        + 每个请求都有个补偿请求,请求失败时执行
    + Event Choreography/Order Orchestrator

+ 日志聚合

+ 性能指标
    + Push/Pull
        + Prometheus

+ 分布式追踪
    + Spring Cloud Slueth
    + Zipkin

+ 健康检查
    + Spring Boot Actuator

+ 外部配置
    + 环境属性dev,prod

+ 服务发现模式
    + Eureka

+ 断路器模式
    + 失败次数超过阈值时，断路
    + Hystrix

+ 蓝绿部署

## tips

+ 同步通信
    + HTTP
    + GRPC

+ 异步通信
    + 消息总线(msg queue)
    + 事件总线
    + 服务之间没有直接连接

## ref
<!-- Pattern -->
+ [microservices patterns](https://microservices.io/patterns/index.html)
+ [微服务的设计模式，你用了几个](https://www.kubernetes.org.cn/9532.html)
+ [DDD 中的那些模式 — CQRS](https://zhuanlan.zhihu.com/p/115685384)
    + DDD中领域模型与查询分离
    + Command
        + 数据库更改操作
        + 可以使用与Query不同的service,datasource
    + Query
    + Event Sourcing
+ [Backends For Frontends(BFF)](https://samnewman.io/patterns/architectural/bff/)
    + website,moble应用不同的UI对应不同的后端BFF
        + IOS BFF
        + Android BFF
        + web BFF
    + SPA(一个page调用多个service,前端组装数据) VS BFF(每个前端只会调用对应的BFF,BFF会调用多个service并组装数据)
+ [讲技术-什么是Web Hook？](https://segmentfault.com/a/1190000020249988)
    + 按事件来推送数据
+ [基于场景选择微服务的API范式：REST、GraphQL、Webhooks和gRPC](https://toutiao.io/posts/t3enj4b/preview)
+ [CAP原理和最终一致性(Eventually Consistency)](https://my.oschina.net/xianggao/blog/541003)

<!-- others -->
+ [微服务还差个容错机制](https://www.kubernetes.org.cn/7060.html)
+ [如何提高系统的吞吐量（QPS/TPS）](https://juejin.im/post/5af645f651882567105fd1b2)
+ [消息队列技术介绍](https://www.jianshu.com/p/689ce4205021)
+ [咱们一起聊聊Zookeeper](https://juejin.im/post/5b03d58a6fb9a07a9e4d8f01)
+ [互联网后端基础设施](https://juejin.im/post/5b59324ef265da0f69703f40)

<!-- 微前端 -->
+ [带你快速了解微前端的拆分和集成](https://www.kubernetes.org.cn/9637.html)