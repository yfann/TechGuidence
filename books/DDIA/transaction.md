## Transaction

+ 为了简化应用编程模型而创建的
    + safety guarantees

+ 隔离级别
    + read committed
    + snapshot isolation
    + serializability

+ ACID
    + Atomicity(*)
        + all-or-nothing
    + Consistency
    + Isolation(*)
        + 解决并发问题(race conditions/竞争条件)
        + 隔离级别
            + 可串行(serializable)
                + 一次执行一个事务，没有并发
            + 非串行的(nonserializable),弱隔离级别
                + 只读事务在并发写入时可以看到:
                    + 读已提交(Read committed)
                        + 读数据库时只能读取已提交的数据(没有dirty reads)
                            + 防止脏写
                                + 行锁(row-level lock)
                                    + 只有等持有锁的事务提交时，后续写事务才能获取锁写入数据
                        + 写数据库时，只能覆盖已写入的数据(没有dirty writes)
                            + 防止脏读
                                + 数据库会同时持有旧值和新值(两个版本就够了，MVCC需要多个版本)，新值提交前只会返回旧值
                        + 未解决:
                            + nonrepeatable read
                                + 暂时性的，刷新页面可以解决
                    + 快照隔离(snapshot isolation)
                        + 不同name: serializable,repeatable read
                        + 事务从数据库的一致快照(consistent snapshot)读取数据
                            + 事务读取事务开始时的数据（中间数据被其他事务改变，也只会读取旧数据）
                            + 写需要锁，读不需要（读不阻塞写，写不阻塞读）
                            + 数据库维护单个对象的多个版本,多版本并发控制（MVCC, multi-version concurrency control）
                                + 用MVCC实现read committed
                                + MVCC的索引
                                    + 所有版本都添加索引，查询时过滤不可见对象
                                    + 仅追加的B树，每个写入事务都会创建一个新的B树
                            + 对整个事务使用相同快照
                                + 读已提交是对每个查询使用单独的快照
                            + 每个事务都有一个唯一id,任何操作都会被记录到行中的created_by,deleted_by
                                + 事务id决定他可以看到哪些对象
                                + UPDATE 操作在内部翻译为 DELETE 和 INSERT
                                    + 不原地更新对象
                        + 解决了nonrepeatable read
                            + 对长时间运行的读查询(备份，分析)很有用
                                + 不会造成分析错误
                + 两个事务并发写问题
                <!-- lost update, (read-update-write)序列事务会产生(多个事务更新同一个对象) -->
                    + 原子写(update ... set 一般数据库提供)
                        + 使(read-update-write)顺序发生
                            + 游标稳定性（cursor stability）
                                + 原子操作在读取对象时会获取其上的排它锁，更新完之前没有事务可以读取他
                            + 单线程上执行
                    + 显示锁定
                        + 应用实现
                    + 自动检查丢失的更新
                        + (read-update-write)并行，如果事务管理器检查到lost update，则终止事务并重试(read-update-write)
                    + CAS(Compare and set)
                        + 不提供事务的数据库的一种原子操作
                    + 冲突解决
                        + 锁和 CAS 操作假定只有一个最新的数据副本
                            + 多主或无主复制的数据库通常允许多个写入并发执行，并异步复制到副本上，因此无法保证只有一个最新数据的副本
                            + 锁或 CAS 操作的技术不适用于这种情况
                        + 允许写入多个冲突版本的值，在应用中合并冲突(Git中的冲突)
                    + 复制
                        + 最后写入胜利（LWW
                <!-- 写入偏斜与幻读-->
                    + 写偏差
                        + (两个事务读取相同的对象，然后更新其中一些对象，不同事务可以更新不同对象) 例子：会议室预定
                        + 解决
                            + 涉及多个对象，原子操作不起作用
                            + `FOR UPDATE` 锁定返回的行用于更新
                            + 串行化
                            + huan'du
                    + 幻读
                        + 一个事务中的写入改变另一个事务的搜索查询的结果
                        + 快照隔离避免了只读查询中幻读
                        + 读会导致特别棘手的写入偏差情况
                        + 物化冲突（materializing conflicts）,一般最后的手段
                            + 没有对象可以加锁
                                + 可以人为地在数据库中引入一个锁对象
                    + 可串行化
                    
    + Durability

+ BASE
    + Basically Available
    + Soft State
    + Eventual consistency

    
+ 多对象写入
    + multi-object transaction
        + 许多分布式数据存储已经放弃了多对象事务，因为多对象事务很难跨分区实现

+ 单对象写入
    + 一个大对象写了一半，网络断开...
        + 在文档数据模型中，需要一起更新的字段通常在同一个文档中，这被视为单个对象
    + 存储引擎一般对单节点单对象提供原子性和隔离性
        + 原子性
            + write-ahead log
            + CAS,compare-and-set(值没被其他并发改过时，才允许执行写操作) (轻量级事务)
            + atomic increment
        + 隔离性
            + 锁，每次只允许一个线程访问对象

## tips
+ 没有原子性，错误处理就要复杂得多，缺乏隔离性，就会导致并发问题
+ 2PC, two-phase commit
+ Heisenbug(偶然发生的瞬时bug)
+ Bohrbugs(确定性问题)
+ 并发问题
    + 写偏差（两个事务读取相同的对象，然后更新其中一些对象，不同事务可以更新不同对象）
    + 脏写，lost update（多个事务更新同一个对象）

## ref
+ [第七章：事务](http://ddia.vonng.com/#/ch7)