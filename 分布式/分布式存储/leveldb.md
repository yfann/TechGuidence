# levelDB

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
## ref
+ [透过leveldb感悟存储工程实践](https://zhuanlan.zhihu.com/p/516566364)
+ [leveldb-handbook](https://leveldb-handbook.readthedocs.io/zh/latest/basic.html)
+ [深入理解leveldb：数据存储模型](https://zhuanlan.zhihu.com/p/523551998)