# Actor Model
+ Actor Model 是一种无共享、基于消息传递的并发计算模型，适用于高并发和分布式计算。
+ 不同于传统的多线程+锁机制，它避免了竞态条件和死锁问题，天然支持可扩展性。
+ actor之间消息传递
+ 无共享状态（share-nothing）

## ref
+ [What problems does the actor model solve?](https://getakka.net/articles/intro/what-are-actors.html)
+ [The actor model in 10 minutes](https://www.brianstorti.com/the-actor-model/)