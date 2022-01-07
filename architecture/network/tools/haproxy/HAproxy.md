# HAProxy

## cmd

 + `haproxy reload`
    + take new configuration

+ `haproxy -c`
    + verify configuration

## haproxy.cfg

+ `vi /etc/haproxy/haproxy.cfg`

## tips

+ proxy vs router

+ hard stop
    + stop,restart
    + `-st`

+ graceful stop
    + reload
    + `-sf`

+ 系统的`ulimit -n`参数大于[maxconn*2+18]

## debug

+ `haproxy -vv`
+ `netstat -ltnp`
+ `show pools` memory check

## ref

+ [HAProxy](http://cbonte.github.io/haproxy-dconv/2.5/intro.html)
+ [An Introduction to HAProxy and Load Balancing Concepts](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)

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
+ [一个简单的例子，带你理解haproxy！](https://blog.csdn.net/qq_34208467/article/details/84032105)