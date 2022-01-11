

## Nginx test server
<!-- install nginx -->
+ `yum install  epel-release`
+ `yum install nginx`
<!-- create test page -->
+ `cd /usr/share/nginx/html/`
+ `echo "hello ~" > index.html`
<!-- start nginx -->
+ `systemctl enable nginx`
+ `systemctl start nginx`


## httpd docker test server

+ `yum -y install docker`
+ `service docker start`
+ `docker version`
+ `docker run -dit --name <xxx> -p 8080:80 <xxx>`


## tcp server

+ `nc -lk <port>` start server
    + `nc <ip> <port>`  connect server