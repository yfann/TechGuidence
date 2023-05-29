## nginx.conf

+ root
    + 静态资源

+ proxy_pass
    + 反向代理
    + 动态资源
        + 后端收到的是Nginx的地址，而不是request的地址
            + HTTP HEADER可以自定义

+ upstream
    + 负载均衡



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