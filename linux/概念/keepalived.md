# keepalived

+ vip会写入master的 eth0网卡中
+ 最初为ipvs提供高可用

## issues

+ 默认为组播模式，地址：224.0.0.18
    + 阿里云ECS不支持组播，要改成单播

+ 单播
    + unicast_src_ip
    + unicast_peer 

## ref
+ [keepalived]( http://www.keepalived.org/)
+ [Keepalived简介](https://www.huweihuang.com/linux-notes/keepalived/keepalived-introduction.html)
+ [keepalived doc](https://www.keepalived.org/manpage.html)
+ [Keepalived 原理介绍和配置实践](https://wsgzao.github.io/post/keepalived/)
+ [Linux高可用之Keepalived](https://www.jianshu.com/p/b050d8861fc1)

+ [高可用软件 Keepalived 的原理与实践](https://kefeng.wang/2018/05/18/keepalived/)

<!-- practice -->
+ [keepalived 单播模式](https://blog.51cto.com/u_11886307/2406618)
+ [keepalived绑定单播地址、非抢占模式及LVS的TCP模式的高可用](https://www.cnblogs.com/struggle-1216/p/12098241.html)
+ [keepalived 组播的配置](https://blog.csdn.net/weixin_34080951/article/details/93011759)