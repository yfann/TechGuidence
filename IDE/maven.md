## Maven

## 介绍

+ 本地仓库(${user.home}/.m2/repository) 统一管理jar包,maven会从maven的中央仓库拉取相关库放到本地仓库缓存起来

## cli

+ mvn archetype:generate /*目录建立*/
+ mvn compile /*target文件夹下生成class*/
+ mvn package /*生成jar或war*/
+ mvn install /*jar安装到本地仓库*/
+ mvn clean /*清空target文件夹*/
+ mvn clean compile /*先清理 后编译*/
+ mvn dependency:tree /*查看依赖项*/
+ `mvn install` 部署(clean -> compile -> test -> package ->jar包放入本地仓库)
+ `mvn dependency:tree -Doutput=*.txt`


## others

+ 坐标(groupId,artifactId,version)   /*maven项目的唯一标识*/
    - groupId /*反写的公司网址+项目名*/
    - artifactId /*项目名+模块名*/
    - 包名 = groupId + artifactId
+ 仓库(根据坐标先从本地仓库查找，然后是中央仓库) /*setting.xml中更改localRepository修改本地仓库位置*/
+ 配置({M2_HOME}\conf\setting.xml) /*proxy,仓库位置*/
+ 中央仓库(http://search.maven.org/)
+ profile /*通过active激活 以适应不同环境*/


## 配置

+ `<optional>` 不传递依赖

+ `<exclusion>` 排除依赖项

+ `<resource>`

## 版本依赖
+ 依赖树上，深度越浅，越被优先选择
+ 依赖如果在同一层，在前的被选择

## ref

+ [maven教程](http://www.yiibai.com/maven/)

+ [Maven入门，读完这篇就够了](https://www.jianshu.com/p/41d07cf95482)
+ [runoob](http://www.runoob.com/maven/maven-tutorial.html)
+ [Maven 使用教程](https://www.jianshu.com/p/1eff16f60297)
+ [offical](http://maven.apache.org/run.html)
+ [maven教程](http://www.cnblogs.com/xdp-gacl/category/544719.html)
+ [resources标签介绍](https://my.oschina.net/anxiaole/blog/1613348)

+ [中央仓库](http://search.maven.org/)
+ [查找](https://mvnrepository.com/)
+ [maven传递依赖的版本确定规则](https://blog.csdn.net/bluishglc/article/details/6584678)