
## tips
+ Promtail 转发磁盘上的日志到 Loki
    + promtail -> distributor(分发给ingester)->ingester(每个日志流对应一个ingester,构建chunck，达到一定数量时，刷新到存储)
        + 复制3次为了冗余和弹性
        + gzip压缩
    + querier可以查询
        + ingester
        + index
        + chunks

## ref
+ [Grafana Loki 简明教程](https://www.qikqiak.com/post/grafana-loki-usage/)
+ [日志系统新贵 Loki，是真的香！！！](https://zhuanlan.zhihu.com/p/157904056)