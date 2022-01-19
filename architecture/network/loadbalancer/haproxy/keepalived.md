# keepalived

## tips

+ VRRP(Virtual Router Redundancy Protocol)
+ master + backup
+ 类似于L3,L4,L7交换机，自动剔除故障服务器，故障恢复后自动加入

## 选举策略

+ 每个节点有个priority
    + master比backup高

+ 脚本检查后，priority +/- weight,重新比较priority,如果backup比masterpriority高，则发生切换

## ref

<!-- haproxy keepalived -->
+ [搭建高可用负载均衡器: haproxy+keepalived](https://developer.aliyun.com/article/609851)
+ [HAPROXY](https://www.haproxy.org/download/1.2/doc/architecture.txt)