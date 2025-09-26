# Linux Namespace

+ 在不同的PID Namespace下，可以有不同PID为1的进程
+ 不同Namespace间不会相互发现

## Namespace类型
+ Mount - isolate filesystem mount points
+ UTS - isolate hostname and domainname
+ IPC - isolate interprocess communication (IPC) resources
    + 进程间通信
        + 管道
        + 共享内存
        + 信号量
        + 消息队列
+ PID - isolate the PID number space
+ Network - isolate network interfaces
+ User - isolate UID/GID number spaces

## PID
+ init进程(PID:1)
+ 第一个启动的进程
+ 整个操作系统范围内的父进程
    + 进程树
    + 有特殊权限
        + 对孤儿进程回收

## CNM(Container Network Model)
+ NetworkSandbox
    + docker中实现linux Network Namespace
+ Endpoint
    + docker中实现VETH
+ Network
    + docker中实现Linux Bridge

## Linux Bridge
+ Linux Bridge 是 Linux 提供的一种虚拟网络设备，它可以实现多个不同容器在一个以太网内进行通信
+ 默认工作在二层网络
    + 分配IP则开启三层
+ bridge不同会产生网络隔离
+ `ip addr`
    + 在安装docker的主机上可以看到`docker0`的bridge
        + container都会连接到docker0的bridge上实现container间的网络通信

## VETH
+ Linux的一种网络设备
+ 类似操作系统的Pipe
    + 一头进一头出
+ VETH成对出现
    + 一端输入(eth0)
        + contianer端
    + 一端输出(eth1,eth2...)
        + bridge端
+ 可以被分配IP
    + 参与三层网络

## ref
+ [Linux 环境隔离机制 -- Linux Namespace](https://zhuanlan.zhihu.com/p/47571649)