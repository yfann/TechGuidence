## Nginx

+ HTTP服务器
+ 反向代理服务器(loadbalancer)

## Linux Virtual Servers (LVS/IPVS)
+ L4 load balancer

## HAProxy
+ L4/L7 load balancer


## tips

+ L7 load balancing
    + 可以根据 url,data type路由
    + HTTP reverse-proxy(gateway)

+ L4 load balancing
    + 根据 IP and ports 路由
        + 不用考虑packet content
    + NAT
    + 适用于基于套接字的服务(数据库，消息队列，RPC,邮件服务,Redis)

+ Varnish
    + caching reverse-proxy

+ SNMP(Simple Network Management Protocol)
+ DSR
    + direct server return, without passing through the LB again

+ Packet-based load balancers
    + NAT
        + the load balancer may also replace the packets' source address with its own in order to force the return traffic to pass through it

+ Proxy-based load balancers
    + as a server
    + clients are properly directed to the load balancer's IP address and not directly to the server's
        +  HTTP redirects

+ XFF(X-Forwarded-For)
    + server端可以获取client IP

<!-- tools -->
+ squid

## ref

+ [What Is Layer 4 Load Balancing](https://www.nginx.com/resources/glossary/layer-4-load-balancing/)

+ [HTTP X-Forwarded-For(XFF) 介绍](https://www.runoob.com/w3cnote/http-x-forwarded-for.html)
+ [谈谈一个重要的http协议头标：X-Forwarded-For](https://codeantenna.com/a/gMYGBr5noF)
+ [HAProxy,lvs,nginx](https://www.cnblogs.com/kevingrace/p/5892169.html)

+ [一文详解负载均衡和反向代理的真实区别](https://mp.weixin.qq.com/s/TYM83F2O-keMvn4ZYa5nqw)