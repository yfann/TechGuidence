# rate limiting

![](img/rebalancing%20ETL%20job.png)
+ We can periodically run a batch ETL job that reads the request logs, identifies hosts that receive large numbers of requests, determines an appropriate load balancing configuration, and then writes this configuration to a configuration service. 


## synchronizing counts
+ All-to-all
+ Gossip protocol
    + each node will make requests to the configuration service (such as ZooKeeper) to find the other nodes’ IP addresses.
+ External storage or coordination service
    + Hosts can communicate with each other via a leader host. 
+ Random leader selection

## Rate-limiting algorithms
+ Token bucket
    + 令牌桶是想象有一个桶里放满了令牌，每来一个请求就取一个令牌，如果没有令牌可取了就拒绝处理请求，同时也会以一定的速率往桶里加令牌。一般往桶里加令牌的速率就被配置为平均的TPS，桶的容量则为能够接受的最大burst。
+ Leaky bucket
    + 漏桶就是一个FIFO的队列，请求不断地从队尾插入，服务不断地从队首取出请求进行处理，队列的容量就是服务能够承受的流量。
    + 但如果有个请求处理时间较长，那么他后面的请求都会跟着遭殃
+ Fixed window counter
    + 固定窗口法规定了在某个固定的时间范围内的请求量阈值，如果在这个时间范围内的请求量超过阈值，则直接拒绝处理。
    + 固定窗口法的好处就是旧请求不会影响后面的新请求，但缺点也很明显，在窗口刷新的时候可能会放更多请求进来
+ Sliding window log
    + 滑动日志以日志的形式记录每个请求，每条日志包含一个请求的时间戳，如果有新请求，则根据其时间戳和之前的日志，计算TPS，如果TPS超过阈值则，则只加到日志不作处理。
    + 滑动日志法更像是无限容量的漏桶法，解决了固定窗口法的edge case，但需要存储日志，对存储来说有压力，并且每次来请求都要计算一次日志量，计算成本太高。
+ Sliding window counter
    + 滑动窗口根据请求的时间往前找一个时间窗口，查看这个时间窗口的请求量是否超过了阈值，如果没有超过则处理请求，否则拒绝处理该请求。




## ref
+ [Cloud Bouncer - Distributed Rate Limiting at Yahoo](https://yahooeng.tumblr.com/post/111288877956/cloud-bouncer-distributed-rate-limiting-at-yahoo)
+ [如何设计一个分布式限流器（distributed rate limiter）](https://guanhonly.github.io/2020/05/30/distributed-rate-limiter/)
+ [The Fundamentals of Rate Limiting: How it Works and Why You Need it](https://medium.com/@patrikkaura/the-fundamentals-of-rate-limiting-how-it-works-and-why-you-need-it-fd86d39e358d)
+ [系统设计：设计一个分布式限流器](https://jingling.im/posts/design-a-rate-limiter/)