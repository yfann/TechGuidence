
## docker ENTRYPOINT
```s
FROM ubuntu
MAINTAINER sofija
RUN apt-get update
ENTRYPOINT [“echo”, “Hello”]
CMD [“World”]
```
+ An ENTRYPOINT allows you to configure a container that will run as an executable
    + `ENTRYPOINT ["/bin/echo"]`
    + 那么docker build出来的镜像以后的容器功能就像一个/bin/echo程序
    + `docker run -it imageecho “this is a test” ` 输出“this is a test”

+ 2种使用方式
    + ENTRYPOINT ["executable", "param1", "param2"] (the preferred exec form) 
    + ENTRYPOINT command param1 param2 (shell form) 
        + 会屏蔽调docker run时后加的参数和CMD里的参数

+ `docker run --entrypoint [new_command] [docker_image] [param]`
+ docker CMD中的内容作为参数
+ 通过执行脚本运行多个命令.sh

## docker CMD
+ The main purpose of a CMD is to provide defaults for an executing container.
+ 3种使用方式
    + CMD ["executable","param1","param2"] (exec form, this is the preferred form) 
    + CMD ["param1","param2"] (as default parameters to ENTRYPOINT) 
    + CMD command param1 param2 (shell form) 

+ 一个Dockerfile中只能有一个CMD
+ docker run命令如果指定了参数会把CMD里的参数覆盖
    + `docker run -it ubuntu /bin/bash`
        + 参数是`/bin/bash`
        + `-it`是docker的参数
    + 例子：CMD [“/bin/echo”, “this is a echo test ”] 
        + `docker run ec` 输出“this is a echo test ”
        + `docker run ec /bin/bash`
            + 不会输出,CMD命令被”/bin/bash”覆盖了

+ &&执行多个命令
        + `CMD ["sh","-c","mkdir -p ~/my/new/directory/ && cd ~/my/new/directory && touch new.file"]`


## tips
+ ENTRYPOINT，CMD(PID1进程启动)
    + shell
        + CMD executable param1 param2
        + `/bin/sh -c ”executable param1 param2”` 为PID1
            + 子进程为executable param1 param2
    + exec
        + CMD ["executable","param1","param2"]
            + 有没有数组即为区别
        + PID1进程为"executable","param1","param2"
        + docker run 也是这种方式

## ref
+ [论docker中 CMD 与 ENTRYPOINT 的区别(转)](https://developer.aliyun.com/article/270424)
+ [Linux中的0号进程与1号进程](https://blog.csdn.net/gongxifacai_believe/article/details/53771464)