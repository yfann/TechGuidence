## interview
+ 解释服务注册与发现的概念。在Spring Cloud中如何实现服务注册与发现
    + 服务注册与发现是微服务架构中的一个关键概念，用于管理和发现可用的服务实例。服务注册是指服务实例将自己注册到服务注册中心，包括其主机名、端口和其他元数据。服务发现是指服务消费者从服务注册中心获取可用的服务实例列表，并使用负载均衡策略选择一个实例进行调用。在Spring Cloud中，可以使用Eureka、Consul或Zookeeper等组件来实现服务注册与发现。这些组件允许服务实例向注册中心注册自己，并提供REST API供其他服务消费者查询可用的服务实例列表。服务消费者通过客户端库（如Ribbon）从注册中心获取服务实例，并根据负载均衡策略选择一个实例进行调用
+ Eureka 高可用

## 注册中心

+ Nacos
    + 基于DNS, RPC
    + vs Eureka
        + 
+ Eureka vs zookeeper
	+ Eureka
		+ AP
	+ Zookeeper
        + CP

## SpringCloud由什么组成
+ Eureka
    + 服务注册
    + 客户端发现(Fetch Registry)
+ Zuul
    + 网关
+ Ribbon
    + 客户端负载均衡
+ Feign
    + 声明性的Web服务客户端
+ Hystrix
    + 断路器
+ Spring Cloud Security
+ Spring Cloud Bus
    + 需要MQ配合通信
    + 配合Spring Cloud Config做配置中心
        + 实现实时刷新
+ Spring Cloud Config
    + 分布式统一配置管理

## tips

+ CAP
+ gateway
+ 熔断，隔离，限流模式
+ 微服务事物
+ Spring Cloud vs dubbo
+ Nginx vs Ribbon
+ 雪崩效应
    + Hystrix保护
+ SpringCloud调用接口的方式
    + Feign
    + RestTemplate
+ OAuth2


## ref
+ [面试题:微服务中你是如何处理事务的?](https://cloud.tencent.com/developer/article/1442601)
+ [阿里面试官问我：到底知不知道什么是Eureka，这次，我没沉默](https://zhuanlan.zhihu.com/p/334711540)
+ [SpringCloud之Eureka的使用和常见的面试题](https://blog.csdn.net/qq_41594146/article/details/86608190)
+ [SpringCloud面试题（总结最全面的面试题！！！）](https://juejin.cn/post/6844904125717544973)
