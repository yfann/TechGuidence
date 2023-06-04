## nginx.conf

+ server_name
  + 匹配reqeust中的Host
  + 可以设置多个域名
  + 可以正则匹配

+ proxy_pass
    + `proxy_pass   http://www.zhihu.com/`
      + 直接跳转
    + `proxy_pass   http://www.zhihu.com`
      + 跳转http://www.zhihu.com/{path}
    + 反向代理
    + 动态资源
        + 后端收到的是Nginx的地址，而不是request的地址
            + HTTP HEADER可以自定义

+ upstream
    + 负载均衡

+ Global
    + nginx运行相关

+ events
    + 网络连接相关

+ location
    + 地址定向

+ root
    + 静态资源
    + 请求的根目录
        + `root /var/www;`
        + Web 服务器收到请求后，首先要在服务端指定的目录中寻找请求资源
```conf
location /c/ {
      root /a/
}
; http://location/c 对应 /a/c 
```

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
; http://location/nginx 对应 /app
```

+ index

+ inernal
  + 它会阻止直接向客户端返回响应，并只允许通过内部请求访问
  + 可以确保这些URL仅能通过内部请求访问，而不能直接从客户端访问。

+ include
  + 包含其他文件的内容

+ map


## vars

+ `set $test "notok";`

## tips

+ proxy_pass在if中结尾不能带`/`
```config
        if ($http_jwt_roles ~* "baidu"){
            proxy_pass   http://www.baidu.com;
            break;
        }
```


## ref
+ [ngx_http_auth_jwt_module](http://nginx.org/en/docs/http/ngx_http_auth_jwt_module.html)
+ [Beginner’s Guide](http://nginx.org/en/docs/beginners_guide.html)
+ [Configuring HTTPS servers](http://nginx.org/en/docs/http/configuring_https_servers.html)
+ [nginx location](https://juejin.im/post/5d81906c518825300a3ec7ca)

<!-- vars -->
+ [nginx variables](http://nginx.org/en/docs/varindex.html)