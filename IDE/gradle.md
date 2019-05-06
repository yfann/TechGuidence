## cmd

+ `gradle -q [task]` -q quiet模式，不会生成日志信息
+ `gradle -D ...`向运行gradle的JVM传递system属性(或使用文件gradle.properties添加system属性(前缀为`systemProp.[name]`,只能在根项目中设置))
+ `gradle -P ...`向Project天际属性(或使用文件gradle.properties添加project属性)`println System.properties['system']`

## plugins

+ `apply from: 'other.gradle'`脚本插件,本地路径或远程
+ `apply plugin: 'java'`二进制插件，通过插件ID


## java

+ source set main/test目录
+ [tasks](https://dongchuan.gitbooks.io/gradle-user-guide-/the_java_plugin/java_plugin_tasks.html)


## update gradle version for a project

+ `gradlew --version` check current version
+ `gradle/wrapper/gradle-wraper.properties` change version

## ref
+ [Gradle User Guide](https://dongchuan.gitbooks.io/gradle-user-guide-/build_script_basics/hello_world.html)
+ [插件门户](https://plugins.gradle.org/)
+ [为gradle项目配置多种开发环境](https://chenkaihua.com/2016/04/25/configure-multiple-development-environments-for-gradle-projects/)