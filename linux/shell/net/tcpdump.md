# tcpdump

+ 网络抓包

## cmd

+ `tcpdump -i eth0 -nn -s0 -v port 80`
    + -i
        + 指定网络接口
    + -nn
        + `n`:不解析域名
        + `nn`:不解析域名和端口
    + -s0
        + 截取前96字节内容
        + `-s number`
            + `-s 0` 截取所有报文
    + -v
        + 详细显示
        + `-vv` `-vvv`
    + port 80
        + 端口过滤器

## ref

+ [超详细的网络抓包神器 tcpdump 使用指南](https://juejin.cn/post/6844904084168769549)