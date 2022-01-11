
# netstat

+ 查看linux端口占用

## cmd
+ `netstat -ap TCP`

+ `netstat -tunlp` 列出tcp,udp端口
    + `netstat -tunlp| grep <port>`

## tips

+ `-t` tcp
+ `-u` udp
+ `-n` 不显示别名
+ `-l` 列出listen的服务状态
+ `-p` 显示相关程序名

## ref
+ [Linux 查看端口占用情况](https://www.runoob.com/w3cnote/linux-check-port-usage.html)
