
## DockerFile
+ 用来生成image文件
+ `FROM <image>`基础源镜像，必须在第一行
+ `WORKDIR [/app]`工作路径为image里的app目录
+ `COPY [.] [/app]`当前目录下的文件copy到image文件的/app目录里
+ `RUN "exe","param1","param2"` build时运行`RUN npm install`,可以多条
+ `CMD ["exe","param1","param2"]` 容器启动后运行,只能一条
+ `EXPOSE <port> [<port>...]` 容器对外映射的端口,`docker run -p <port>`
+ `ENV <key>=<value> ...`容器内被脚本使用
+ `ADD <src>... <dest>``COPY <src>... <dest>`复制文件到目标目录，ADD可以是url
+ `ENTRYPOINT ["exe","param1","param2"]` 容器启动后执行，Dockerfile只能有一个ENTRYPOINT，`docker run --entrypoint`


## docker环境变量
+ `ENV <key> <val>` 
    + Dockerfile中添加
    + build出来的容器中会包含相应环境变量
+ `docker run -e LANGUAGE=Spanish -e API_KEY=09876 -p 3000:3000 -ti envtest` 环境变量参数传入容器


## issues
+ docker when using add with more than one source file, the destination must be a directory and end with a /
    - source下可能有多个匹配的文件

## tips writting Dockerfile
+ Use one ENTRYPOINT per Dockerfile. The ENTRYPOINT or CMD tells Docker what process starts inside the running container, so there should be only one running process; containers are all about process isolation.

+ To cut down on the container layers, developers should combine similar commands into one using & & and \. Each new command in the Dockerfile adds a layer to the Docker container image, thus increasing its storage.

+ Use the caching system to improve the containers’ build times. If there is no change to a layer, it should be at the top of the Dockerfile. Caching is part of the reason that the order of statements is essential. Add files that are least likely to change first and the ones most likely to change last.

+ Use multistage builds to reduce the size of the final image drastically.

+ Do not install unnecessary tools or packages. Doing this will reduce the containers’ attack surface and size, reducing network transfer times from the registry to the hosts running the containers.

## ref
+ [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
+ [Dockerfile: ADD vs COPY](https://www.ctl.io/developers/blog/post/dockerfile-add-vs-copy/)
+ [Docker Dockerfile](https://www.runoob.com/docker/docker-dockerfile.html)
+ [深入Dockerfile（一）](https://github.com/qianlei90/Blog/issues/35)
<!-- detail -->
+ [创建尽可能小的 Docker 容器---scratch](https://segmentfault.com/a/1190000000628247)

