# Paxos
+ 一个 Paxos 实例 (instance) = 一次就某个“位置”或“议题”达成共识的完整过程。
    + 它有一个 唯一的 slot/index
    + 它的目标是对某个值 v 达成一致
    + 一旦这个实例决定了某个值，这个位置就不能更改

+ log of commands
    + 追加操作
        + Paxos 实例 1：set(X=10)
        + Paxos 实例 2：set(X=20)
        + Paxos 实例 3：set(Y=30)




## 多数派读写
+ 客户端写入W>=N/2+1个节点
+ 多数派读：W+R>N;R>=N/2+1
+ 最多容忍：（N-1）/2个节点损坏
+ 每笔写入增加一个全局递增的时间戳. 更大时间戳的记录如果被看见
+ 问题
    + 多数写同时发生时会发生冲突

## classic Paxos
+ Proposer
    + 客户端

+ Acceptor
    + 存储节点
    + last_rnd 
        + Acceptor记住的最后一次进行写前读取的Proposer(客户端)是谁, 以此来决定谁可以在后面真正把一个值写到存储中.
    + v和vrnd是用于恢复一次未完成的paxos用的
        + v 是最后被写入的值.
        + vrnd 跟v是一对, 它记录了在哪个Proposer的哪个Round中v被写入了.

+ Quorum
    + 多数派,半数以上acceptor

+ Round
    + 每个round是2次多数派读写
        + phase-1
            + 相当于之前提到的写前读取过程. 
            + 它用来在存储节点(Acceptor)上记录一个标识: 
                + 我后面要写入; 
            + 并从Acceptor上读出是否有之前未完成的paxos运行. 如果有则尝试恢复它; 如果没有则继续做自己想做的事情
        + phase-2
    + 算法中也规定了每个Proposer都必须生成全局单调递增的round
        + 每轮的编号(rnd):
            + 单调递增
            + 后写胜出
            + 全局唯一(区分Proposer)
        + 这样round既能用来区分先后也能用来区分不同的Proposer(客户端).
    

## multi-paxos
+ 缺点
    + 每次写入要两轮rpc(phase-1,phase-2)

+ 优化
    + 将多个paxos实例的phase-1合并到1个RPC

## fast-paxos
+ 增加quorum的数量来达到一次rpc就能达成一致的目的. 如果fast-paxos没能在一次rpc达成一致, 则要退化到classic paxos.

## tips
+ paxos核心
    + 多数派写时进行一次写前读，每个节点记录最后一次读取的客户端，并只允许此客户端写入
+ livelock
    + 多个Proposer并发对一个值运行paxos时，可能会覆盖对方的rnd
    + 自己提升rnd后再尝试，仍然参数冲突，一直无法完成

+ 分布式 KV 存储实际上是：
    + Paxos + 状态机（操作日志执行）。
    + Paxos 决定的是日志中的操作，而不是某个 key 的最终值。
    + 每次对 KV 的修改对应一个 Paxos 实例（日志槽位）。

## ref
+ [可靠分布式系统-paxos的直观解释](https://blog.openacid.com/algo/paxos/)
+ [漫话分布式系统共识协议: Paxos篇](https://zhuanlan.zhihu.com/p/35737689)
+ [Paxos](https://www.zhihu.com/question/388155097/answer/1953430986881754181)