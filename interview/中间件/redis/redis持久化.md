 
## AOF(Append Only File)
+ 写后日志
+ 重启时通过执行 AOF 文件中的 Redis 命令来恢复数据
+ 类似MySql bin-log 的原理，AOF 能够解决数据持久化实时性问题，是目前 Redis 持久化机制中主流的方案。
+ AOF 持久化方案进行备份时，客户端所有请求的写命令都会被追加到 AOF 缓冲区中，缓冲区中的数据会根据 Redis 配置文件中配置的同步策略来同步到磁盘上的 AOF 文件中，追加保存每次写的操作到文件末尾。当 AOF 的文件达到重写策略配置的阈值时，Redis 会对 AOF 日志文件进行重写，给 AOF 日志文件瘦身。Redis 服务重启的时候，通过加载 AOF 日志文件来恢复数据。
+ limit
    + AOF 为了避免额外的检查开销，并不会检查命令的正确性，如果先记录日志再执行命令，就有可能记录错误的命令，再通过 AOF 日志恢复数据的时候，就有可能出错，而且在执行完命令后记录日志也不会阻塞当前的写操作
    + AOF 是存在一定的风险的，首先是如果刚执行一个命令，但是 AOF 文件中还没来得及保存就宕机了，那么这个命令和数据就会有丢失的风险，另外 AOF 虽然可以避免对当前命令的阻塞（因为是先写入再记录日志），但有可能会对下一次操作带来阻塞风险（可能存在写入磁盘较慢的情况）。
+ appendfsync 参数(决定AOF 什么时候写入磁盘)
    + always
        + 同步写入磁盘，只要有写入就会调用fsync函数；
        + 可靠性较高，数据基本不丢失，但是对性能的影响较大
    + everysec
        + 每秒调用fsync函数一次，每个命令执行完，先把日志写入 AOF 文件的缓冲区，每隔一秒把缓冲区的内容写入磁盘
        + 性能适中，即使宕机也只会丢失 1 秒的数据
    + No
        + 不调用fsync，让操作系统决定何时同步磁盘。每个命令执行完，先将日志写入 AOF 文件的缓冲区，由操作系统决定何时把缓冲区的内容写入磁盘
        + 性能好，但是发生宕机的情况丢失的数据较多
+ AOF 重写
    + 问题
        +  AOF 属于日志追加的形式来存储 Redis 的写指令，虽然有一定的写回策略，但毕竟 AOF 是通过文件的形式记录所有的写命令，但如果指令越来越多的时候，AOF 文件就会越来越大，可能会超出文件大小的限制。如果发生宕机，需要把 AOF 所有的命令重新执行，以用于故障恢复，数据过大的话这个恢复过程越漫长，也会影响 Redis 的使用。因此 Redis 提供重写机制来解决这个问题
    + AOF 重写的过程是通过主线程 fork 后台的 bgrewriteaof 子进程来实现的，可以避免阻塞主进程导致性能下降
        + AOF 每次重写，fork 过程会把主线程的内存拷贝一份 bgrewriteaof 子进程，里面包含了数据库的数据，拷贝的是父进程的页表，可以在不影响主进程的情况下逐一把拷贝的数据记入重写日志；
        + 因为主线程没有阻塞，仍然可以处理新来的操作，如果这时候存在写操作，会先把操作先放入缓冲区，对于正在使用的日志，如果宕机了这个日志也是齐全的，可以用于恢复；对于正在更新的日志，也不会丢失新的操作，等到数据拷贝完成，就可以将缓冲区的数据写入到新的文件中，保证数据库的最新状态。
## RDB
+ RDB是一种快照存储持久化方式，具体就是将Redis某一时刻的内存数据保存到硬盘的文件当中，默认保存的文件名为dump.rdb，而在Redis服务器启动时，会重新加载dump.rdb文件的数据到内存当中恢复数据。
+ 为了 RDB 数据恢复的可靠性，在进行快照的时候是全量快照，会将内存中所有的数据都记录到磁盘中，这就有可能会阻塞主线程的执行。
+ Redis 提供了两个命令来生成 RDB 文件，分别是 save 和 bgsave ：
    + save：
        + 执行 save 指令，阻塞 Redis 的其他操作，会导致 Redis 无法响应客户端请求，不建议使用。
    + bgsave：
        + 执行 bgsave 指令，Redis 后台创建子进程，异步进行快照的保存操作，此时 Redis 仍然能响应客户端的请求。
+ 自动间隔性保存
    + 让它在“ N 秒内数据集至少有 M 个改动”这一条件被满足时，自动保存一次数据集。
        + `save 60 10`
