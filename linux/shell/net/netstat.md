
# netstat

+ 查看linux端口占用
    + `netstat -ap | grep 27017`

## cmd
+ `netstat -at`

+ `netstat -tunlp` 列出tcp,udp端口

## tips

+ `-a` 列出所有监听非监听
+ `-t` tcp
+ `-u` udp
+ `-n` 不显示别名
+ `-l` 列出listen的服务状态
+ `-p` 显示相关程序名

## ref
+ [Linux 查看端口占用情况](https://www.runoob.com/w3cnote/linux-check-port-usage.html)
+ [不可不知的网络命令-netstat](https://zhuanlan.zhihu.com/p/69862354)
