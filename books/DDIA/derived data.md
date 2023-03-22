
## system
+ system of record
    + source of truth

+ derived data systems
    + 数据派生自记录系统
        + cache

## processing(构建derived data)
+ batch processing
+ stream processing
    + event stream
    + 无界限

## derived data vs distribute data

+ 分布式事务
    + 不同数据库一致
        + 两阶段提交
    + 锁
        + 决定写入顺序

+ CDC,事件溯源
    + 日志排序
        + 决定写入顺序
    + 确定性重试，幂等性

## tips
+ event steam/topic

+ cache/materialized view

+ write path/read path