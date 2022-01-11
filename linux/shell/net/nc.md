# nc(netcat/ncat)

+ 测试TCP/UDP 

+ nc(netcat)/ncat
    + ncat为nmap下的一个组件

## install

+ `yum update -y`
+ `yum install -y nc`


## cmd

+ `nc -vz 127.0.0.1 9002` 测试tcp端口
    + `nc -v 127.0.0.1 9002` 保持连接，可以持续发送内容

+ `nc -uvz <ip> <port>` 测试upd端口

+ `nc -zvn 127.0.0.1 21-25`?? 扫描范围内的开放端口

<!-- server -->
+ `nc -lk <port>` 监听端口，充当server
    + -k keep listening
    + `nc <ip> <port>` 连接server

<!-- 文件传输 -->
+ `nc -l 1567 < file.txt`
    + `nc -n 172.31.100.7 1567 > file.txt`
+ `nc -l 1567 > file.txt`
    + `nc 172.31.100.23 1567 < file.txt`
+ `tar -cvf – dir_name | nc -l 1567`
    + `nc -n 172.31.100.7 1567 | tar -xvf -`
+ `tar -cvf – dir_name| bzip2 -z | nc -l 1567`
    + `nc -n 172.31.100.7 1567 | bzip2 -d |tar -xvf -`
<!-- 远程shell -->
+ `nc -l 1567 -e /bin/bash -i`

## tips

+ -l
    + 监听模式，nc作为server

+ -p
    + source port

+ -s
    + 指定发送数据的source IP

+ -u
    + UDP,默认TCP

+ -v
    + 输出交互信息，方便调试

+ -w
    + 超时数

+ `-z`
    + zero IO,成功连接后立即关闭连接,不进行数据交互

+ -n
    + nodns,不使用DNS反向查IP的域名

## ref

+ [nc 命令使用小结](https://wsgzao.github.io/post/nc/)
+ [nc 命令详解](https://www.jianshu.com/p/32c8f9ea0ed9)
<!-- issues -->
+ [ nc无法连接 Ncat: Connection refused.](https://blog.csdn.net/Jahnsonxi/article/details/95910690)
