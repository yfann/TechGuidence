# docker network

+ linux veth pair


## 单主机模式

+ host 模式
    + container和host共享network namespace

+ container 模式
    + 容器间共享network namespace
    + 例如pod

+ none 模式
    + container有独立的network namespace,没有任何网络设置如分配veth,网桥连接

+ bridge 模式
    + host上创建一个名为docker0的虚拟网桥
    + 此主机上启动的Docker container会连接到这个虚拟网桥上
    + 虚拟网桥的工作方式和物理交换机(switch)类似
    + docker0的IP地址为容器的默认网关
    + 主机上创建一对虚拟网卡veth pair设备
        + Docker将veth pair设备的一端放在新创建的容器中，并命名为eth0（容器的网卡）
        + 另一端放在主机中，以vethxxx这样类似的名字命名，并将这个网络设备加入到docker0网桥中
            + `brctl show`

## 多主机网络模式
+ overlay
+ macvlan
+ flannel

## tips
+ sandbox 是namespace的一种实现
+ endpoint 连接sandbox和network

## ref
+ [docker 网络四种实现](https://zhuanlan.zhihu.com/p/378379821)
+ [Docker的网络概念与网络模式](https://zhuanlan.zhihu.com/p/82735394)

+ [手撕Docker网络（1） —— 从0搭建Linux虚拟网络](https://zhuanlan.zhihu.com/p/199298498)
+ [手撕Docker网络（2） —— bridge模式拆解实例分析](https://zhuanlan.zhihu.com/p/206512720)