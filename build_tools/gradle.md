## cmd
+ 有build.gradle的目录执行
+ `gradle tasks [--all]`
+ build spring broject
  - `gradle build [-x test]`
+ `gradle -q [task]` -q quiet模式，不会生成日志信息
+ `gradle -D ...`向运行gradle的JVM传递system属性(或使用文件gradle.properties添加system属性(前缀为`systemProp.[name]`,只能在根项目中设置))
+ `gradle -P ...`向Project添加属性(或使用文件gradle.properties添加project属性)`println System.properties['system']`
+ `gradle help [--task]`


## plugins
+ `apply from: 'other.gradle'`脚本插件,本地路径或远程
+ `apply plugin: 'java'`二进制插件，通过插件ID

## config
+ application.yml
```yml
spring:
  profiles:
    active: local
```

## java
+ `gradle build`
+ source set main/test目录
+ [tasks](https://dongchuan.gitbooks.io/gradle-user-guide-/the_java_plugin/java_plugin_tasks.html)


## change gradle version in java project
+ `gradle -v` check current version
+ `gradle/wrapper/gradle-wraper.properties` change version


## issues
+ gradle build 失败时
  - 检查命令行或IDE中的gradle版本是否和项目一致
    + e.g.

## ref
+ [Official Command-Line Interface](https://docs.gradle.org/6.5/userguide/command_line_interface.html#sec:command_line_warnings)
+ [Gradle User Guide](https://dongchuan.gitbooks.io/gradle-user-guide-/build_script_basics/hello_world.html)
<!-- plugin -->
+ [插件门户](https://plugins.gradle.org/)
+ [为gradle项目配置多种开发环境](https://chenkaihua.com/2016/04/25/configure-multiple-development-environments-for-gradle-projects/)
+ [Spring Boot Gradle Plugin Reference Guide](https://gradle.org/next-steps/?version=6.5&format=bin)
+ [Declaring repositories](https://docs.gradle.org/current/userguide/declaring_repositories.html)