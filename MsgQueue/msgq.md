# 消息队列

+ 异步、解耦、消峰填谷

+ 可用性，复杂性，一致性


## 可用性

+ 镜像集群模式是所谓的RabbitMQ的高可用模式
    + 创建的queue会在多个实例上
        + 每次向queue写消息时会向多个实例同步

## 一致性

## 幂等性(消息重复)

+ 回馈机制
    + ack(RabbitMQ)
    + offset(Kafka)
    + redis天然幂等？

## 顺序性

## ref

+ [消息队列面试题及答案](https://blog.csdn.net/qq_41701956/article/details/103276267)
+ [面试官：消息队列这些我必问](https://juejin.cn/post/6844904000517570574)