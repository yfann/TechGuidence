# raft
+ Leader Election
+ Log Replication
+ Safety
+ 一致性(consensus)
    + 是具有容错性(fault-tolerant)的分布式系统的基础
    + 同一时刻所有节点对存储在其中的某个值都有相同结果
    + 小部分副本拓机，也可以对外服务
    + replicatred state machines
        + 所有节点从同一个state出发，经过同样的操作序列(log),最后达到同样的state
        
## tips
+ a protocol of distributed consensus
+ state
    + follower
        - 初始都是follower
        -  accept log entries from a leader and cast votes
    + candidate
    + leader
- leader election
    - follower(没收到leader的信息)->condidate
        + election timeout(amount of time a follower waits until becoming a condidate,randomized)
    - 要求其他节点vote
        + 重置其他followers的elction timeout
    - 成为leader(quotum votes)
        + send append entries message to followers through heart beats
        + heartbeats reset follower's election timeout 
            + if follower stop receving heartbeats and it will become condidate
- log replication
    - change: an entry in node's log
    - leader recevies an entry
    - leader replicates the entry to follower nodes
    - replicate a majority number of followers then leader commits the entry
    - followers commit the entry
- Committed Entry - An entry is considered committed when it is durably stored on a quorum of nodes
+ FSM
    +  Finite State Machine

## tips
+ 选主和复制日志

## ref
+ [一致性协议raft](http://thesecretlivesofdata.com/raft/)