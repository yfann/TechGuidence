# stream processing


## transmitting event stream

<!-- batch process -->
+ producer-----send event--->db<-----poll event------consumer

<!-- message broker -->
+ producer-----send message(event)------>message queue-----notify----->consumer

## mesasge system
+ direct messaging(brokerless)
    + TCP/IP
        + ZeroMQ
        + nanomsg
    + UDP
        + StatsD
        + Brubeck
    + webhooks
        + consumer exposes a service on the network

+ Message brokers(message queue)
    + some messaage brokers can participate in two-phase commit protocols
        + XA or JTA

+ log-based message broker
    + kafka
        + partition

## system sync
+ dual writes
    + first writing to the database, then updating the search index, then invalidating the cache entries
    + problems

+ CDC(change data capture)
    + which is the process of observing all data changes written to a database and extracting them in a form in which they can be replicated to other systems.
    + Change data capture is a mechanism for ensuring that all changes made to the system of record are also reflected in the derived data systems so that the derived systems have an accurate copy of the data.
    + implement
        + leader and followers db + message broker
        + PostgreSQL CDC
            + decode write-ahead log
        + snapshot
    + kafka connect
        + 用于kafka和数据源和数据目标间的集成
        + Kafka Connectis an effort to integrate change data capture tools for a wide range of database systems with Kafka. 

    
## issues

+ message disorder： 当mq有多个consumer时，如果mq没收到ack会重新向订阅者发送message,这样mesasge的处理顺序会和发送数据不一致
    + solution:
        + 一个mq对应一个consumer，不使用load balancer
+ dual writes problems
    + one success one fail
    + 更新数据库的顺序和更新索引的顺序不一样
    + solution:
        + 一个leader node来决定顺序


## tips
+ message system
    + 1 sender:1 recipient
        + unix pipe
        + TCP connection
    + pub/sub


+ backpressure 
    +  blocking the producer from sending more messages

+ consumers cannot keep up with producers
    + dropping 
    + buffering
    + backpressure

