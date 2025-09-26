# iptables
+ 不是一个网络设备
+ 可以实现防火墙，NAT
+ iptables
    + 运行在用户空间的命令行工具
    + 只是记录规则，由netfilter执行
    + tables/chain/policy
        + filter
            + 防火墙
        + nat
            + NAT
        + mangle
            + 流量整形
+ netfilter
    + 运行在内核空间
    + IP层hook


## cmd
+ `iptables -A INPUT -i eth0 -p icmp -j ACCEPT`
    + 接收eth0进入的ICMP协议的报文


## tips
+ policy
    + rules