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
    + remotePort
        + frps会监听对应remotePort
        + frps通过remotePort区分不同frpc
            + 把流量转发到frpc


+ http/https
    + customDomains
        + 通过customDomains访问frps
            + 需要配置服务端DNS
                + customDomains->frps ip
        + Frps需要监听
            + vhost_http_port（80）
            + vhost_https_port（443）
                + frps 会自动生成一个临时证书
                + 或者自己指定证书
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
        + 处理证书
            + frps知道域名，可以进行TLS握手
            + 证书在Frps端
            + TLS 终止（TLS Termination）
        + 后续转发给 FRPC 时，可以用明文 HTTP。
    + remotePort
        + FRPS 只能把流量原封不动转发给 FRPC
        + 不知道域名不能做TLS握手
            + 握手发生在frpc端
            + 证书也在frpc端

+ tcpmux
    + 一个端口复用多个TCP服务
    + frps只能定义一个`tcpmuxHTTPConnectPort = 5002`

+ tcp vs https
    + tcp
        + 协议无感知：FRP 完全当作 TCP 流量转发
            + https流量也可以使用，不处理 HTTPS/TLS 协议,转发
            + tcp流量使用，转发
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

## tips
+ https + customDomains 时是 FRPS 来处理证书
    + 发生TLS终止
        + 浏览器->frps  https（加密）
        + FRPS → FRPC   http 明文

+ https + remotePort 时由 FRPC（本地服务）来处理证书
    + frps不知道域名无法握手,frpc端进行握手
    + 浏览器 → FRPS → FRPC → 内网服务 https(加密)


+ tcp + remotePort  VS https + remotePort
    + tcp + remotePort
        + 纯tcp,不进行语义识别
        + 支持纯tcp协议的转发
    + https + remotePort
        + 标记为 HTTPS，语义化
        + 明确表示是https

+ TLS 终止（TLS Termination）
    + 在中间节点（比如 Nginx、FRPS、负载均衡器）接收并解密加密流量，然后把 解密后的明文流量 转发给后端服务
        + 换句话说，TLS 握手和解密的“终点”不是你的后端服务，而是这个中间代理。

+ FRP 隧道
    + frps<->frpc
        + 控制通道（control connection）
            + frpc 连接到 frps 时会先建立一条长连接。
            + 长连接(TCP 或 KCP/QUIC)
            + 作用
                + 身份验证、心跳、代理元信息传递（比如“我有一个 HTTPS 服务要代理”）。
        + 工作通道（work connection / proxy connection）
            + 当有实际请求到达 frps 时，frps 会通过控制通道通知 frpc 建立一条工作通道。
            + 这条工作通道也是基于 TCP/KCP/QUIC/WebSocket/WebRTC（取决于配置）。
            + 用来传输真正的数据流量（HTTP、HTTPS、SSH 等）。
    + 加密方式
        + 默认是明文tcp
        + 如果启用了 tls_enable = true
            + 控制通道和工作通道都走 TLS 加密
        + token
            + 做简单的身份校验，但这只是认证，不是加密。
    + 场景
        + 如果是 HTTPS/SSH，即使 FRP 隧道不开 TLS，用户流量本身也依然是加密的（因为 HTTPS/SSH 自带加密层）。
        + 如果是 HTTP 这种明文协议，而隧道也没开 tls_enable，那流量就是明文透传。

+ vhost
    + 所有服务共享一个端口（80/443），通过域名来区分。
        + vhost_http_port = 80
        + vhost_https_port = 443
    + 这种“一端口多域名”的机制就叫 虚拟主机 (Virtual Host)。
    + 传统的 Web 服务器（Nginx / Apache）中,多个不同的域名可以共享同一个监听端口（80 / 443）
        + 服务器根据 HTTP Host 头 或 TLS SNI 来分流请求，找到对应的虚拟主机配置

+ SNI（Server Name Indication）
    + 
## ref
+ [frp](https://gofrp.org/zh-cn/docs/overview/)
+ [github frp](https://github.com/fatedier/frp)
+ [frp download](https://github.com/fatedier/frp/releases)
+ [frpc-cli](https://github.com/openapphub/frpc-cli)