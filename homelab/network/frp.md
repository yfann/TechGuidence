# frp
+ 内网穿透，反向代理
+ 公网 IP 的节点上部署 frp 服务端，可以轻松地将内网服务穿透到公网
+ 支持 P2P 通信，流量不经过服务器中转，充分利用带宽资源。


## 代理
+ 一个代理对应一个需要公开访问的内网服务

## frpc
+ 可以同时配置多个代理


## frps
+ 服务端部署在具有公网 IP 地址的机器上


## proxy
+ tcp/udp
    + 需要配remotePort
        + frps会监听对应remotePort
        + frps通过remotePort区分不同frpc
            + 把流量转发到frpc


+ http/https
    + 可以用customDomains
        + 需要配置服务端DNS
            + customDomains->frps ip
        + Frps需要监听vhost_https_port（443），并处理证书
            ```toml
            [web]
            # FRPS 外部访问 HTTPS 的端口
            vhost_https_port = 443

            # TLS 证书和私钥（frps 负责终止 HTTPS）
            # 如果你想 frpc 直接处理证书，可以用 type = tcp 穿透 443
            tlsCertFile = "/etc/frp/fullchain.pem"
            tlsKeyFile = "/etc/frp/privkey.pem"
            ```
        + FRPS 会根据访问请求的 Host 头（域名）自动找到对应的 FRPC
    + 可以用remotePort
        + 


+ tcp vs https
    + tcp
        + 协议无感知：FRP 完全当作 TCP 流量转发，不处理 HTTPS/TLS 协议。
        + 外网访问 https://FRPS_IP:8444 也行，但 FRPS 不会理解 TLS，只是把流量原封不动转发到本地 8443。
        + 使用场景
            + 内网服务自带 TLS 证书，FRPC 自己处理 HTTPS。
            + 想暴露 非 HTTP/HTTPS TCP 服务（数据库、SSH、其他加密协议）时使用。
    ```toml
    [[proxies]]
    name = "site2"
    type = "tcp"
    localIP = "127.0.0.1"
    localPort = 8443
    remotePort = 8444
    ```
    + https
        + 协议感知：FRP 知道这是 HTTPS 流量，会尝试做 TLS 终止 或 虚拟主机路由（取决于是否用 customDomains）。
            + TLS 终止（TLS Termination）
                + 在中间节点（比如 Nginx、FRPS、负载均衡器）接收并解密加密流量，然后把 解密后的明文流量 转发给后端服务
                    + 换句话说，TLS 握手和解密的“终点”不是你的后端服务，而是这个中间代理。
    ```toml
    [[proxies]]
    name = "site2"
    type = "https"
    localIP = "127.0.0.1"
    localPort = 8443
    remotePort = 8444
    ```
    + 443 穿透给内网服务
        + frps只做流量转发(包括TLS握手数据)
        + frpc 把流量转发到内网 127.0.0.1:443
            + TLS 握手、证书校验、加解密全部由内网服务完成
    ```toml
    [[proxies]]
    name = "https-tcp"
    type = "tcp"
    localIP = "127.0.0.1"
    localPort = 443
    remotePort = 443
    ```

    
## frp支持的模式
+ 基于域名（virtual host）：使用 customDomains，FRPS 根据 Host 头 自动路由。
    + 典型配置：FRPS 监听 vhost_http_port / vhost_https_port（通常是 80 / 443）。
    + 此时不需要 remotePort。

+ 基于端口：可以指定 remotePort，让某个 HTTP/HTTPS 服务在 FRPS 的指定端口暴露。
    + 此时 不依赖域名，直接用 IP:port 访问。


## ref
+ [frp](https://gofrp.org/zh-cn/docs/overview/)
+ [github frp](https://github.com/fatedier/frp)
+ [frp download](https://github.com/fatedier/frp/releases)