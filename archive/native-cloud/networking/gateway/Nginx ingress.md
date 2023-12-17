# Nginx Ingress

## tips
+ k8s service 
    + 解决服务发现
    + 负载均衡
    + 没有服务治理能力，无法作为网关

+ nginx ingress controller
    + manager
        + 监听ingress资源变更
        + 将ingress resource的spec转成Nginx可识别参数，生成nginx.conf
        + reload nginx
    + nginx

+ 可通过annotation插入规则


## 不足
+ 数据面，控制面未分离
    + 配置独占资源，因为会承载大量流量
+ 跟新路由时，应用的长连接会断开

## ref
+ [从 Nginx Ingress 窥探云原生网关选型](https://zhuanlan.zhihu.com/p/597105960)