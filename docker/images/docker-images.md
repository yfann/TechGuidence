# docker images

+ scratch
    + 不包含shell
    + docker minimal image
+ centos
+ busybox
    + 没有包管理apt,不能安装curl等工具
+ curlimages/curl
+ Alipine
    + 面向安全的轻型 Linux 发行版
    + 包含apk(自己的包管理)

## alpine

+ `kubectl run -it --rm --restart=Never alpine --image=alpine sh`
+ `docker run -it --rm alpine /bin/ash`
+ `docker run -it --rm alpine /bin/sh` 
+ `apk --update add curl`
+ `docker run alpine echo '123'`

+ 迁移
    + ubuntu/debian -> alpine
    + python:3 -> python:3-alpine
    + ruby:2.6 -> ruby:2.6-alpine

+ apk
    + apk hub:https://pkgs.alpinelinux.org/packages
    + 如果需要的安装包不在主索引内，但是在测试或社区索引中
        + `echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories`
        + `apk --update add --no-cache <package>`
    + 仓库换为国内镜像
        + `RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories && apk add --no-cache <package>`

## tips
+ 确保在 Docker 文件中有一个永远执行的命令
    + 如果镜像中没有服务或守护进程，最后一个命令停止运行,Docker镜像就会停止
    + `docker run -d debian sleep 300` hold the container open
        + `docker run -d alpine sh -c 'while sleep 3600; do :; done'`


## 3rd
+ jimmidyson/configmap-reload:v0.5.0

## ref
+ [如何选择Docker基础镜像](https://blog.csdn.net/nklinsirui/article/details/80967677)
+ [Docker学习：Image的本地存储结构](https://segmentfault.com/a/1190000017579626)
+ [apk hub](https://pkgs.alpinelinux.org/packages)