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

## issues
<!-- message disorder -->
+ 当mq有多个consumer时，如果mq没收到ack会重新向订阅者发送message,这样mesasge的处理顺序会和发送数据不一致
    + solution:
        + 一个mq对应一个consumer，不使用load balancer


## tips
+ message system
    + 1 sender:1 recipient
        + unix pipe
        + TCP connection
    + pub/sub


+ backpressure 
    +  blocking the producer from sending more messages

