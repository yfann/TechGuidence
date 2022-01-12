# HAProxy

## cmd

+ `service haproxy start`
+ `service haproxy stop`
+ `service haproxy restart`

+ `haproxy reload`
    + take new configuration

+ `haproxy -c`
    + verify configuration



## tips

+ proxy vs router

+ hard stop
    + stop,restart
    + `-st`

+ graceful stop
    + reload
    + `-sf`

+ Sticky Sessions

+ Health Check

+ HA

+ LVS
    + IPVS

+ 透明代理

## debug

+ `haproxy -vv`
+ `netstat -ltnp`
+ `show pools` memory check

## ref

+ [Layer 4 Load Balancing](https://www.haproxy.com/documentation/hapee/latest/high-availability/active-active/l4-load-balancing/)
+ [HAProxy](http://cbonte.github.io/haproxy-dconv/2.5/intro.html)


<!-- debug tools -->
+ [Socat 入门教程](https://www.hi-linux.com/posts/61543.html)
+ halog(built-in)
+ [tcpdump ](https://www.tcpdump.org/)
+ [strace](https://man7.org/linux/man-pages/man1/strace.1.html)

<!-- docs -->
+ [haproxy.cfg 1.5](http://www.haproxy.org/download/1.5/doc/configuration.txt)
+ [HAProxy Architecture](https://www.haproxy.org/download/1.2/doc/architecture.txt)
+ [HAProxy samples](http://www.haproxy.org/download/1.3/examples/antidos.cfg)


<!-- install -->
+ [haproxy image](https://hub.docker.com/_/haproxy)
+ [haproxy rpm](https://software.opensuse.org/package/haproxy)


<!-- sample -->
+ [从零开始掌握 HAProxy](https://segmentfault.com/a/1190000039713086)
    + HAproxy服务
+ [一个简单的例子，带你理解haproxy！](https://blog.csdn.net/qq_34208467/article/details/84032105)