# Paxos


## 多数派读写
+ 客户端写入W>=N/2+1个节点
+ 多数派读：W+R>N;R>=N/2+1
+ 最多容忍：（N-1）/2个节点损坏
+ 每笔写入增加一个全局递增的时间戳. 更大时间戳的记录如果被看见
+ 问题
    + 不能保证一致性

## classic Paxos
+ Proposer
    + 客户端

+ Acceptor
    + 存储节点
    + last_rnd 是Acceptor记住的最后一次进行写前读取的Proposer(客户端)是谁, 以此来决定谁可以在后面真正把一个值写到存储中.
    + v和vrnd是用于恢复一次未完成的paxos用的
        + v 是最后被写入的值.
        + vrnd 跟v是一对, 它记录了在哪个Round中v被写入了.

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
    + 每轮的编号(rnd):
        + 单调递增
        + 后写胜出
        + 全局唯一(区分Proposer)
    + 算法中也规定了每个Proposer都必须生成全局单调递增的round
    + 这样round既能用来区分先后也能用来区分不同的Proposer(客户端).
    

## tips
+ paxos核心
    + 多数派写时进行一次多少派读，每个节点记录最后一次读取到客户端，并只允许此客户端写入

## ref
+ [可靠分布式系统-paxos的直观解释](https://blog.openacid.com/algo/paxos/)
+ [漫话分布式系统共识协议: Paxos篇](https://zhuanlan.zhihu.com/p/35737689)
+ [Paxos](https://www.zhihu.com/question/388155097/answer/1953430986881754181)