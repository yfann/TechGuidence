
## 分布式id

## Database Auto-Increment for Unique ID Generation
+ 

## snowflake
+ `| 1 bit (符号位) | 41 bits (时间戳) | 10 bits (机器标识) | 12 bits (序列号) |`
    + 符号位: 0
        + 表示正数
        + 很多编程语言中0为正数，1位负数
    + 序列号：在同一毫秒内自增，避免冲突
        + 自增超过1ms,则为0



## Redis/In-Memory Key-Value Store
+ 通过 Redis 的原子自增操作 (INCR) 实现全局唯一 ID


##  Zookeeper/Etcd 协调
+ 利用 Zookeeper 或 Etcd 的强一致性特性，通过节点递增生成唯一 ID。
    + 在 Zookeeper 中创建递增的临时节点，节点的编号即为唯一 ID。