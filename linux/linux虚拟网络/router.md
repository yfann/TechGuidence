# linux router

+ linux没有对应的虚拟router,它本身就是router

## cmd
<!-- 开启router -->
<!-- option1 -->
+ `echo "1" > /proc/sys/net/ipv4/ip_forward`
+ `less /proc/sys/net/ipv4/ip_forward`
<!-- option2 -->
+ `/etc/sysctl.conf`
    + net.ipv4.ip_forward = 0
    + linux重启也会有效

<!-- 查看路由信息 -->
+ `route -nee`

<!-- 添加静态路由 -->
+ `ip netns exec ns1 route add -net 192.168.200.0 netmask 255.255.255.0 gw 192.168.100.1`
    + 192.168.200.0 对方网段
    + 192.168.100.1 自己ns中的veth一端