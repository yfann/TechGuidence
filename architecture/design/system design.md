# system design

## functional requirements
+ inputs and outpus of the system
    + api design

## non-functional requirements
+ Scalability
    + vertical scaling
    + Horizontal scaling
        + stateless services is easy to scale
        + need a load balancer
            + HAproxy,Nginx
            + lv4 vs lv7 loadbalancer
                + lv4 在TCP layer, 不会读取packets的内容
                + lv7
                    + 根据packet内容路由
                    + auth
                    + TLS termination
                        + HTTPS->HTTP
            + loadbalancer vs reverse proxy
                + load balancing is for scalability
                + reverse proxy is a technique to manage client-server communication
                    
+ Availability
+ Performance/latency/P99/throughput
+ fault tolerance
    + Replication and redundancy
    + Forward error correction and error correction code
        + FEC通过添加冗余信息，接收端可以自行纠正一定数量的错误，从而减少了重传的需求，提高了数据传输的可靠性和效率。
    + Circuit breaker
        + The circuit breaker is a mechanism that stops a client from repeatedly attempting an operation that is likely to fail.
        + 有重试次数
    + Exponential backoff and retry
        + jitter
        + This prevents multiple clients from submitting retries at exactly the same time, causing a “retry storm” that may overwhelm the downstream service.
        + 随机重试时间
    + Caching responses of other services
        + we can cache the external service’s responses whenever we make successful requests and use these responses when the external service is unavailable.
    + Checkpointing
        + Writing a checkpoint after each subset of data points are processed and the result is successfully written. The replacement machine can resume processing at the checkpoint.
        + usage
            + ETL pipline
    + dead letter queue
        + If a write request to a third-party API fails, we can queue the request in a dead letter queue and try the requests again later.
            + The simplest option is that if it is acceptable to miss requests, just drop failed requests.
            + Implement the dead letter queue locally with a try-catch block. Requests will be lost if the host fails.
            + A more complex and reliable option is to use an event-streaming platform like Kafka.
    + Logging and periodic auditing
        + One method to handle silent errors is to log our write requests and perform periodic auditing. An auditing job can process the logs and verify that the data on the service we write to matches the expected values. This is discussed further in chapter 10.
    + Bulkhead
        + The bulkhead pattern is a fault-tolerance mechanism where a system is divided into isolated pools, so a fault in one pool will not affect the entire system.
    + fallback pattern
        +



+ security
+ privacy
+ acuracy
+ consistency
     + linearizability 
        + disadvantages
            + lower availability
     + eventual consistency
        + Techniques for eventual consistency that involve writing to a single location, which propagates this write to the other relevant locations:
            + Event sourcing
            + Coordination service
                + chooses a leader node
                + algorithms
                    + Paxos
                    + raft
                    + Zab
                + sample
                    + zookeeper
                    + 
            + Distributed cache
                + sample
                    + Redis 
                    + Memcached
        + techniques
            + gossip protocol
                + 节点通过相互之间的随机通信来传播信息，每个节点都可以向其它节点随机选择的一组邻居发送消息
                + sample
                    + Cassandra 
            + random leader selection
                + This simple algorithm does not guarantee one and only one leader, so there may be multiple leaders.
                + kafka
                    + fault tolerance
     + techniques
        + full mesh
            + 每个节点与网络中的每个其他节点都直接连接
            + 适用于samll cluster
        + quorum
+ cost
+ complexity

## interview
+ Clarify the requirements. Discuss tradeoffs.
    +  functional and non-functional requirements.
+ Draft the API specification.
+ Design the data model. Discuss possible analytics.
+ Discuss failure design, graceful degradation, monitoring, and alerting. Other topics include bottlenecks, load balancing, removing single points of failure, high availability, disaster recovery, and caching.
+ Discuss complexity and tradeoffs, maintenance and decommissioning processes, and costs.

## key concepts
+ Throughput
    + how much data is trsmitted successfully over a period of time.
    +  bits per second or bps.
+ Latency
    + the amount of time required for a single data to be delivered successfully.
    + milliseconds (ms)
+ Availability

+ Redundancy
    +  if one server goes down, then we have a redundant server in our system to balance the load.

+ Consistency
    + data uniformity in systems. 

+ Time

+ CAP



## ref
+ [system design](https://www.geeksforgeeks.org/what-is-system-design-learn-system-design/?ref=outind)
+ [Acing the System Design Interview](https://learning.oreilly.com/library/view/acing-the-system/9781633439108/OEBPS/Text/08.html#heading_id_3)
+ [system-design-primer](https://github.com/donnemartin/system-design-primer/blob/master/README-zh-Hans.md)
+ DDIA
+ [十年前的微信消息收发架构长啥样？](https://cloud.tencent.com/developer/article/2402411)