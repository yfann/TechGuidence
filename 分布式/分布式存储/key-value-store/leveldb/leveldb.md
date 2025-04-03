# levelDB
+ 使用LSM(log-structured Merge)
+ 可嵌入的key value存储
+ 数据查找
    + memtable -> immutable memtable -> L0 -> L1 -> L2 ...
+ atomic updates
    + writebatch
+ each file stores a sequence of compressed blocks
+ 日志保证原子性

## LRU（Least Recently Used）Cache 
+ 一种缓存策略，它用于在存储空间有限的情况下高效地管理数据，确保缓存中始终保留最近使用的数据，同时淘汰最久未使用的数据。
+ 实现：
    + 哈希表（HashMap）：用于 O(1) 时间复杂度快速查找缓存中的数据。
    + 双向链表（Doubly Linked List）：用于维护数据的访问顺序，最近使用的数据移动到链表头部，最久未使用的数据在链表尾部，方便 O(1) 时间复杂度进行删除操作。


## redo log

## Memtable
+ skiplist
    + skiplist利用原子变量实现了无锁
        + CAS

## SSTable File(sort string table)
+ table file只会从frozen memtable dump
+ 一旦sstable生成，只读不可修改(所以key的range是固定的)
+ 需要支持数据查询(point query)、遍历(方便compaction多路归并时scan)等能力


## Compaction(压缩)
+ 合并多个SSTable
+ 执行删除操作
+ Minor Compaction
    + MemTable--(写满)-->Immutable MemTable--->L0 SStable
+ Major Compaction
    + L0文件过多或L1等高层级文件数超阈值时触发
    + 合并不同层SSTable

## InternalKey
+ memtable,sstable file,comparator使用
+ [UserKey] + [SequenceNumber] + [ValueType]
    + UserKey（用户键）：用户实际存储的数据键。
    + SequenceNumber（序列号）：用于 区分同一个 UserKey 的不同版本，LevelDB 通过 SequenceNumber 来确保读取时返回最新的数据。
    + ValueType（值类型，占 1 bit）：标识该键的类型，有以下两种：
        + kTypeValue = 0x0（普通存储的键值对）
        + kTypeDeletion = 0x1（表示该 Key 被删除）
+ LevelDB 读取 key 时，会根据 SequenceNumber 最大的优先

+ 作用
    + 在 Get() 查询时，总是返回 SequenceNumber 最大的有效值，确保数据一致性。
    + 如果一个 Key 被 Delete()，LevelDB 并不会立即删除它，而是添加一个 Deletion InternalKey。
        + 在 Compaction 过程中，如果遇到一个 kTypeDeletion 标记的 Key，就可以安全地丢弃它及更早的版本。
    + 事物隔离
        + LevelDB 支持 Snapshot（快照），允许用户在某个时间点固定一个 SequenceNumber，之后的查询只能看到小于等于这个 SequenceNumber 的数据，从而实现事务隔离。

+ 在 SSTable 中，InternalKey 作为 Key 进行排序
    + 先按 UserKey 升序排序
    + UserKey 相同时，按 SequenceNumber 降序排序
        + 读取时，能快速找到 最新版本的数据。
        + Compaction 过程中，可以高效地 丢弃被覆盖的旧数据。

+ 实现
```cpp
// InternalKey 
struct ParsedInternalKey {
  Slice user_key;
  uint64_t sequence;
  ValueType type;
};
```
## 读写并发控制
+ 内存数据结构的无锁并发控制，leveldb中delete操作转化为put，没有删除的情况下实现lockfree的skiplist直接引入原子变量
+ 读操作与后台compaction并发控制，compaciton需要回收老的sstable file，读操作可能正在使用该file，阻塞compaction不是好的手段。由于sstable file天然就是多版本的，采用类似事务读写并发控制中MVCC方式，延迟table file的回收时间，等待所有读操作结束再尝试prune掉table file
+ immutable memtable，类似于double buffer，后台定期dump imm_，有效缓解阻塞前台写的可能性


## ref
+ [leveldb](https://github.com/google/leveldb)

+ [leveldb-handbook](https://leveldb-handbook.readthedocs.io/zh/latest/basic.html)
+ [透过leveldb感悟存储工程实践](https://zhuanlan.zhihu.com/p/516566364)
+ [深入理解leveldb：数据存储模型](https://zhuanlan.zhihu.com/p/523551998)
+ [深入理解leveldb：读写流程](https://zhuanlan.zhihu.com/p/531933689)

+ [leveldb源码分析](https://github.com/balloonwj/CppGuide/blob/master/articles/leveldb%E6%BA%90%E7%A0%81%E5%88%86%E6%9E%90/README.md)