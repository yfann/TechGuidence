# linux namespace

+ uts_ns
    + Unix Timesharing System,底层体系结构
+ ipc_ns
    + 进程间通信IPC
+ mnt_ns
+ pid_ns
    + 进程ID
+ user_ns
    + 资源配额
+ net_ns

## cmd
+ `ip netns help`
+ `ip netns list`
+ `ip netns add <ns name>`
+ `ip link set <virtual dev> netns <ns name>`
+ `ip netns exec <ns name> ip link list`
    + namespace中查看设备
## tips
+ namespace提供了独立的网络协议栈(network interface, IPv4,IP router, firewall, sockets)
+ 一个Linux Device只能在一个ns中
+ 不同ns可以用veth pair桥接