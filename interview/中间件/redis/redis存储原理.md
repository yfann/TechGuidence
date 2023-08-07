## redis底层原理
+ Redis 中的数据就是一个个键值对，其中的 key 是字符串对象，而 value 可以是许多类型对象（String、List、Hash 等，后续会讲到）。Redis 使用了一个哈希表「dictht」来保存所有键值对

## 底层结构
+ redisDb
    + 表示 Redis 数据库的结构，结构体里存放了指向了 dict 结构的指针
+ dict
    + 结构体里存放了 2 个哈希表，正常情况下都是用「哈希表1」，「哈希表2」只有在 rehash 的时候才用（当哈希冲突率过高时，会触发 rehash 来扩容，后续会详细讲解）；
+ dictht
    + 表示哈希表的结构，结构里存放了哈希表数组，数组中的每个元素都是指向一个 dictEntry 的指针；
+ dictEntry
    + 表示哈希表节点的结构，结构里存放了 void * key 和 void * value 指针， *key 指向的是 String 对象，而 *value 则可以指向任意类型对象。key 指针和 value 指针各占 8 个字节。
    + 指向下一个hash冲突的dictEntry，形成链表

## 查找数据
+ 在进行哈希表操作时，首先对 key 进行哈希计算，根据哈希值（对应的是数组的下标）找到对应的槽位（dictEntry），然后遍历该槽位的链表，查找与 key 相同的节点。如果哈希冲突率较低，链表的长度较短，那么整个过程的时间复杂度大约为常数级别，即 O(1)。

## redisObject
+ string
+ list
+ hash
+ set

## rehash

## ref
+ [Redis 底层数据结构的实现原理是什么？](https://www.zhihu.com/question/484626962/answer/2939438430)