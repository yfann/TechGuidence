

## Apache Camel

+ 路由引擎构建器
+ 客服服务端，生产消费者解耦


## kafka

+ 功能
    + 消息队列/数据处理(流数据)
    + 海量日志

+ 发布订阅模型
    + Pub-Sub
    + 多个消费者
    + 兼容队列模型

+ Topic
    + Producer将消息发送到Topic中
    + Consumer通过订阅Topic来消费消息

+ Partition
    + 队列
    + Topic可以有多个Partition
    + 同Topic下的Partition可以在不同的Broker上
    + 多个Replica
        + leader
        + follower

+ Broker
    + 一个Kafka实例

+ Zookeeper在Kafka中的作用
    + broker注册
    + Topic注册
        + Partition与broker的对应关系
    + 负载均衡
        + Partition在多个Broker上

+ 如何保证消费顺序
    + Kafka只能保证Partition中的消息有序，不能保证Partition之间有序
        + 消息追加到Partition时会加offset,保证有序
    + 一个Topic只对应一个Partition,保证有序
    + 发送消息指定partition,同一类消息只发往同一个Partition

+ 消息不丢失
    + Produer
        + 没有发送成功可以重试
    + Consumer
        + 消费完消息后手动提交offset
    + kafka丢了消息
        + acks=all
            + partition的所有副本都收到消息后(消息同步完成),该消息才算真正成功被发送
                + 默认leader收到后就算成功


## 消息队列

+ 使用场景
    + 异步处理提高响应能力
    + 削峰/限流
    + 降低系统耦合

+ 引入消息队列后的问题
    + 系统可用性降低
    + 复杂性提高
        + 重复消费
        + 消息丢失
        + 消息顺序
    + 一致性问题
        + 消息没有消费,数据不一致

+ JMS
+ AMQP


## ref
+ [消息队列其实很简单](https://github.com/Snailclimb/JavaGuide/blob/master/docs/system-design/distributed-system/message-queue/message-queue.md)
+ [Apache Camel 调研](https://www.jianshu.com/p/68aba8d09a89)

+ [Kafka常见面试题总结](https://github.com/Snailclimb/JavaGuide/blob/master/docs/system-design/distributed-system/message-queue/Kafka%E5%B8%B8%E8%A7%81%E9%9D%A2%E8%AF%95%E9%A2%98%E6%80%BB%E7%BB%93.md)

<!-- redis -->
+ [Redis的线程模型和事务](https://segmentfault.com/a/1190000037434936)
+ [Redis 多线程网络模型全面揭秘](https://segmentfault.com/a/1190000039223696)