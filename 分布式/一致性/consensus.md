# 一致性

+ 强一致性
    + 系统写入什么，就读出来什么
+ 弱一致性
    + 写成功后，不承诺立即读到写入值，不承诺多久之后能达到一致，尽可能在某个时间级别达到一致
+ 最终一致性
    + 保证多久之后达到一致

## 一致性算法
+ Raft(etcd)，zab(zookeeper)，paxos
    + 一个数据分片，多个副本间的数据一致性
+ 2pc,3pc
    + 多个数据分片上操作的原子性

## 缓存一致性

+ 提升性能，但也会导致数据不一致

+ Cache-Aside Pattern(旁路缓存模式)
    + 读
        + 先读缓存
        + 缓存没命中，则读数据库，放入缓存后返回结果
    + 写
        + 更新数据库，删除旧缓存

+ Read-Through/Write-Through（读写穿透）
    + Read-Through
        + cache provider封装了Cache-Aside
    + Write-Through
        + cache provider
        + 同步更新缓存和数据的

+ Write behind （异步缓存写入）
    + 只更新缓存,批量异步更新数据库

<!-- tips -->
+ 多个请求同时更新缓存会有脏数据，直接删除缓存比较好
+ 双写的情况下先写数据库，后写缓存
+ 缓存延时双删
    + 删缓存
    + 删数据库
    + 延时再删缓存
+ 删除缓存重试机制


## tips

+ ACK机制

## ref
+ [阿里三面：Redis与MySQL双写一致性如何保证？](https://zhuanlan.zhihu.com/p/475950018)