# Actor Model
+ 核心思想是将计算抽象为Actor（演员），每个Actor是一个独立的实体，它们之间通过消息传递进行通信，而不是共享状态，从而避免了传统多线程编程中的竞态条件和锁的问题。
+ Actor Model 是一种无共享、基于消息传递的并发计算模型，适用于高并发和分布式计算。
+ 不同于传统的多线程+锁机制，它避免了竞态条件和死锁问题，天然支持可扩展性。
+ actor之间消息传递
+ 无共享状态（share-nothing）
+ actor 收到消息后：
    + 修改自己的状态
    + 创建新的Actor
    + 向其他Actor发送消息
    + 决定下一次接收消息时的行为

## ref
+ [What problems does the actor model solve?](https://getakka.net/articles/intro/what-are-actors.html)
+ [The actor model in 10 minutes](https://www.brianstorti.com/the-actor-model/)