## Docker


+ Hub: 中央仓库 
+ Image: 容器的镜像 保存在Hub
+ Container: Image 生成container, container修改后提交回Image

# 插件

docker UI



安装模板镜像
docker pull  microsoft/aspnet



在要部署的程序中创建dockerfile
dockerfile

		FROM microsoft/aspnet
		
		COPY . /app
		WORKDIR /app
		RUN ["dnu","restore"]
		
		EXPOSE 5004
		ENTRYPOINT["dnx","-p","project.json","kestrel"]



为部署的程序生成镜像
docker build -t testName ./app/web  (dockerfile path)


运行镜像
docker run -t -d -p 8010:5004 testName

		8010 系统的端口
		5004 dockerfile中暴露出的端口
		
		
## windows 10

+ `docker --version` 
+ `docker pull [image name]`
+ `docker image ls`
+ `docker container ls` 列出running的container, --all 列出所有
+ `docker container stop\rm [contianer name]`
+ `docker run [image name]`

+ `docker run --interactive --tty ubuntu bash`


## DockerFile
+ `FROM <image>`基础源镜像，必须在第一行
+ `RUN "exe","param1","param2"` build时运行
+ `CMD ["exe","param1","param2"]` 容器启动时运行
+ `EXPOSE <port> [<port>...]` 容器对外映射的端口,`docker run -p <port>`
+ `ENV <key>=<value> ...`容器内被脚本使用
+ `ADD <src>... <dest>``COPY <src>... <dest>`复制文件到目标目录，ADD可以是url
+ `ENTRYPOINT ["exe","param1","param2"]` 容器启动后执行，Dockerfile只能有一个ENTRYPOINT，`docker run --entrypoint`
+ `docker build <path>/<url>` 指定包含Dockerfile的路径

## Ref

+ [hub](https://hub.docker.com)
+ [Docker on Windows](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/configure-docker-daemon)
+ [docker与虚拟机性能比较](http://blog.csdn.net/cbl709/article/details/43955687)
