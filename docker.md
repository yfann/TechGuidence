##Docker


+ Hub: 中央仓库 
+ Image: 容器的镜像 保存在Hub
+ Container: Image 生成container, container修改后提交回Image

#插件

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
		
		
		
		
		
##Ref

+ [docker与虚拟机性能比较](http://blog.csdn.net/cbl709/article/details/43955687)