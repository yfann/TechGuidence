
# netstat

+ 查看linux端口占用
    + `netstat -anp | grep 27017`

## cmd
+ `netstat -at`

+ `netstat -tunlp` 列出tcp,udp端口
    + `-a` 列出所有监听非监听
    + `-t` tcp
    + `-u` udp
    + `-n` 不显示别名
    + `-l` 列出listen的服务状态
    + `-p` 显示相关程序名

## tips

+ 每一行是个socket

## ref
+ [Linux 查看端口占用情况](https://www.runoob.com/w3cnote/linux-check-port-usage.html)
+ [不可不知的网络命令-netstat](https://zhuanlan.zhihu.com/p/69862354)

+ [5.9. The netstat Command](https://tldp.org/LDP/nag2/x-087-2-iface.netstat.html)
