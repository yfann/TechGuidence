
## interview

+ SSM(SpringMVC+SPring+MyBatis)
+ 什么是Spring Boot？它的主要特点和优势是什么？
    + 自动配置：Spring Boot根据类路径中的依赖和配置属性自动配置应用程序，大大减少了繁琐的配置过程。
    + 独立运行：Spring Boot应用程序可以以独立的方式运行，不需要部署到传统的Java EE应用服务器中。
    + 内嵌服务器：Spring Boot集成了常见的Web服务器，如Tomcat、Jetty和Undertow，可以直接通过main方法启动应用程序。
    + 简化依赖管理：Spring Boot通过起步依赖（Starter Dependency）简化了对外部依赖的管理，使得构建和管理应用程序的依赖变得更加简单。
    + 健康检查和监控：Spring Boot提供了健康检查和监控的功能，可以通过端点（Actuator）来查看应用程序的状态和指标。

+ Spring Boot中如何管理应用程序的配置？如何覆盖默认的配置？
    + pring Boot使用application.properties或application.yml文件来管理应用程序的配置。可以在这些配置文件中设置各种属性，如数据库连接、日志级别、端口号等。
    + 覆盖配置
        + 在配置文件中直接覆盖：在application.properties或application.yml中设置相同的属性键，并给予新的值。
        + 使用命令行参数：可以通过命令行参数来覆盖配置属性的值。例如，使用--server.port=8081来修改端口号。
        + 使用环境变量：可以通过环境变量来设置配置属性的值。Spring Boot会自动解析特定格式的环境变量，并将其映射到相应的配置属性。

+ 解释Spring Boot中的起步依赖（Starter Dependency）是什么？它们的作用和使用方法是什么？
    + Spring Boot的起步依赖（Starter Dependency）是一种便捷的依赖管理机制，用于简化对外部依赖的管理。起步依赖是一组预配置的依赖关系，包含了一组常用的库和框架，可以直接添加到项目中，而无需手动解析和配置每个库的依赖关系。
    + 起步依赖的作用是简化构建和管理Spring Boot应用程序的依赖关系。它们会自动引入所需的库和框架，并处理版本兼容性和依赖
## ref

+ [Shiro入门这篇就够了](https://segmentfault.com/a/1190000013875092)
+ [spring：我是如何解决循环依赖的？](https://cloud.tencent.com/developer/article/1769948)