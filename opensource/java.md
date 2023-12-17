## java
+ [quartz](https://github.com/quartz-scheduler/quartz)
    + 作业调度框架

### spring messaging
+ 在分布式系统重进行消息传递
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