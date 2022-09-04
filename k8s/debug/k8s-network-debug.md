## issues

+ 网络ping不通
    + iptables,selinux限制
    + 路由配置不正确
    + 网络负载高，网络连接满，网卡队列满

+ 端口不通(ping通，telnet端口不通)
    + 防火墙限制
    + 负载高，网络连接满，网卡队列满，端口耗尽
    + 监听端口的服务没启动

+ DNS(域名无法解析)
    + Pod的DNS不正确
    + DNS服务异常

+ 大数据包丢失
    + `ping -s` 指定数据包大小测试
    + 数据包的大小超过了 docker、CNI 插件、或者宿主机网卡的 MTU 值

+ CNI异常(Node通，Pod无法访问集群)
    + kube-proxy服务异常,没有生成iptables or ipvs规则
    + CIDR耗尽

## debug

+ tcpdump
+ wireshark
+ nsenter
    + 可以进入process namespace

## ref
+ [Kubernetes 网络排错骨灰级中文指南](https://zhuanlan.zhihu.com/p/560558448)