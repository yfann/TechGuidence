
## MVCC

+ mysql innodb提供了MVCC机制（多版本并发控制）来实现读已提交、可重复读两种级别。

## 未解决问题
+ 幻读
    + solve：next-key lock
        + 行锁 + 间隙锁

+ 丢失更新
    + 当前读上锁