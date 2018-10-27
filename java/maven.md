

## cli

+ mvn archetype:generate /*目录建立*/
+ mvn compile /*生成target文件夹*/
+ mvn package /*生成jar或war*/
+ mvn install /*jar安装到本地仓库*/
+ mvn clean /*删除target*/
+ mvn clean compile /*先清理 后编译*/
## others

+ 坐标(groupId,artifactId,version)   /*maven项目的唯一标识*/
    - groupId /*反写的公司网址+项目名*/
    - artifactId /*项目名+模块名*/
    - 包名 = groupId + artifactId
+ 仓库(根据坐标先从本地仓库查找，然后是中央仓库) /*setting.xml中更改localRepository修改本地仓库位置*/
+ 配置({M2_HOME}\conf\setting.xml) /*proxy,仓库位置*/
+ 中央仓库(http://search.maven.org/)

## ref
+ [Maven——快速入门手册（学习记录）](http://www.cnblogs.com/qbzf-Blog/p/6539161.html)
+ [maven教程](http://www.yiibai.com/maven/)
+ [查找](https://mvnrepository.com/)
+ [Maven入门，读完这篇就够了](https://www.jianshu.com/p/41d07cf95482)