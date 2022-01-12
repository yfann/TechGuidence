# haproxy.cfg

+ `vi /etc/haproxy/haproxy.cfg`

+ parameters
    + comand-line
    + `global` in haproxy.cfg
    + `defaults`,`frontend`,`backend`,`listen`

## global

+ Parameters in the "global" section are process-wide and often OS-specific.
+ maxconn
    + 系统的`ulimit -n`参数大于[maxconn*2+18]


## defaults
+ A "defaults" section resets all settings to the documented ones and presets new
ones for use by subsequent sections.

+ `balance`
    + roundrobin
    + leastconn
    + source
        + This is one method to ensure that a user will connect to the same server
        + hash of the source IP
        
+ `mod http`
    + default 加了`mod http`,则需要frontend和backend都添加`mod tcp`才能覆盖默认值

+ option
    + option tcplog


## Frontend
+ A "frontend" section describes a set of listening sockets accepting client
connections.
+ A frontend defines how requests should be forwarded to backends
+ ACL
+ `http-request`/`http-response`
    + 可以拒绝，要求认证，添加header,替换header,ACL
+ `log global`
    + 沿用global log
+ `option http-keep-alive·` 以KeepAlive模式提供服务
+ `option httpclose`
    + 与http-keep-alive对应，关闭KeepAlive模式，如果HAProxy主要提供的是接口类型的服务，可以考虑采httpclose模式，以节省连接数资源。但如果这样做了，接口的调用端将不能使用HTTP连接池
+ `tcp-request`


## backend
+ A "backend" section describes a set of servers to which the proxy will connect
to forward incoming connections.
+ `server webserver3 192.168.1.202:80 check disabled`
    + `check` add health check
        + `option httpchk` 定义检查方法
    + `disabled`
    + `weight` 权重，默认1
    



## listen
+ A "listen" section defines a complete proxy with its frontend and backend
parts combined in one section. It is generally useful for TCP-only traffic.


## ACL
+ acl image_url path_beg -i /images/
    + `-i` case-insensitive

+ acl对应的`path`,必须在目标server中也可以访问


## ref

+ [HAProxy用法详解 全网最详细中文文档](http://www.ttlsa.com/linux/haproxy-study-tutorial/)
+ [haproxy 1.5 config](http://www.haproxy.org/download/1.5/doc/configuration.txt)
<!-- acl -->
+ [Introduction to HAProxy ACLs](https://www.haproxy.com/blog/introduction-to-haproxy-acls/)
+ [Haproxy-1.8.20 根据路径(URI)转发到后端不同集群](https://www.bbsmax.com/A/Vx5MDKWvJN/)
