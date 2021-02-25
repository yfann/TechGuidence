## Docker
+ Hub: 中央仓库 
+ Image: 容器的镜像 保存在Hub
+ Container: Image 生成container, container修改后提交回Image
+ docker client
	- 提交build files到daemon
+ docker daemon(守护进程)
	- windows中daemon run in VM
+ build process
	- 先从Docker Hub拉取base image
+ docker image layer
    - read-only
    - speed up the distribution of images across the network
    - parent image
        - share libs and files
## cmd
+ `docker --version`  查看是否安装成功

<!-- image -->
+ `docker image ls` or `docker images -a` 列出安装的image
+ `docker image rm [imageName]` 删除image
+ `docker image pull library/[imageName]` or `docker image pull [imageName]` library默认官方组
+ `docker image build -t [imageName]:[tagName] [.]`默认标签是latest,最后是dockerfile文件所在路径
+ `docker system prune [-a]` 清除不使用的镜像

<!-- container -->
+ `docker container run <-p> [hostPort]:[containerPort] <-it> [cmd]` 新建容器,本地没有的image会从仓库取,`-it`shell映射,`cmd`容器启动后执行,`-d`后台运行返回容器id
+ `docker run [params] [image]`
	- `-d [name]`后端运行
	- `--name [name]`别名
	- `-p [host port]:[container port]` map host port to container port
		- `localhost:hostPort` 访问容器页面
		- 如果docker运行在mac或windows,daemon运行在VM中,则地址为`VM id:hostPort` `DOCKER_HOST`中查看VM ip或VM hostname
	- `--network host`容器内可以通过localhost访问主机网络
	- `-v [host path]:[container path]`volume挂载路径
+ `docker start/stop/restart [containerID]` 操作已有容器
+ `docker container kill [containID]` 强行终止容器
+ `docker container ls` 列出正在运行的容器 
	- `docker ps`
	- `docker inspect [containerID]`
+ `docker contianer ls --all`列出所有容器包括终止运行的容器
+ `docker container rm [containerID]`删除容器文件
+ `docker container logs [containerID]` 查看docker容器的输出内容
<!-- 进入container -->
+ `docker exec -it [--user root] [containerID] /bin/bash` 进入正在运行的容器目录 /bin/sh
	- `-i`, which makes sure STDIN is kept open. You need this for entering commands into the shell.
	- `-t`, which allocates a pseudo terminal (TTY).
	- `ctrl+d`or`exit`退出容器
+ `docker container cp [containID]:[/path/to/file] .` 拷贝容器中的文件到本地



<!-- practice -->
+ `docker pull  microsoft/aspnet`
+ `docker build -t testName ./app/web  (dockerfile path)`为部署的程序生成镜像
+ `docker run -t -d -p 8010:5004 testName`运行镜像  8010 系统的端口,5004 dockerfile中暴露出的端口


<!-- log -->
+ `docker logs <container id>`

<!-- docker hub -->
+ `dcoker build -t <img name> .` Dockerfile所在目录
+ `docker tag <img>:latest <docker id>/<img>:tag`
+ `docker login`
+ `docker push <docker id>/<img name>:tag`
+ `docker pull <docker id>/<img name>:tag`
+ `docker logout`



## Mac
+ `brew install docker`
+ `sudo usermod -aG docker $USER` 避免每次都sudo
+ `sudo service docker start` 启动docker


## PROXY
+ Docker Desktop proxy
	+ 拉取image的代理
+ `docker build --build-arg http_proxy=.... --build-arg https_proxy=.... .`
	+ build中拉取第三方库的代理,例如 go get ....
+ `ENV http_proxy ....` Dockerfile中设置


## tips
+ local Docker image registry
+ windows 需要先启动docker
+ windows docker desktop 设代理
+ Mac上没有docker0桥接,不支持host网络模式,用`docker.for.mac.host.internal`代替mac ip





## Ref
+ [hub](https://hub.docker.com)
+ [Docker 入门教程](https://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)
+ [Docker 命令大全](http://www.runoob.com/docker/docker-command-manual.html)
+ [Docker —— 从入门到实践](https://yeasy.gitbooks.io/docker_practice/container/attach_exec.html)
<!-- other -->
+ [docker ip映射](https://www.cnblogs.com/brock0624/p/9788710.html)
+ [docker与虚拟机性能比较](http://blog.csdn.net/cbl709/article/details/43955687)
+ [How To Remove Docker Images, Containers, and Volumes](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes)
+ [install docker desktop on windows](https://docs.docker.com/docker-for-windows/
+ [Docker 容器中的数据管理](https://www.jianshu.com/p/d7e5ea39cc39)
+ [Docker容器访问宿主机网络](https://jingsam.github.io/2018/10/16/host-in-docker.html)
+ [Get started with Docker for Windows](https://docs.docker.com/docker-for-windows/)
+ [Docker on Windows](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/configure-docker-daemon)
+ [Deploy on Kubernetes](https://docs.docker.com/docker-for-windows/kubernetes/)
<!-- 命令 -->
+ [Docker命令-docker exec](https://www.jianshu.com/p/d858d3cfd427)

<!-- 技巧 -->
+ [mac中使用docker搭建linux开发服](https://www.jianshu.com/p/d26140d20cc0)

<!-- proxy -->
+ [Configure Docker to use a proxy server](https://docs.docker.com/network/proxy/)


<!-- cmd -->
+ [理解Docker容器的进程管理](https://developer.aliyun.com/article/5545)