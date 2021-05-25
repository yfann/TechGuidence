# docker images

+ scratch
    + 不包含shell
    + docker minimal image
+ centos
+ busybox
    + 没有包管理apt,不能安装curl等工具
+ curlimages/curl


## alpine
+ `kubectl run -it --rm --restart=Never alpine --image=alpine sh`
+ `docker run -it --rm alpine /bin/ash`
+ `docker run -it --rm alpine /bin/sh` 
+ `apk --update add curl`

## tips
+ 确保在 Docker 文件中有一个永远执行的命令
    + 如果镜像中没有服务或守护进程，最后一个命令停止运行,Docker镜像就会停止
    + `docker run -d debian sleep 300` hold the container open
        + `docker run -d alpine sh -c 'while sleep 3600; do :; done'`


## 3rd
+ jimmidyson/configmap-reload:v0.5.0

## ref
+ [如何选择Docker基础镜像](https://blog.csdn.net/nklinsirui/article/details/80967677)

