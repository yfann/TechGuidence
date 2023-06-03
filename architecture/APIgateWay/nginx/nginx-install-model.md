
## cmd
<!-- nginx folder -->
+ ` ./configure --help | grep dynamic`

+ `nginx -t`
    + 检查配置文件

## build module
+ `./configure --prefix=/你的安装目录  --add-module=/第三方模块目录`

## load_module
<!-- nginx.conf -->
+ `load_module modules/ngx_http_echo_module.so;`


## 编译 model issues
+ `../ngx-http-auth-jwt-module-2.0.1/src/ngx_http_auth_jwt_module.c:13:10: fatal error: 'jwt.h' file not found`
    + `sudo apt-get install libjwt-dev` for Ubuntu
    + `brew install libjwt` for MAC

+ `../ngx-http-auth-jwt-module-2.0.1/src/ngx_http_auth_jwt_module.c:650:58: error: no member named 'cookies' in 'ngx_http_headers_in_t'`
    + Nginx 版本与 ngx-http-auth-jwt-module 模块不兼容。
    + `ngx_http_auth_jwt_module_2.0.1_nginx_1.24.0.tgz`
        + 支持 nginx 1.24

## ref
<!-- mac nginx instal model -->
+ [Install NGiNX module from source on Mac OSX](https://github.com/Jiri-Mihal/install-nginx-module-mac-osx)

+ [ngx-http-auth-jwt-module](https://github.com/TeslaGov/ngx-http-auth-jwt-module/releases/tag/2.0.1)

<!-- load_module -->
+ [如何为Nginx添加一个模块(下)](https://cloud.tencent.com/developer/article/1540709)
+ [NGINX Dynamic Modules: How They Work](https://www.nginx.com/blog/nginx-dynamic-modules-how-they-work/)
+ [Compiling Third-Party Dynamic Modules for NGINX and NGINX Plus](https://www.nginx.com/blog/compiling-dynamic-modules-nginx-plus/)