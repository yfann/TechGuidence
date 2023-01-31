## Ambassador
+ 访问sharded server
+ twemproxy(nutcracker)
    + lightweight proxy for memcached and redis protocol

## sharding function
+ Shard = ShardingFunction(Req)
    + Shard = hash(Req) % number of sharded server
    + shard(request.path) 
        + shard(country(request.ip), request.path)

+ Determinism 
    + is important because it ensures that a particular request R always goes to the same shard in the service
+ Uniformity 
    + is important because it ensures that load is evenly spread between the different shards.
    
+ Consistent Hashing Functions

## ref
+ [data sharding](https://zhuanlan.zhihu.com/p/57185574)