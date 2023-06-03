
## cmd
+ `docker pull nginx:1.24.0`
+ `docker run --name nginx --rm -p 8081:80 -d nginx:1.24.0`
+ `docker stop <container id>`

+ `docker exec -it <container id> /bin/sh`
+ `docker exec nginx whereis nginx`
+ `docker exec nginx ls /etc/nginx`
+ `docker cp nginx:/etc/nginx/nginx.conf ~/documents/nginx`
## ref
+ [docker hub](https://registry.hub.docker.com/_/nginx/)
+ [docker-nginx](https://github.com/nginxinc/docker-nginx)