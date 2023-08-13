## 日志
+ 用户记录逻辑操作记录（binlog）
+ 物理变更记录（redolog）
+ 现场日志（undolog）
+ 错误日志（errorlog）
+ 慢查询日志（slow query log）

## redo log
+ redo log 是执行引擎层的 log 文件
    + innoDB的

+ 降低update对磁盘的访问
    + update 操作其实是分为两步操作，先查询到对应的行记录，再根据条件进行更新操作。如果没有 redo log 的话，MySQL 每次的update操作都要更新磁盘文件，更新磁盘文件需要先在磁盘中找到对应的行记录，再更新，每一条 update 语句都要操作磁盘文件，整个过程的 I/O 成本，查找成本都很高。为了解决这个问题，InnoDB 引擎的设计者想到了一个办法，先将记录写到 redo log 中，并更新内存，这个时候更新就算完成了，操作内存比操作磁盘要快的多。同时，InnoDB 会在适当的时候，将 redo log 中的记录更新到磁盘文件中。这个更新往往是系统空闲时做。

+ redo log满了
    + InnoDB 的 redo log 文件是固定大小的，比如可以配置一组4个文件，每个文件大小是 1GB，那么 redo log 中可以记录 4GB 的操作，InnoDB 会从第一个文件开始写入，直到第四个文件写满了，又回到第一个文件开头循环写，如下图
    + write pos是当前记录的位置，一边写一边后移，写到第3号文件末尾后就回到0号文件开头
    + checkpoint是当前要擦除的位置，也是往后推移并且循环的，擦除记录前要把记录更新到数据文件
    + write pos和checkpoint之间的是 redo log上还空着的部分，可以用来记录新的操作。如果write pos追上checkpoint，表示 redo log 满了，这时候不能再执行新的更新，得停下来先擦掉一些记录，把checkpoint推进一下
    + 有了redo log，InnoDB就可以保证即使数据库发生异常重启，之前提交的记录都不会丢失，这个能力称为crash-safe

+ 写入 redo log 分为两个步骤，prepare 和 commit，这就是“两阶段提交”。
    + 为了让 redo log 和 binlog 两个文件保持一致
    + 能够保证 redo log 和 binlog 的操作记录一致的流程是，将操作先更新到内存，再写入 redo log，此时标记为 prepare 状态，再写入 binlog，此时再提交事务，将 redo log 标记为 commit 状态。

## binlog vs redolog
+ redo log 是InnoDB 引擎特有的；而 binlog 是MySQL Server 层实现的
+ redo log 是物理日志，记录的是“在某个数据页做了什么修改”；而 binlog 是逻辑日志，记录的是语句的原始逻辑。比如 update T set c=c+1 where ID=2;这条SQL，redo log 中记录的是 ：xx页号，xx偏移量的数据修改为xxx；binlog 中记录的是：id = 2 这一行的 c 字段 +1
+ redo log 是循环写的，固定空间会用完；binlog 可以追加写入，一个文件写满了会切换到下一个文件写，并不会覆盖之前的记录
+ 记录内容时间不同，redo log 记录事务发起后的 DML 和 DDL语句；binlog 记录commit 完成后的 DML 语句和 DDL 语句
+ 作用不同，redo log 作为异常宕机或者介质故障后的数据恢复使用；binlog 作为恢复数据使用，主从复制搭建。

## undo log
+ undo log 和 redo log 也是引擎层的 log 文件，undo log 提供了回滚和多个行版本控制（MVCC），在数据库修改操作时，不仅记录了 redo log，还记录了 undo log，如果因为某些原因导致事务执行失败回滚了，可以借助 undo log 进行回滚。

+ undo log 和 redo log 都是InnoDB 特有的，但 undo log 记录的是 逻辑日志，redo log 记录的是物理日志。

+ undo log 日志用于存放数据被修改前的值
    + 如果这个 update 出现异常需要回滚，可以使用 undo log 实现回滚，保证事务一致性。

+ MVCC
    + 当读取的某一行被其他事务锁定时，它可以从 undo log 中获取该行记录以前的数据是什么，从而提供该行版本信息，让用户实现非锁定一致性读取

## update操作流程

1. 执行器先通过引擎查询到 id = 2 这行数据，id 是主键，直接遍历主键索引树直接插到这行数据，如果这行数据所在的数据页在内存中，就直接返回结果给执行器，否则，需要先从磁盘读入内存，然后再返回。

2. 执行器拿到引擎给的行数据，把 这个值+1，得到新的一行数据，再调用引擎接口写入这行数据。

3. 引擎将这行数据更新到内存中，同时记录到 redo log 中，此时 redo log 处于 perpare 状态，此时就告知执行器已经更新完成了，随时可以提交事务。

4. 执行器生成这个操作的binlog，并把binlog写入磁盘

5. 执行器调用引擎的提交事务接口，引擎把刚刚写入的redo log改成提交（commit）状态，更新完成


## tips
+ `redo log` 用来保证 crash-safe，`binlog` 用来保证可以将数据库状态恢复到任一时刻，`undo log` 是用来保证事务需要回滚时数据状态的回滚和 MVCC 时，记录各版本数据信息。

## ref
+ [彻底搞懂MySQL的redo log，binlog，undo log](https://juejin.cn/post/6987557227074846733)