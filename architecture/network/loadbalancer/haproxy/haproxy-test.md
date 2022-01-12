

## Nginx test server
<!-- install nginx -->
<!-- yum install epel-release -->
+ `yum install nginx -y`
<!-- create test page -->
+ `cd /usr/share/nginx/html/`
+ `echo "hello ~" > index.html`
<!-- config -->
+ `vi /etc/nginx/nginx.conf`
```conf
...
    location /fan3 {
        proxy_pass http://127.0.0.1:80/;
    }
...
```
+ `service nginx restart`

## httpd docker test server

+ `yum -y install docker`
+ `service docker start`
+ `docker version`

+ `docker save test>test.tar`
+ `docker load < test.tar`

+ `docker run -dit --name <xxx> -p 8080:80 <xxx>`


## httpd server
+ `yum install httpd -y`
+ `systemctl restart httpd`

+ `mkdir -p /var/www/html`
+ `echo "test" >/var/www/html/index.html`




## tcp server

+ `nc -lk <port>` start server
    + `nc <ip> <port>`  connect server