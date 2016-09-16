## Maven

## 介绍

+ 本地仓库(${user.home}/.m2/repository) 同一管理jar包,maven会从maven的中央仓库拉取相关库放到本地仓库缓存起来

## CMD
+ `mvn -h` help

+ `mvn clean` 清除编译结果，删除target文件夹

+ `mvn compile`  编译maven项目

+ `mvn test` 跑UT

+ `mvn package` 打包

+ `mvn install` 部署(clean -> compile -> test -> package ->jar包放入本地仓库)

+ `mvn clean comiple` 先清理 再编译

+ `mvn clean deploy site-deploy`

+ `mvn clean install`

+ `mvn archetype:generate` 构建项目

+ `mvn archetype:create` 构建项目

+ `mvn jetty:run` 启动jetty服务器

## Ref

+ [office](http://maven.apache.org/run.html)
+ [中央仓库](http://search.maven.org/)
+ [maven教程](http://www.cnblogs.com/xdp-gacl/category/544719.html)