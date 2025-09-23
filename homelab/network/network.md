

## 内网穿透
+ 让外部访问内网
    + 只暴露内网的部分端口
    + 向外提供某个服务
+ 穿透NAT
+ tools
    + frp
    + ngrok
    + OpenVPN 
## 虚拟网络
+ 所有设备都在一个网络
    + 暴露内网的所有
+ 加密隧道
+ 点对点连接
+ tools
    + Tailscale
    + ZeroTier
    + Nebula

## DDNS（Dynamic Domain Name System，动态域名系统)
+ 让域名能够动态指向变化的 IP 地址的服务

## TCP Hole Punching
+ 让两个都在 NAT（网络地址转换）后面的设备直接建立 TCP 连接的技术
    + 大多数家庭和公司网络都使用路由器做 NAT，把多个内网 IP 共享一个公网 IP。
    + NAT 默认只允许内网先发起连接，不允许外网直接主动访问内网设备。
+ 核心思路
    + 利用第三方服务器做“介绍人”（信令服务器）。
    + 让两端几乎同时发起 TCP 连接到对方的公网地址，从而“骗过” NAT，使其建立对应的转发表。
+ 步骤
    + 注册阶段
        + A 和 B 都先和中间服务器（S）建立 TCP 连接，告诉 S 自己的“公网 IP + NAT 分配的端口”。
    + 信息交换
        + S 把 A 的公网地址告诉 B，把 B 的公网地址告诉 A。
    + 打洞
        + A 和 B 几乎同时向对方的“公网 IP + 端口”发起 TCP 连接。
        + 因为 NAT 看到这是“已有外向连接”，会允许数据包从外部回来，于是打通。   
    + 直连通信
        + 打洞成功后，A 与 B 就不再依赖中间服务器，可以直接 TCP 传输数据。
## NAT（Network Address Translation，网络地址转换）
+ 把一个网络的 IP 地址转换成另一个网络 IP 地址的技术
+ 让局域网（LAN）里的多台设备共享一个公网 IP 上网

## 外网访问家庭网络
+ 内网穿透
    + frp
    + ZeroTier
    + Ngrok
+ DDNS
+ 家庭有公网IP
    + 端口映射(NAT)
+ 群晖quick connect
+ VPN
    + 口转发或UPnP的方式，VPN通过家庭网络的路由器进行配置
    + 公网IP
    + 第三方服务器,VPS
    + tools
        + Tailscale
        + wireguard


## tips
+ CGNAT（运营商级 NAT）+ 内网地址(WAN口地址)
    + 运营商没有分配公网ip
    + 判断有没有公网IP
        + 比较路由器WAN口IP和外部显示的公网IP是否一致

## ref
+ [EasyTier)](https://github.com/EasyTier/EasyTier)
+ zerotier