# cloak and order

## 日历时钟（time-of-day clock）和单调钟（monotonic clock

+ 日历时钟
    + 与 NTP同步

+ 单调钟
    + 测量elaspsed time


## order
+ timestamp（physical clocks）
    + global clock
        + A global clock would allow operations on two different machines to be ordered without the two machines communicating directly
    + local clock
    + no clock

+ Lamport clock
    + 逻辑时钟
    + partial order
    + counters can be compared across systems
    + rely on counters and communication to determine the order of events across a distributed system. These clocks provide a counter that is comparable across different nodes.
    + Each process maintains a counter using the following rules:
        + Whenever a process does work, increment the counter
        + Whenever a process sends a message, include the counter
        + When a message is received, set the counter to max(local_counter, received_counter) + 1

##  Vector clocks (time for causal order)
+ 是一种用于实现分布式系统中事件顺序一致性（如并发控制）的算法
    + 它能够帮助系统中的各个节点相互了解发生了哪些事件
    + 并在一定程度上判断事件之间的因果关系。

+ an extension of Lamport clock
+ maintains an array [ t1, t2, ... ] of N logical clocks - one per each node
    +  one entry per node
+ each node increments its own logical clock in the vector by one on each internal event
    + 每个节点初始时会为自己设置一个向量时钟，所有元素为0，表示还没有发生任何事件。
    + 本地事件（如处理请求或执行操作）发生时，节点会增加自己的时钟值，而其他节点的时钟值保持不变
    + 节点间的消息传递时，发送方将自己的向量时钟附加到消息中，接收方会更新其自己的向量时钟。
    + When a message is received:
        + update each element in the vector to be max(local, received)
        + increment the logical clock value representing the current node in the vector    
        + 

+ 向量时钟的因果关系
    +  v(A)<v(B)
        + A的事件先于节点B的事件发生
    + 如果两个向量时钟不可比（即V(A)和V(B)在某些位置上同时较大），则可以认为两个事件是并发的，即它们之间没有直接的因果关系。

+ flaw
    + 存储开销较大：随着系统中节点数的增加，向量时钟的大小会增加，存储开销也会显著增大。

## tips
+ You can transform a partial order into a total order, but this requires communication
    + 单一node处理所有event

## ref
+ [单调钟与日历时钟](http://ddia.vonng.com/#/ch8)

+ [Replacing cron jobs with systemd timers](https://moshib.in/posts/replacing-cron-jobs-with-systemd-timers/)