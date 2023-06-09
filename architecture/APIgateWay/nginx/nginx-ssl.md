# Nginx ssl

1. `./nginx -V`
    + 查看是否有`--with-http_ssl_module`
        + 存在则ssl可用

2. 生成自签名证书
    + `openssl genrsa -out nginx.key 4096`
    + `openssl req -new -x509 -days 1000 -key root.key -out nginx.crt`

3. 配置nginx.conf

```conf
server {
    listen 443;
    ssl on;
    ssl_certificate  /root/card/huiblog.top.pem;
    ssl_certificate_key /root/card/huiblog.top.key;
}

server{
    listen 80;
    rewrite ^(.*)$ https://$host$1 permanent;
}

```

## ref
+ [Nginx配置Https（详细、完整)](https://www.cnblogs.com/ambition26/p/14077773.html)
+ [openssl生成自签名证书(完整版)](https://www.jianshu.com/p/0e9ee7ed6c1d)