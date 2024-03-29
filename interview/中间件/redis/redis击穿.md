
## 缓存击穿
+ 指的是缓存中的某个热点数据过期了，但是此时大量的并发请求访问这个key的值，此时因为缓存过期无法从缓存中获取，直接访问数据库，数据库很容易就会被这些高并发的请求冲垮，这就是缓存击穿。
+ 解决方案
    + 热点数据不要设置过期时间，或者在热点数据即将要过期前，提前通过后台线程更新缓存以及重新设置过期时间；
    + 互斥锁方案，在缓存失效的瞬间，通过在获取缓存数据前设置一个互斥锁，只允许一个请求去查询数据库，其他请求等待，避免同时压垮数据库

## 缓存穿透
+ 假如用户访问的数据，既不在缓存中，也不在数据库。于是请求在访问缓存时，发现缓存没有命中，继续访问数据库，发现数据库中也没有对应的key值。当有大量这样的并发请求到来时，数据库的压力激增，这就是缓存穿透。
+ 缓存空值或者默认值
    + 出现缓存穿透的现象时，我们可以针对查询的数据，在缓存中设置一个空值或者默认值，这样后续请求就可以从缓存中读取到空值或者默认值，从而不会继续查询数据库。
+ 使用布隆过滤器
    + 布隆过滤器是一种数据结构，更准确的说是一种概率型的数据结构，因为它能判断某个元素一定不存在或者是可能存在。

## 缓存雪崩
+ 就是指在大量的应用请求无法在 Redis 缓存中进行处理，然后应用将大量请求发送到数据库层，导致数据库层的压力骤增
    + 缓存中的大量数据在同一时间过期，导致大量请求无法得到处理。
    + Redis 缓存实例发生故障宕机了，无法处理请求，导致大量请求一下子积压到数据库层面
+ 大量数据同时过期解决：
    + 过期时间添加随机数
        + 我们要避免给大量的数据设置相同的过期时间。如果业务真的有这个需求，我们可以在用 EXPIRE 命令给每个数据设置过期时间时，给这些数据的过期时间增加一个较小的随机数，既能避免了大量数据同时过期，又保证了这些数据基本在相近的时间失效，依然能满足业务需求。    
    + 互斥锁
        + 当业务线程在处理用户请求时，如果发现访问的数据不在 Redis 里，就加个互斥锁，保证同一时间内只有一个请求来构建缓存，当缓存构建完毕后，再释放锁。未能获取互斥锁的请求，要么等待锁释放后重新读取缓存，要么就返回空值或者默认值。

+ Redis 故障宕机解决:
    + 服务熔断或请求限流
        + 发生缓存雪崩时，为了防止引发连锁的数据库雪崩，甚至是整个系统的崩溃，我们暂停业务应用对缓存系统的接口访问。具体点说，就是业务应用调用缓存接口时，缓存客户端并不把请求发给 Redis 缓存实例，而是直接返回，等到 Redis 缓存实例重新恢复服务后，再允许应用请求发送到缓存系统。为了减少对业务的影响，我们可以启用请求限流机制，只将少部分请求发送到数据库进行处理，再多的请求就在入口直接拒绝服务，等到 Redis 恢复正常并把缓存预热完后，再解除请求限流的机制。
    + 构建 Redis 缓存高可靠集群
        + 如果 Redis 缓存的主节点故障宕机了，从节点可以切换成为主节点，继续提供缓存服务，避免了由于缓存实例宕机而导致的缓存雪崩问题。

## ref
+ [redis 如何解决缓存雪崩、击穿、穿透难题](https://zhuanlan.zhihu.com/p/648302136)