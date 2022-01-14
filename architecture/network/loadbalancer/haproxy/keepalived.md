
## tips


+ VRRP(Virtual Router Redundancy Protocol)

+ master + backup

## 选举策略

+ 每个节点有个priority
    + master比backup高

+ 脚本检查后，priority +/- weight,重新比较priority,如果backup比masterpriority高，则发生切换

## ref
+ [keepalived]( http://www.keepalived.org/)
+ [Keepalived简介](https://www.huweihuang.com/linux-notes/keepalived/keepalived-introduction.html)
<!-- haproxy keepalived -->
+ [搭建高可用负载均衡器: haproxy+keepalived](https://developer.aliyun.com/article/609851)
+ [HAPROXY](https://www.haproxy.org/download/1.2/doc/architecture.txt)