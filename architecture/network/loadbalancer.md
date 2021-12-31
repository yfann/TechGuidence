




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

+ Varnish
    + caching reverse-proxy

+ SNMP(Simple Network Management Protocol)

## ref

+ [What Is Layer 4 Load Balancing](https://www.nginx.com/resources/glossary/layer-4-load-balancing/)