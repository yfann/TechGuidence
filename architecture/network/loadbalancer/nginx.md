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

+ alias
```conf
  server {
    listen 0.0.0.0:8080;
    root /app;
    location / {
      index index.html index.php;
    }
    location /nginx/ {
      index index.html index.php;
      alias /app/;
    }
  }
```

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
+ [alias](http://nginx.org/en/docs/http/ngx_http_core_module.html#alias)
+ [Nginx系列：root与alias指令用法的区别](https://cloud.tencent.com/developer/article/1696822)
+ [How To Set Up Nginx Server Blocks (Virtual Hosts) on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
<!-- issue -->
+ [NGINX does not support HTTP/1.x and HTTP/2 at the same time on a cleartext (non-TLS) port.](https://github.com/kubernetes/ingress-nginx/issues/3897)


<!-- helm  -->
+ [nginx helm chart](https://github.com/bitnami/charts/tree/master/bitnami/nginx)