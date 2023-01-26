
# consistent hash
+ 均衡性(Balance)
+ 单调性(Monotonicity)
+ 分散性(Spread)
+ 负载(Load)


## tips
+ 普通hash在分布式存储的弊端
    +  key%N
        + 随着节点的增加或减少，N也会相应的改变，导致之前的数据无效

## ref
+ [16 张图解带你掌握一致性哈希算法](https://developer.huawei.com/consumer/cn/forum/topic/0203810951415790238)
+ [一致性Hash算法详解](https://zhuanlan.zhihu.com/p/98030096)