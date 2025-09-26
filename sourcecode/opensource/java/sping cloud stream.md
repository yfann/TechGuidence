# spring cloud stream(SCS)

## spring messaging
+ 在分布式系统中进行消息传递
    + 消息的传递发生在同一个JVM中的不同组件间
        + 单独应用的不同服务或模块之间
+ Message Broker
    + RabbitMQ
    + Kafka
+ methods
    + Point-to-Point
    + Publish-Subscribe
+ MessageChannel
    + DirectChannel
        + 同一应用程序内传递消息
        + 同步通道
    + PublishSubscribeChannel
        + 广播
        + 异步
    + QueueChannel
    + MessageChannel
    + PollableChannel
        + 拉的方式获取消息
## Spring Integration
+ 通过消息将各个子系统解耦分离

## ref
+ [干货｜Spring Cloud Stream 体系及原理介绍](https://cloud.tencent.com/developer/article/1431851)
+ [](https://springboot.io/t/topic/4788)
+ [Enterprise Integration Pattern - 组成简介](https://www.cnblogs.com/loveis715/p/5185332.html)