# Kafka

+ 分布式    
    + 多个broker组成
        + 每个broker是一个节点
    + topic
        + 可以划分为多个partition
            + 每个partition在不同的broker上
            + 每个partition存放一部分数据
            + 每个partition的replica在不同的机器上(HA)
                + replica
                    + 选举leader
                        + 负责生产消费
                        + 写数据到leader时
                            + leader数据落盘后
                            + follower向leader pull数据
                            + follower同步好后发ACK给leader
                            + leader收到所有ACK后返回写成功给生产者
                            + 写成功后，消息才可被读到
                    + 其他为follower




## tips

+ kafka 不能脱离 zookeeper 单独使用，因为 kafka 使用 zookeeper 管理和协调 kafka 的节点服务器

+ kafka offset 确保了消息的顺序性和不重复性

## issues
+ kafka-exporter 连不上 kafka
    + 查看白名单

## ref
+ [一文带你搞懂 Kafka 的系统架构（深度好文，值得收藏）](https://www.cnblogs.com/datadance/p/16292991.html)

+ [Kafka 入门一篇文章就够了](https://juejin.im/post/5ddf5659518825782d599641)
+ [带你涨姿势的认识一下kafka](https://mp.weixin.qq.com/s?__biz=MzU2NDg0OTgyMA==&mid=2247484570&idx=1&sn=1ad1c96bc7d47b88e976cbd045baf7d7&chksm=fc45f969cb32707f882c52d7434b2c0bf2ccbbc2cd854e1dc5c203deb8ae9c1831cf216e8bad&token=674527772&lang=zh_CN#rd)
+ [Kafka connectors](https://www.confluent.io/hub/) 
+ [kafka-connect-pulsar](https://www.confluent.io/hub/riferrei/kafka-connect-pulsar)
+ [apache kafka doc](https://kafka.apache.org/documentation/)

<!-- Kafka -->
+ [Ali 消息队列Kafka版](https://help.aliyun.com/document_detail/68151.html?spm=5176.167616.1288903.btn3.118d5a1cuvUlA7)
+ [Kafka security](https://docs.confluent.io/3.0.0/kafka/security.html)
+ [Kafka security](http://kafka.apache.org/documentation.html#security_overview)

<!-- monitor -->
+ [How to Monitor Kafka](https://blog.serverdensity.com/how-to-monitor-kafka/?spm=a2c4g.11186623.2.10.5c266b04cFWFdb)
+ [Monitoring Kafka performance metrics](https://www.datadoghq.com/blog/monitoring-kafka-performance-metrics/?spm=a2c4g.11186623.2.11.5c266b04cFWFdb)
+ [kafka_exporter](https://github.com/danielqsj/kafka_exporter)
+ [danielqsj/kafka-exporter](https://hub.docker.com/r/danielqsj/kafka-exporter)
+ [Kafka Consumer Lag Monitoring](https://sematext.com/blog/kafka-consumer-lag-offsets-monitoring/)

<!-- backup -->
+ [Kafka 多数据中心部署灾备三要素](https://www.infoq.cn/article/vE2SyMz7sRSATS*BRP1d)
+ [Kafka的备份机制](https://blog.csdn.net/qq_34796981/article/details/80820302)

<!-- details -->
+ [Kafka到底有几个Offset？——Kafka核心之偏移量机制](https://developer.aliyun.com/article/935829)