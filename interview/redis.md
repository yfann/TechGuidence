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

## 高并发（内存处理+多路复用）
+ redis基于内存
    + CPU不是瓶颈，可以用单线程
        + 对于多核CPU可以使用多个redis进程，不使CPU闲置
            + 不同key对应不同redis实例

+ 单线程，节省线程切换时间

+ 多路复用（一个线程处理多个socket连接），可以处理并发的连接
    + 非阻塞IO(epoll)
        + epoll的读,写,关闭,连接都会转换为事件
    + 内部事件框架

## 原子性
+ 并发安全
    + 单线程,请求排队处理

+ 原子命令
    + incr，decr
    + mset,mget


+ 加锁
    + 单机锁
        + mutex
    + 分布式锁
        + setnx
+ watch + MULTI(事务)

## redis事物
+ 不支持回滚
+ 中间命令出错会继续执行
    + 错误只会是语法错误或数据类型错误

## redis队列

+ list

## tips

+ 多路复用
    + select
    + poll
    + epoll

## ref
+ [Redis-接口的幂等性之Redis解决方案](https://madridseven.github.io/2019/08/JAVA%E8%BF%9B%E9%98%B6%E5%AD%A6%E4%B9%A0-%E6%8E%A5%E5%8F%A3%E7%9A%84%E5%B9%82%E7%AD%89%E6%80%A7%E4%B9%8BRedis%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/)
+ [Redis如何保证接口的幂等性？](https://cloud.tencent.com/developer/article/1752476)
+ [Redis为什么是单线程、及高并发快的3大原因详解](https://zhuanlan.zhihu.com/p/52600663)
+ [用了redis一定可以保证原子性吗](http://blog.itpub.net/70000438/viewspace-2787785/)
+ [Redis 事务](https://www.runoob.com/redis/redis-transactions.html)
<!-- 队列 -->
+ [Redis适合用来做什么？](https://segmentfault.com/a/1190000015894319)
+ [Redis 消息队列的三种方案（List、Streams、Pub/Sub）](https://www.51cto.com/article/640335.html)