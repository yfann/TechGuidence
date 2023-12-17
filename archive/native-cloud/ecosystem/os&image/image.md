
# image FS
+ rootfs
+ overlayfs

## build image
+ Buildah
    + Builds container images with or without Dockerfiles 
+ Podman

## cmd
<!-- union mount -->
+ `mount -t overlay overlay -o lowerdir=A:B,upperdir=C,workdir=worker /tmp/test/merged`
<!-- docker 查看 rootfs -->
+ `docker image inspect ubuntu`

## tips
+ image
    + 多层联合挂载

+ container 隔离
    + namespace
        + IPC,Network,Mount,PID,User,UTS,Cgroup
    + Cgroups(control groups)
        + resouce limiting
    + rootfs
        + docker启动时，内部进程可见的文件系统，docker容器的根目录
            + `docker exec`看到的文件系统
        + 包含操作系统运行时所需的文件系统
        + docker deamon为container 挂载rootfs
            + 先挂载为只读模式
            + 通过Union Mount在rootfs之上挂载个读写层
                + container 运行时的变化只会写到读写层
                + whiteout技术隐藏只读层中的旧版文件
+ Union Mount
    + overlayFS 是Union Mount的一种实现
        + merged（呈现给用户的统一视图）
            + lower(只读层)
            + upper(读写层)
            + work（挂载后清空，用户不可见）
    + VFS
    + device mapper
## ref
+ [Buildah](https://www.redhat.com/en/topics/containers/what-is-buildah)

+ [手撕docker文件结构 —— overlayFS，image，container文件结构详解](https://zhuanlan.zhihu.com/p/374924046)
+ [利用 commit 理解镜像构成](https://yeasy.gitbook.io/docker_practice/image/commit)
+ [docker image 到底是什么](https://houbb.github.io/2019/12/18/docker-learn-22-image-struct)
+ [Docker学习：Image的本地存储结构](https://segmentfault.com/a/1190000017579626)