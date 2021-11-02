## redis

+ 场景
    + 削峰
    + 热数据
    + 计数器
    + 分布式锁

+ redis与DB一致性

+ 防止缓存击穿和雪崩

+ redis数据结构
    + string, hash, list, set, sortedset

+ redis并发竞争,cas操作

+ redis主从机制原理

+ 线程模型
    + 单线程
    + Reactor模型
    + 避免线程切换

+ 事物  

+ 高性能
    + 内存I/O
    + I/O多路复用
    + 单线程模型

+ Redis保证接口幂等性
    + token

## ref
+ [Redis-接口的幂等性之Redis解决方案](https://madridseven.github.io/2019/08/JAVA%E8%BF%9B%E9%98%B6%E5%AD%A6%E4%B9%A0-%E6%8E%A5%E5%8F%A3%E7%9A%84%E5%B9%82%E7%AD%89%E6%80%A7%E4%B9%8BRedis%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/)
+ [Redis如何保证接口的幂等性？](https://cloud.tencent.com/developer/article/1752476)