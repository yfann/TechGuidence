# steam processing
+ 数据无界限

+ event stream
    + event
        + 一个小的、自包含的、不可变的对象，包含某个时间点发生的某件事情的细节。一个事件通常包含一个来自日历时钟的时间戳，以指明事件发生的时间
    + 事件写入数据库中
        + 消费者轮询
        + trigger
    + 数据库同步

+ messaging system
    + 生产者生产的比消费者处理的块时
        + 丢弃消息
        + 消息放入队列
        + 背压(backpressure)
            + 流量控制，阻塞生产者

+ 生产者直接传递给消费者
    + UDP
    + 无代理消息库(ZeroMQ
        + 通过 TCP 或 IP 多播实现发布 / 订阅消息传递
    + StatsD
    + 生产者直接调用HTTP，RPC将消息推送给使用者
        + webhook

+ steam
    + 传输
        + 通过消息
        + message broker
        + event log
    + 

## message broker(message queue)
+ 多个consumer
    + load balancing
    + fan-out

+ log-based message broker
    + kafka
    + 一个用户处理一个分区
    + 读取消息不会从日志中删除
    + 消费者偏移量

## 事件溯源（Event Sourcing) 
+ DDD
+ 将所有对应用状态的变更 存储为变更事件日志
+ 从事件日志中派生出当前状态

## tips

+ 变更数据捕获（change data capture, CDC）
    + 你可以捕获数据库中的变更，并不断将相同的变更应用至搜索索引
    + leader-----变更日志---->follower

+ event vs command
    + command被接受时成为一个event
    + event生成时成为一个fact

+ 变化日志（changelog）

+ 命令查询责任分离（command query responsibility segregation, CQRS）
    + 通过将数据写入的形式与读取形式相分离，并允许几个不同的读取视图
    + 从同一事件日志中派生多个视图

+ 复合事件处理（complex event processing, CEP）
    + 查询是长期存储的，来自输入流的事件不断流过它们，搜索匹配事件模式的查询