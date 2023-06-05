
# nginx image 中添加模块 ngx_http_auth_jwt_module


1. 下载和nginx对应的模块版本
    + ngx_http_auth_jwt_module_2.0.1_nginx_1.24.0.tgz

2. 修改`nginx.conf`
    + 最开始填加 `load_module modules/ngx_http_auth_jwt_module.so;`
        + 会去镜像的目录`/etc/nginx/modules`中去寻找模块

3. 重新打包镜像添加模块 ngx_http_auth_jwt_module
   + `docker build -t nginx-jwt .`
   + `docker run --name nginx --rm -p 8081:80 -v ~/documents/nginx/nginx.conf:/etc/nginx/nginx.conf -v ~/documents/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf nginx-jwt`
```dockerfile
FROM nginx:1.24.0

COPY ./models/ngx_http_auth_jwt_module.so  /etc/nginx/modules

RUN apt-get update -y
RUN apt-get install -y libjwt-dev
```


## issues
+ libjwt.so.0: cannot open shared object file: No such file or directory
    + 镜像缺失libjwt库
    + ngx_http_auth_jwt_module 依赖libjwt库

## ref
+ [ngx-http-auth-jwt-module](https://github.com/TeslaGov/ngx-http-auth-jwt-module/releases/tag/2.0.1)

+ [Docker Nginx 添加自定义的模块](https://nowtime.cc/docker/1636.html)

+ [Compiling NGINX module as dynamic module for use in docker](https://gist.github.com/hermanbanken/96f0ff298c162a522ddbba44cad31081)

