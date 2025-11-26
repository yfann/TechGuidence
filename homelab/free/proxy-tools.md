

## tips
+ TUN模式
    + 系统 → TUN 虚拟网卡 → Clash 内核
        + 把系统的所有 IP 流量劫持到一个虚拟网卡
    + Clash 内核会根据规则决定：
        + 直连
        + 走节点（任何协议：Shadowsocks、VMess、TROJAN、Hysteria、TUIC、VLESS…）
        + 或者走 HTTP/SOCKS5 外部代理（如果你特别配置）
    + 开 TUN：系统的一切流量都能走代理（游戏、Steam、微信、企业软件、Windows 系统流量等）
        + APP → TUN → Clash → 节点协议（如 SS、Hysteria） → Internet
        + 几乎等同于 VPN 效果（类全局代理）
    + 不开 TUN：只能代理支持“应用层代理”的程序
        + TCP/UDP 不能代理
    + 支持协议（SS/VMess/Trojan/Hysteria）
    
+ SOCKS5
    + 本身是个协议
    + APP → SOCKS5 → Proxy → Internet
    + 转发任意 TCP/UDP 流量，不解析内容
    + 判断是否支持SOCKS5
        + `curl --socks5 127.0.0.1:1080 https://www.google.com -I`

+ Privoxy 或 Polipo 将 HTTP 代理转成 SOCKS5

+ 协议节点
    + 协议节点就是告诉代理内核“这个服务器用什么协议来转发流量”
    + 协议
        + Shadowsocks (SS)
        + SOCKS5
        + HTTP / HTTPS Proxy
            + TUN不支持



## ref
+ [clash](https://clash.download/clash-for-windows)
+ [Proxifier]()
    + 全局代理转发工具
    + 让任何应用程序强制走代理（SOCKS / HTTP / HTTPS）
        + steam
+ [Privoxy]()
    + 将 HTTP 代理转换成 SOCKS5 或其他代理
        + APP（或 TUN）→ SOCKS5（127.0.0.1:1080）→ Privoxy → HTTP 代理 → Internet
    + 让只能用 SOCKS5 的程序访问 HTTP 代理服务器