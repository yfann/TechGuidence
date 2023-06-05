
## cmd
+ `docker pull nginx:1.24.0`
+ `docker run --name nginx --rm -p 8081:80 -d nginx:1.24.0`
    + `docker run --name nginx --rm -p 8081:80 -v ~/documents/nginx/nginx.conf:/etc/nginx/nginx.conf -v ~/documents/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf  -v ~/documents/nginx/models/ngx_http_auth_jwt_module.so:/etc/nginx/modules/ngx_http_auth_jwt_module.so  -d nginx:1.24.0`
+ `docker stop <container id>`

+ `docker exec -it nginx /bin/sh`
+ `docker exec nginx whereis nginx`
+ `docker exec nginx ls /etc/nginx`
+ `docker exec nginx nginx -V`
+ `docker cp nginx:/etc/nginx/nginx.conf ~/documents/nginx`



## ref
+ [docker hub](https://registry.hub.docker.com/_/nginx/)
+ [docker-nginx](https://github.com/nginxinc/docker-nginx)
+ [docker + nginx](https://snowdreams1006.github.io/devops/docker-nginx.html)
+ [How to Use the NGINX Docker Official Image](https://www.docker.com/blog/how-to-use-the-official-nginx-docker-image/)