# Mysql数据库实现分布式锁

```sql
DROP TABLE IF EXISTS `dislock`;
CREATE TABLE `dislock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lock_type` varchar(64) NOT NULL COMMENT '锁类型',
  `owner_id` varchar(255) NOT NULL COMMENT '持锁对象',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lock_type` (`lock_type`) 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT
CHARSET=utf8 COMMENT='分布式锁表';

-- 加锁
INSERT INTO dislock (`lock_type`, `owner_id`) VALUES ('act_lock', 'ad2daf3');
-- 解锁  MySQL中解锁无法通知，其他实例只能轮询看是否能加锁
DELETE FROM dislock WHERE `lock_type` = 'act_lock' AND `owner_id` = 'ad2daf3';
-- 锁超时  MySQL中有超进程，利用定时器实现定时检测表，用当前时间减去update_time，如果超过最大持锁时间，就主动删除这条记录（释放锁）
-- 重入锁  在表结构中加一个count字段，加锁count加一，解锁count减一；当count等于0时删除数据（解锁）
```

## 优点
+ 简单易用
+ 数据持久性
+ 可靠性
    + MySQL 提供ACID
    
## 缺点
+ 效率不高，需要另起一个线程检测锁超时；并且MySQL是一种关系型数据库，对于高并发的场景可能存在性能瓶颈，因为每次获取或释放锁都需要与数据库进行交互。
+ 锁释放不能主动通知，只能通过主动探寻解决；
+ 还需额外实现锁失效的问题，解锁失败，其他线程将无法获得锁
+ 单点故障：如果使用单个MySQL实例作为分布式锁的中心节点，当该节点发生故障时，整个分布式锁系统将失效。