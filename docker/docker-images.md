# docker images
+ alpine
    + `docker run -it --rm alpine /bin/ash`
    + `docker run -it --rm alpine /bin/sh` 
+ scratch
    + 不包含shell
    + docker minimal image
+ centos
+ busybox


## tips
+ `docker run -d debian sleep 300` hold the container open
    + `docker run -d alpine sh -c 'while sleep 3600; do :; done'`

## ref
+ [如何选择Docker基础镜像](https://blog.csdn.net/nklinsirui/article/details/80967677)

