# Az虚拟网络

## VNet(Az虚拟网络)

+ 地址空间
+ 子网
+ 区域
    + 局限于一个区域
    + Vnet对等互联
    + VPN
+ 订阅
    + 限定范围

+ NSG
    + VNet下的子网保护VNet

+ Internet
    + VNet中默认可出站通信
    + 入站通信
        + 公共IP
        + SLP

+ VNet服务终结点


## 筛选流量,路由
+ NSG(网络安全组)
    + 配置出入站规则
+ NVA(网络虚拟设备)
    + 有网络功能(防火墙..)的VM
+ 路由表
+ BGP(边界网关协议)
    + Az VPN
    + ExpressRoute

## Az服务加到VNet
+ 服务实例部署到VNet
+ 专用链接
+ 服务终结点

## 不同Vnet互联
+ 虚拟网络对等互联
    + 不走Internet
    + 非传递性
    + 数据库迁移
    + 全局虚拟网络对等互联
        + 可以连接不同区域的网络
    + 当互联不同租户的Vnet时(不同Az AD)
        + peer subscription's administrator
+ VPN网关
    + 一个VNet一个VPN网关
    + 需要公共IP
    + 可以传递
        + 启用BGP
    + 延迟不敏感，不高吞吐量

## Transitivity and Gateway Transit

## 中心辐射架构

+ 中心VNet 配置VPN
+ 其他VNet 通过对等互联连接到中心VNet

## tips
+ Az部署模型
    + 资源管理器
    + 经典部署模型

+ VPN(virtual private network)
    + 通过Internet连接不同VNet
        + encrypted tunnel

## VPN gateway
+ on-premise to Az VNet
    + site-to-site
+ individual device to Az VNet
    + point-to-site
+ Az VNet to Az VNet
    + network-to-network

+ 每个VNet只有一个VPN gateway
    + 一个VPN gateway可以连接多个on-premise datacenters和多个VNet

+ Policy-based VPNs

+ Route-based VPNs

## Site to Site VPN gateway(on-premise to Az)

+ Virtual network
+ GatewaySubnet
+ Public IP address
+ Local network gateway
+ Virtual network gateway
+ Connection
+ HA(fault tolerant)
    + VPN gateway
        + two instances
            + Active/standby
            + Active/active
                + BGP routing protocol support

## ExpressRoute(on premise network to MS global network)

+ Layer 3 connectivity

+ direct access to Ms office 365

+ ExpressRoute Global Reach

+ models
    + CloudExchange co-location
    + Point-to-point Ethernet connection
    + Any-to-any connection

+ peering scheme
    + private peering
        + access Az IaaS,PaaS
    + Microsoft peering
        + access Az PaaS


## Vnet Gateway

+ VPN Gateway
    + per Vnet per VPN gateway
    + 是一种Vnet gateway
    + 用于Vnet与on-premise location 间加密通信
    + VNet-to-VNet
        + VPN gaateway to VPN gateway

    + Site-to-Site
        + VPN gateway to on-premises VPN device
        + VPN device located on-premise
            + public IP

    + Point-to-Site
        + VPN over OpenVPN
        + ex: home to VNet

+ Azure expressRoute
    + 专用连接
    + 不走Internet
    + on-premises network to AZ

+ Vnet gateway
    + 由gateway subnet中的VM组成
    + 每个Vnet可以有两个Vnet gateway:
        + 一个VPN gateway
        + 一个ExpressRoute gateway

+ coexisting ExpressRoute/Site-toSite

## tips

+ BGP (Border Gateway Protocol)
    + exchange routes between on-premise network and resources running in Az

## ref

<!-- VPN -->
+ [What is VPN Gateway?](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways)
+ [VPN Gateway design](https://docs.microsoft.com/en-us/azure/vpn-gateway/design)