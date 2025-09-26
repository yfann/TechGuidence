# linux virtual network

## 组网
+ 创建不同ns    
    + `ip netns add ns1`
+ ns中创建tap, veth pair
    + `ip link add tap1 type veth peer name tap1_peer`
+ tap移入对应的ns中
    + `ip link set tap1 netns ns1`
+ 配置tap ip
    + `ip addr add local 192.168.100.1/24 dev tap1_peer`
    + `ip netns exec ns1 ip addr add local 192.168.100.2/24 dev tap1`
+ up
    + `ip link set tap1_peer up`
    + `ip netns exec ns1 ip link set tap1 up`

<!-- 用router互连ns -->
+ ns双方都添加对方网段
    + `ip netns exec ns1 route add -net 192.168.200.0 netmask 255.255.255.0 gw 192.168.100.1`
    + `ip netns exec ns2 route add -net 192.168.100.0 netmask 255.255.255.0 gw 192.168.200.1`
+ 查看router配置
    + `ip netns exec ns1 route -nee`
+ 测试互通
    + `ip netns exec ns1 ping 192.168.200.2`

<!-- 用bridge连接ns -->


## ref
+ [linux虚拟网络](http://images.china-pub.com/ebook7065001-7070000/7067181/ch02.pdf)