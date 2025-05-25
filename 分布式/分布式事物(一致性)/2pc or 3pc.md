# 2PC/3PC
+ 1 coordinator + many voter

## 2PC
+ Prepare/Commit
+ 过程
    1. coordinator向所有participant发送事物内容,询问是否可以提交事物，等待participant的响应
    2. 各participant执行事物,Undo和Redo计入本机事务日志
    3. 各participant响应coordinator
    4. if全部是yes则coordinator向所有participant发送commit请求
        + 各particicipant提交事物，发送Ack给coordinator
        + coordinator收到所有Ack完成事物
    5. if有participant返回No
        + coordinator向所有participant发送Rollback请求
        + participant利用本机Undo信息执行Rollback,向Coordinator发送Ack

+ 缺点
    + 所有参与事务操作的逻辑都处于阻塞状态
        + 协调者需要等待所有参与者的响应，这会导致长时间的阻塞，并且可能出现协调者或参与者故障时的不一致状态。
    + coordinator是单点
    + 数据不一致
        + coordinator发送commit的过程中发生网络问题，只要部分participant收到commit请求，执行commit操作
    + 容错
        + 依赖超时判断是否中断事物
    + fail-stop会失败
        + 在commit phase,当coordinator和一个voter挂掉时，无法继续
            + voter处于uncertain
                + blocking

## 3pc
+ Prepare/PreCommit/Commit
+ process
    + prepare: coordinator向所有participant发送含事物内容的canCommit请求
        + 与2PC相同，协调者向所有参与者发送准备请求，并等待参与者的响应。参与者执行本地事务，并将执行结果（“准备就绪”或“中止”）发送回协调者
    + PreCommit: 如果所有参与者都准备就绪，则协调者向所有参与者发送预提交请求，并等待参与者的响应。参与者在收到预提交请求后，将事务的状态保存在稳定存储中，但不执行实际的提交操作。
    + Commit: 在收到所有参与者的预提交响应后，协调者向所有参与者发送提交请求。参与者执行事务的提交操作，并将执行结果发送回协调者。
+ nonblocking
    +  3PC在2PC的Commit阶段里增加了一个barrier(即相当于告诉其他所有voter, 我收到了Propose的结果啦). 在这个barrier之前coordinator掉线的话, 其他voter可以得出结论不是每个voter都收到Propose Phase的结果, 从而放弃或选出新的coordinator; 在这个barrier之后coordinator掉线的话, 每个voter会放心的commit, 因为他们知道其他voter也都做同样的计划.
    
+ 缺点
    + precommit不能处理network partition
        + 由于网络故障，导致两边 的voter做出不同决定


## 2PC vs 2PL
+ two phase commit
    + 保证事物原子性，分布式一致性

+ two phase locking
    + 保证事物serializable
    + Growing
        + 申请锁
    + shrinking阶段
        + 释放锁
    + S(trong)S(trict)2PL
        + 只能在事务结束后再释放锁，完全杜绝了事务未提交的数据被读到。

## ref
+ [漫话分布式系统共识协议: 2PC/3PC篇](https://zhuanlan.zhihu.com/p/35298019)