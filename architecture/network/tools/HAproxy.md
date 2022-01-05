# HAProxy

## cmd

 + `haproxy reload`
    + take new configuration

+ `haproxy -c`
    + verify configuration

## haproxy.cfg

+ `/etc/haproxy/haproxy.cfg`

## tips

+ proxy vs router

+ hard stop
    + stop,restart
    + `-st`

+ graceful stop
    + reload
    + `-sf`

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

<!-- config -->
+ [haproxy.cfg 1.5](http://www.haproxy.org/download/1.5/doc/configuration.txt)

<!-- samples -->
+ []()


<!-- distribute -->
+ [haproxy image](https://hub.docker.com/_/haproxy)
+ [haproxy rpm](https://software.opensuse.org/package/haproxy)