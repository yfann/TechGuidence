# GFS(google file system)
+ Master-Slave Architecture
    + Master
        + 管理整个文件系统的元数据，如命名空间、文件到块（chunk）的映射、chunk 的副本位置等
        + 维护 chunk 的 lease（租约）信息
        + 不直接参与数据传输，因此性能瓶颈较小。
    + Chunkserver
        + 实际存储文件的数据块（chunk），一个 chunk 默认大小为 64MB（远大于传统文件系统的 4KB 块）
        + 每个 chunk 通常存储 3 个副本（可以配置），分布在不同的 chunkserver 上。
        + Chunkserver 周期性向 Master 汇报状态（心跳机制）。
    + Client
        + 直接与 Chunkserver 通信读取或写入数据。
        + 向 Master 查询元数据，但不会频繁请求，减少 Master 压力。

## 副本策略
+ 默认每个 chunk 有三个副本。
+ Master 负责选择副本的存储位置，考虑负载均衡、故障恢复、网络拓扑等因素。
+ 副本恢复由 Master 触发，自动检测丢失副本并复制新的副本。


## 一致性模型
GFS 提供 弱一致性（relaxed consistency），其关键特性如下：
+ 原子性记录追加（record append）：支持多个 client 并发向同一个文件追加记录，每条记录在文件中至少写入一次，不会被破坏。
+ 写操作不是立刻同步的，而是通过 lease 控制主副本写入顺序。


## 写过程
1. Client 向 Master 请求 写入某个 chunk。
2. Master 返回 chunk handle 和副本所在的 chunkserver 地址，并指定一个副本作为 primary（主副本）。
3. Client 将数据推送 到所有副本（采用流水线方式）。
4. Client 发送写请求 给 primary，primary 再按顺序协调其他副本进行写入。
5. 所有副本确认 写入后，primary 回复客户端操作成功。


## 容错与恢复机制
+ 容错机制
    + 副本机制：任意 chunkserver 宕机不影响数据读取。
    + Master 持久化元数据：定期将元数据写入日志和 checkpoint 文件，存储在多个位置。

+ 恢复机制
    + chunkserver 启动时会扫描本地 chunk，向 Master 报告。
    + Master 检测副本数量不够时，自动触发副本复制。
    + Master 自身使用 shadow master 和主备切换策略，提高容错能力。

## chunk
+ 分散存储到多台服务器
+ 多个客户端可以并发访问不同 chunk，提高吞吐量
+ 写操作只需更新相关 chunk，不影响整个文件
+ 出现硬件故障时，只需修复受影响的 chunk，而不必重建整个文件
+ Chunk 较大（64MB）意味着一个文件只包含少量 chunk，即使是大文件


## tips
+ 记录追加（record append）操作则保证多客户端并发操作是原子的。

## ref
+ [Paper Notes: The Google File System](https://distributed-computing-musings.com/2023/07/paper-notes-the-google-file-system/)