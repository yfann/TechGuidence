# Redis实现分布式锁

<!-- 加锁 -->
+ `set act_lock 111 NX`
    + NX 表示只有当key不存在时，该命令执行成功，否则失败
<!-- 锁超时 -->
+ `set act_lock 123 NX EX 10`
    + `ttl act_lock` 查看剩余时间
<!-- 解锁 -->
+ `del act_lock`
```lua
get act_lock
if (val == uuid)
{
    / 解锁
    del act_lock ;
}
-- 原子操作
local uuid = redis.call("get", KEYS[1])
if uuid == KEYS[2] then
  redis.call("del", KEYS[1])
end
```
<!-- 重入锁 -->

## redlock的容错性问题
+ redis有5个备份节点,申请锁资源要半数以上节点回复确认，则成功获取锁，保证数据一致性

+ redis集群主从复制采用的是异步复制的方式，存在主从数据不一致问题，数据丢失意味着锁丢失
    + 用redlock解决
        + 执行加锁时向所有的节点都执行相同语句，有半数以上（N/2 + 1）写成功就表示加锁成功。
        + 解锁，需要对每个进程执行解锁操作，超过半数以上成功才能说明解锁成功。

## VS
+ 完备性：etcd > redis >mysql
+ 性能： redis > etcd > mysql