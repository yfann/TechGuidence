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
+ security
+ privacy
+ acuracy
+ consistency
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
+ [How Pinterest scaled to 11 million users with only 6 engineers](https://read.engineerscodex.com/p/how-pinterest-scaled-to-11-million)
+ [How Facebook created the largest Memcached system in the world](https://read.engineerscodex.com/p/how-facebook-scaled-memcached)
+ [How Instagram scaled to 14 million users with only 3 engineers](https://read.engineerscodex.com/p/how-instagram-scaled-to-14-million)


+ [system design](https://www.geeksforgeeks.org/what-is-system-design-learn-system-design/?ref=outind)
+ [Acing the System Design Interview](https://learning.oreilly.com/library/view/acing-the-system/9781633439108/OEBPS/Text/08.html#heading_id_3)
+ DDIA

+ [system-design-primer](https://github.com/donnemartin/system-design-primer/blob/master/README-zh-Hans.md)