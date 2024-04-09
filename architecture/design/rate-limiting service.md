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
+ Leaky bucket
+ Fixed window counter
+ Sliding window log
+ Sliding window counter




## ref
+ [Cloud Bouncer - Distributed Rate Limiting at Yahoo](https://yahooeng.tumblr.com/post/111288877956/cloud-bouncer-distributed-rate-limiting-at-yahoo)