## tips
+ help-> Find Action
    - maven projects
+ Run->Edit configuration->Application:VM options:`-Dspring.profiles.active=local`


## shortcut

+ `Alt + Enter`  导入包
+ `Ctrl+Alt+L`  格式化代码
+ `Ctrl + space` 代码提示
+ `Ctrl + alt + left` 返回上次代码
+ `shift + f6` rename
+ `alter + insert` 生产getter,setter
+ `ctrl + alt + T` surround code
+ `ctrl + shift + Space` new后面自动补全
+ `ctrl + w` 选择扩展
+ `/** + 回车` 注释
+ `ctrl + /` 注释

<!-- 查找 -->
+ `ctrl + N` 查找类
+ `ctrl + shift + N` 查找文件
+ `alt + F7` 查看类的使用 
+ `ctrl + Q` 查看说明文档
+ `ctrl + F12`  查看当前代码summary
+ `ctrl + H` 查看继承关系
+ `ctrl + B` = `ctrl + click` 查看父类定义
+ `ctrl + alt + b` 查看子类定义
+ `ctrl + F` 本页查找
+ `ctrl + shift + F` 全局查找
+ `shift + shift` 搜索任何东西
+ `alt + F1` 切换视图



## ref

+ [IntelliJ IDEA使用教程](https://blog.csdn.net/qq_27093465/article/details/77449117?utm_source=blogxgwz2)
+ [史上最简单的 IntelliJ IDEA 教程](https://blog.csdn.net/qq_35246620/article/details/61191375)
+ [IntelliJ IDEA教程](https://www.yiibai.com/intellij_idea)
+ [gitbook idea](https://youmeek.gitbooks.io/intellij-idea-tutorial/content/)


## issue

+ `Error: Could not find or load main class <class>`    sdk没配
+ lombok不能识别
    - settings->Plugins->安装lombok插件
    - settings->Build->Compiler->Annotation Processors->Enable annotation processing
+ `cannot resolve xxx` 按`alter+Enter`导入包