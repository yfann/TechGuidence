# Event driven architecture(EDA)

## 单一事件来源
+ kafka

## Event Sourcing（事件溯源）
+ 不直接保存对象的最新状态（state），而是保存 导致这个状态的一系列事件（events）。
+ 支持CQRS
    + 写(Command)和读(Query)用不同模型
        + 一个模型既要满足写入一致性，又要满足高效查询
    + 解耦读写
    + Query一般不直接读event,而是读事件投影 (Projection)出的模型
        + 多个事件投影出一一条最终记录
        
## Event Bus
+ Event Bus 就是一种 消息传递机制，让不同的组件（service/module）通过 事件 来通信，而不需要直接调用彼此的接口。
+ 进程内event bus
    + Java: Guava EventBus
    + Node.js: EventEmitter
    + Python: pyee
+ 分布式event bus
    + Kafka
    + RabbitMQ
    + NATS
    + Redis Pub/Sub
+ 云原生 Event Bus
    + Knative Eventing
    + AWS EventBridge
    + Google Pub/Sub

## Aggregator
+ 状态机
    + 用correlation_id跟踪这一批请求的结果是否收集齐了

+ 内存型aggregator
```py
pending_requests[correlation_id] = {
    "B": None,
    "C": None,
    "expires_at": now + timeout
}
```

+ 分布式状态存储（常用版）
    + Aggregator 把中间状态存到 Redis / DB / Kafka compact topic。
    + key：correlation_id
    + value：部分结果 JSON
    ```py
    {
    "B": {"status": "done", "value": 42},
    "C": null
    }
    ```

+ 流处理 Join
    + Kafka Streams / Flink
    + 直接把 B 和 C 的结果流 join 在一起（按 correlation_id）
    + 由框架自动帮你缓存和拼接。
    + 只需要订阅拼接好的结果流

## tips
+ 同步桥接层
    + RPC fallback

## ref
+ [Building Event-Driven Microservices](https://learning.oreilly.com/library/view/building-event-driven-microservices/9781492057888/ch01.html)