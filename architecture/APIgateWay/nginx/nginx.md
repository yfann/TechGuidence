# nginx
+ 动静分离
  + 静态资源在Nginx上

+ 负载均衡

+ 反向代理

+ 鉴权

+ IP控制访问


## nginx on windows
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



## docker nginx
+ `docker pull nginx`
+ `docker run --name some-nginx -d -p 8080:80 some-content-nginx`
  + `http://localhost:8080`
<!-- config -->
+ `docker run --name my-custom-nginx-container -v /host/path/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx`
+ `docker cp tmp-nginx-container:/etc/nginx/nginx.conf /host/path/nginx.conf`
  + copy 容器里的config
<!-- docker-compose.yml -->
```yaml
web:
  image: nginx
  volumes:
   - ./templates:/etc/nginx/templates
  ports:
   - "8080:80"
  environment:
   - NGINX_HOST=foobar.com
   - NGINX_PORT=80
```
  + read ` /etc/nginx/templates/*.template`
  + output to `/etc/nginx/conf.d`




## tips
+ 正向代理
    + 代理客户端
    + 如：VPN
+ 反向代理
    + 代理服务端
    + 如： 访问域名，代理转发到内网中

+ nginx高可用
  + keepalived + Nginx
  + 请求先到keepavlied(VIP)
    + 将请求路由到一个可用的Nginx
     
+ 请求处理机制
  + 异步处理
    + epoll
  + 最大并发数
    + max_client=worker_processes*worker_connections / 4
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