+ pros and cons
    + 优点
        + 相比AOF在恢复数据的时候需要一条条的执行操作命令，通过RDB文件恢复数据的效率更高；
        + 同样规模的内存数据，RDB文件数据更加紧凑，磁盘空间占用更小；
        + 适合全量备份内存数据场景；
        + 可以根据不同的时间间隔保存RDB文件，在恢复数据的时候可以更加灵活地选择对应版本数据进行恢复
    + 缺点
        + 由于RDB数据保存存在一定的时间间隔，因此存在丢失缓存数据的风险；
        + fork子进程进行RDB文件生成，由于是一次性生成一个内存快照文件，对于服务器磁盘IO以及Redis本身来说都属于重操作，可能会对服务器的磁盘IO造成压力。


+ bgsave
    + 通过 fork 创建的子进程能够获得和父进程完全相同的内存空间，父进程对内存的修改对于子进程是不可见的，两者不会相互影响；
    + 通过 fork 创建子进程时不会立刻触发大量内存的拷贝，内存在被修改时会以页为单位进行拷贝，这也就避免了大量拷贝内存而带来的性能问题；


## redis作为持久化数据的限制
+ 内存限制：Redis的主要设计目标是高性能的内存数据库，它将数据存储在内存中，以提供低延迟的读写操作。然而，内存是有限的资源，而且通常较为昂贵。如果需要存储大量的数据，那么内存成本会显著增加。

+ 持久性方案：Redis提供了持久性选项，如RDB快照和AOF日志，用于在某种程度上将数据持久化到磁盘。然而，这些持久性方案并不如传统的关系型数据库或一些专门的持久化数据库系统那样全面和灵活，而且可能在某些情况下存在数据丢失的风险。

+ 数据模型和查询能力：Redis的数据模型相对简单，支持基本的数据结构（如字符串、列表、哈希、集合和有序集合），但缺少复杂的查询和关系模型。对于需要复杂查询、连接和数据关系的应用，使用关系型数据库通常更合适。

+ 事务支持：虽然Redis提供了事务支持，但是不同于传统数据库中的ACID事务，Redis事务是一组操作的集合，而不是严格的事务，不能保证在多个操作之间的一致性。

+ 并发性：Redis在单线程中处理所有命令，这限制了它在某些高并发场景下的扩展性和性能。

## tips
+ Redis4.0 后大部分的使用场景都不会单独使用 RDB 或者 AOF 来做持久化机制，而是兼顾二者的优势混合使用。其原因是 RDB 虽然快，但是会丢失比较多的数据，不能保证数据完整性；AOF 虽然能尽可能保证数据完整性，但是性能确实是一个诟病，比如重放恢复数据。

+ Redis从4.0版本开始引入 RDB-AOF 混合持久化模式，这种模式是基于 AOF 持久化模式构建而来的，混合持久化通过 aof-use-rdb-preamble yes 开启。这样的好处是 RDB 快照不需要很频繁的执行，可以避免频繁 fork 对主线程的影响，而且 AOF 日志也只记录两次快照期间的操作，不用记录所有操作，也不会出现文件过大的情况，避免了重写开销。

+ fork
    + fork 函数调用时，父进程和子进程会被 Kernel 分配到不同的虚拟内存空间中，所以在两个进程看来它们访问的是不同的内存：
        + 在真正访问虚拟内存空间时，Kernel 会将虚拟内存映射到物理内存上，所以父子进程共享了物理上的内存空间；
        + 当父进程或者子进程对共享的内存进行修改时，共享的内存才会以页为单位进行拷贝，父进程会保留原有的物理空间，而子进程会使用拷贝后的新物理空间；
            + Copy-on-Write
    + 父进程对内存的修改在子进程中为什么是不可见的
        + 在现代操作系统中，每个进程都拥有自己的虚拟地址空间，这使得每个进程可以认为自己独占整个内存空间。虚拟内存通过内存管理单元（MMU）将进程的虚拟地址映射到实际的物理内存地址。因此，虽然多个进程可以在同一时刻运行，但它们各自操作的实际物理内存是隔离的。
        + 当一个进程 fork 出一个子进程时，子进程会复制父进程的内存映像，创建一个独立的虚拟地址空间。虽然虚拟地址空间的内容与父进程相同，但实际上这些地址在物理内存中可能是不同的。
        + 由于虚拟内存的隔离性，父进程和子进程之间的内存修改是相互独立的。父进程对内存的修改只会影响父进程自己的虚拟地址空间，而不会直接影响子进程的虚拟地址空间。子进程的内存空间是在 fork 时创建的，之后它会独立维护和修改这个内存空间，与父进程的修改是分开的。
        + 要在父进程和子进程之间共享数据，需要使用进程间通信（Inter-Process Communication，IPC）机制，如共享内存、管道、消息队列等。这些机制允许进程在不同的虚拟地址空间之间传递数据，从而实现进程间的数据共享和通信。


## ref
+ [深入解析Redis持久化机制](https://zhuanlan.zhihu.com/p/648301194)
+ [为什么 Redis 快照使用子进程](https://draveness.me/whys-the-design-redis-bgsave-fork/)