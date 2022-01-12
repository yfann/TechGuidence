## nginx on windows
+ [install](http://nginx.org/en/docs/windows.html)
+ `start nginx` **http://localhost/**
+ `nginx -s stop`
+ `nginx -c conf\my.conf` **default:conf\nginx.conf**
+ `nginx -s reload`
+ `nginx -s reopen`


## nginx on Centos

+ `yum install -y nginx`
+ `service nginx start/stop/restart`
+ `systemctl status nginx.service`

## config

+ `nginx -t` 检查配置文件语法
+ `vi /etc/nginx/nginx.conf`

## tips
+ 正向代理
    + 代理客户端
    + 如：VPN
+ 反向代理
    + 代理服务端
    + 如： 访问域名，代理转发到内网中



## ref
+ [8分钟带你深入浅出搞懂Nginx](https://zhuanlan.zhihu.com/p/34943332)
+ [正向代理与反向代理的区别](https://www.jianshu.com/p/208c02c9dd1d)
+ [nginx 这一篇就够了](https://juejin.im/post/5d81906c518825300a3ec7ca)
+ [How nginx processes a request](http://nginx.org/en/docs/http/request_processing.html)

<!-- config -->
+ [upload](https://www.nginx.com/resources/wiki/modules/upload/)
+ [Server names](http://nginx.org/en/docs/http/server_names.html)
+ [nginx配置location](https://www.jianshu.com/p/d3fb148cb5eb)

<!-- issue -->
+ [NGINX does not support HTTP/1.x and HTTP/2 at the same time on a cleartext (non-TLS) port.](https://github.com/kubernetes/ingress-nginx/issues/3897)