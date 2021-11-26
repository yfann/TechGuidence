

## image

<!-- 删除镜像 -->
+ docker rmi `docker images -q`
    + 删除所有镜像
+ docker rmi `docker images | grep xxxxx | awk '{print $3}'`
    + 条件删除

+ docker image prune 
    + `-a`
        删除所有未使用的image
    + `--filter until=<timestamp>`
    + `docker image prune -a --force --filter "until=168h"`
        + 7*24=168h




## container

+ `docker container ls  --all`
+ `docker container kill <container id>`
+ `docker container rm <container id>`

+ `docker stop <container id>`
    + `docker start <container id>`

<!-- 删除容器 -->
+ docker rm `docker ps -aq`
    + 删除所有容器
+ docker rm `docker ps -a | grep xxxxx | awk '{print $1}'`