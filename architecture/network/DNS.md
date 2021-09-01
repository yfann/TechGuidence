

## debug
+ `dig math.stackexchange.com`

+ `dig @4.2.2.2 math.stackexchange.com`
    + 向DNS服务器4.2.2.2查询 
+ nslookup

## tips
+ A记录(A record)
    + Adress
    + 记录主机名(域名)对应的ip地址
    + IP一般不固定

+ CNAME（别名记录）
    + 多个别名可以映射到同一个主机名
    + 域名对域名的映射
    + 背后也需要一个A记录，可以方便的修改一个IP使多个主机生效(不用一个一个改)

+ NS记录
    + 记录了域名服务器
    + 域名服务器保存了A记录,CNAME等

+ SRV记录
    + 主机提供了哪些服务

+ DHCP
    + 网关动态分配DNS服务器IP

+ 根域名(.root或.)
    + 一般省略


## ref
+ [DNS 原理入门](https://www.ruanyifeng.com/blog/2016/06/dns.html)

+ [网络基础知识之————A记录和CNAME记录的区别](https://developer.aliyun.com/article/311926)
+ [DNS NS 记录](https://www.cloudflare.com/zh-cn/learning/dns/dns-records/dns-ns-record/)
+ [DNS域名解析中A、AAAA、CNAME、MX、NS、TXT、SRV、SOA、PTR各项记录的作用](https://itbilu.com/other/relate/EyxzdVl3.html)