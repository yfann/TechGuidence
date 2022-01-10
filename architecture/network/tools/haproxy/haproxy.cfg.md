# haproxy.cfg

+ `vi /etc/haproxy/haproxy.cfg`

+ 参数来源
    + 命令行
    + `global` in haproxy.cfg
    + `defaults`,`frontend`,`backend`,`listen`



## global

+ maxconn
    + 系统的`ulimit -n`参数大于[maxconn*2+18]


## defaults

+ `balance`
    + roundrobin
    + leastconn
    + source
        + This is one method to ensure that a user will connect to the same server
        + hash of the source IP

+ option


## backend

+ `check` add health check

## Frontend

+ A frontend defines how requests should be forwarded to backends
+ ACL

## ref

+ [HAProxy用法详解 全网最详细中文文档](http://www.ttlsa.com/linux/haproxy-study-tutorial/)