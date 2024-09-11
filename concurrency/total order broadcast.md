# total order broadcast


+ Single-leader replication determines a total order of operations by choosing one node as the leader and sequencing all operations on a single CPU core on the leader. 


+ Total order broadcast is usually described as a protocol for exchanging messages between nodes. Informally, it requires that two safety properties always be satisfied:
    + Reliable delivery
        + No messages are lost: if a message is delivered to one node, it is delivered to all nodes.
    + Totally ordered delivery
        + Messages are delivered to every node in the same order.   

+ Consensus services such as ZooKeeper and etcd actually implement total order broadcast.  
## totao order broadcast VS linearizability
+ Total order broadcast is asynchronous: messages are guaranteed to be delivered reliably in a fixed order, but there is no guarantee about when a message will be delivered (so one recipient may lag behind the others). 
+ By contrast, linearizability is a recency guarantee: a read is guaranteed to see the latest value written.


## tips
+ consensus
    + total order broadcast
    + linearizable compare-and-set register
