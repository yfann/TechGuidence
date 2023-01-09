
# Kubernetes Gateway API
+ k8s ingress API演化来

+ gatewayclass
+ gateway
+ Route 
    + 和service在同一namespace
    + 绑定到gateway
    + referenceGrant
        + 路由跨namespace引用service

## Envoy Gateway
+ 遵循Gateway API

## tips
+ gateway(南北流量)
    + ingress
        + 只支持http路由
    + Gateway API
        + 支持http,tcp,udp,grpc,tls路由

+ SMI(service mesh interface)东西流量
    + istio
        + 支持
            + ingress
            + gateway api
        + VirtualService
            + 路由
            + 错误注入
            + 超时、重试
        + DestinationRule
            + 负载均衡
            + 熔断
    + Gateway API和SM中有重叠的部分

+ GAMMA(Gateway API Mesh Management and Administration)
    + 高级流量管理功能(超时，重试，健康检查等)
        + 通过Policy Attachment由各个供应商实现
    + Gateway API在探索处理网格流量

+ k8s service
    + 反向代理+LB

+ lb
    + 通过nodeport连到service
    + 集群外部，对node均衡请求

+ ingress controller
    + 对service均衡请求

## ref
+ [Kubernetes Gateway API](https://gateway-api.sigs.k8s.io/)


+ [Gateway API：Kubernetes 和服务网格入口中网关的未来](https://mp.weixin.qq.com/s/XLaM9mMne0JsR1BDYfFa5g)
+ [SMI 与 Gateway API 的 GAMMA 倡议意味着什么？](https://mp.weixin.qq.com/s?__biz=MjM5OTg2MTM0MQ==&mid=2247485551&idx=1&sn=292b2b53064c566eb31c7f88ebb41a6a&chksm=a734455d9043cc4b00ce14c694dcbef348ddb4a8027b1cf57b4af53e961c643f1fc4b67b967c&scene=21#wechat_redirect)
+ [一文搞懂 Kubernetes Gateway API 的 Policy Attachment](https://zhuanlan.zhihu.com/p/578936720)

<!-- ingress nginx -->
+ [F5 NGINX Kubernetes Gateway](https://www.zhihu.com/question/54852255/answer/2802517652)
+ [Kubernetes 网络入门](https://www.nginx-cn.net/blog/kubernetes-networking-101/)
+ [API 网关 vs. Ingress Controller vs. Service Mesh，该怎么选？](https://www.nginx-cn.net/blog/how-do-i-choose-api-gateway-vs-ingress-controller-vs-service-mesh/)