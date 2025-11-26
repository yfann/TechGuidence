# LSM tree
+ 目的
    + 将写入优化为顺序写入，减少磁盘随机 I/O
    + 支持高吞吐量写入，同时保持一定的读取性能。

+ LevelDB 整体是单 writer 多 reader

+ 写入先到内存，再定期批量合并到磁盘，用 多层存储（层次） 来组织数据
    + MemTable（内存表）
        + 新写入的数据先写入内存中的结构（通常是跳表 SkipList 或红黑树）
        + 内存满了就会刷到磁盘形成 SSTable（Sorted String Table）。
    + SSTable（Sorted String Table磁盘表）
        + 有序的磁盘文件，通常不可变。
        + 支持顺序写入和顺序读取，避免随机写。
        + SSTable 会分层存储，形成 LSM Tree 的多级结构：L0, L1, L2...
    + Compaction（合并压缩）
        + 随着数据层次增多，老的 SSTable 会与新表进行合并压缩。
        + 作用：
            + 保持磁盘数据有序；
            + 清理删除标记（Tombstone）；
            + 避免读取时需要扫描太多文件
    + MemTable ---(flush)--> L0 SSTable -----(compaction)---> L1 SSTable ----(compaction)----->L2 SSTable
        + L0：可能有多个文件，数据无序，读取时需要合并扫描；
            + key 范围 可能重叠
        + L1 及以下：层内文件有序，读取可快速定位。
            + SST 严格不重叠

+ 写入（Write）
    + 先写 WAL（Write-Ahead Log），保证崩溃恢复；
    + 再写 MemTable（内存表）；
    + MemTable 满后 → 转成 Immutable MemTable
    + 后台线程把它 flush 成 Level-0 SST
    + Compaction 逐层合并 SST，提高读写效率、避免重复 key、清理墓碑标记（delete）
    
```pgsql
Put(key, value)
    ↓
追加到 WAL (log file)
    ↓
写入 MemTable（跳表）
    ↓
MemTable 满 → freeze 成 Immutable MemTable
    ↓
后台 Compaction：生成 Level-0 SST
```



+ 读取（Read）
    + 先查 MemTable
    + 再按层次从 L0 → L1 → L2 查找 SSTable；
    + 可利用 Bloom Filter 或索引快速定位，减少不必要磁盘扫描。
    + 读取优化
        + Block Cache
            + 缓存解压后的 Block
        + Table Cache
            + 避免频繁打开文件
        + Bloom Filter
            + 快速判断是否可能存在该 key

```pgsql
MemTable
    ↓
Immutable MemTable
    ↓
Level-0 SST (可能多个重叠)
    ↓
Level-1 SST (键区间不重叠)
    ↓
Level-n（逐层查找）

```



+ 删除
    + 不直接删除数据，而是写入 Tombstone（删除标记）；
    + 在合并压缩（Compaction）时真正删除。

+ 合并压缩（Compaction）
    + 定期将低层 SSTable 与高层 SSTable 合并；
    + 保持数据有序；
    + 去掉重复和删除的数据；
    + 保证 Level 间 key-range 不重叠
    + 可配置不同策略：
        + 大小层级合并（Size-Tiered Compaction）：同层文件达到一定数量才合并；
        + Leveled Compaction（层级合并）：每层限制文件总大小，尽量保持读取性能。

+ 优缺点
    + 优点：
        + 写入性能高，顺序写入磁盘；
        + 支持高吞吐量写入场景；
        + 顺序扫描读取效率高。
    + 缺点：
        + 读取延迟可能比 B-Tree 高（需要跨层查找）；
        + 需要额外的空间和计算进行 Compaction；
        + 写放大（Write Amplification）：一次写可能在合并中写多次磁盘

+ 实现
    + Cassandra、HBase、RocksDB、LevelDB 都是 LSM Tree 的典型实现
    + 特别适合日志系统、时间序列数据库、KV 存储等写密集型场景