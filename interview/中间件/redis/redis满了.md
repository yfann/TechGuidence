
## 内存淘汰策略
+ `config get maxmemory`
    + 查看redis可以使用的最大内存
+ `config get maxmemory-policy`
    + 查看内存淘汰策略
        + noeviction：不淘汰任何数据，当内存不足时，新增操作会报错，Redis 默认内存淘汰策略；
        + allkeys-lru：淘汰整个键值中最久未使用的键值；
        + allkeys-random：随机淘汰任意键值;
        + volatile-lru：淘汰所有设置了过期时间的键值中最久未使用的键值；
        + volatile-random：随机淘汰设置了过期时间的任意键值；
        + volatile-ttl：优先淘汰更早过期的键值。

## 内存淘汰算法
+ LRU(Least Recently Used)
    + 最近最少使用，是一种常用的页面置换算法，选择最近最久未使用的页面予以淘汰
    + LRU 算法需要基于链表结构，链表中的元素按照操作顺序从前往后排列，最新操作的键会被移动到表头，当需要内存淘汰时，只需要删除链表尾部的元素即可
    + 缺点
        + LRU 算法有一个缺点，比如说很久没有使用的一个键值，如果最近被访问了一次，那么它就不会被淘汰，即使它是使用次数最少的缓存，那它也不会被淘汰
+ LFU(Least Frequently Used)
    + 最不常用的，最不常用的算法是根据总访问次数来淘汰数据的，它的核心思想是“如果数据过去被访问多次，那么将来被访问的频率也更高
## ref
+ [面试官：Redis 缓存满了怎么办？](https://zhuanlan.zhihu.com/p/648553216)