
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


## 注解
+ `@Async`
    + `@EnableAsync`
    + method will be executed in a separate thread
    + If you call this method from within the same class, the annotation's asynchronous behavior will not work.
    + 注解（Annotation）的底层逻辑是通过反射（Reflection）实现的
        + 编译时
            + 扫描源代码的注解
            + Java编译器会将注解的信息保存在编译后的class文件中
            + 每个注解可以在编译时被处理，例如根据注解生成额外的代码或者检查代码的合法性
                + 这一过程是由注解处理器（Annotation Processor）完成的
                + 注解处理器可以通过Java的javax.annotation.processing包来实现
        + 运行时
            + ava虚拟机通过反射读取class文件中的注解信息，然后根据注解的内容执行相应的逻辑
                + 例如，Spring框架在运行时会扫描类上的注解，自动创建Bean实例并完成依赖注入。  


## 类加载
+ 将类的字节码从磁盘加载到内存中，并在Java虚拟机中创建一个Class对象的过程
+ loading
    + JVM更具类的全名(包含包名)查找并读取class数据
+ linking
    + 验证(Verification)
        + 确保类的字节码符合Java虚拟机的规范，并且不会引发安全或运行时错误。
    + 准备（Preparation）
        + Java虚拟机会为类的静态字段分配内存，并设置默认初始值（零值）。这里并不会初始化类中的静态变量。
    + 解析（Resolution）
        + Java虚拟机会将符号引用（例如类、方法、字段的引用）转换为直接引用。符号引用是一种在编译时期生成的，而直接引用是在运行时期确定的。解析的过程有助于减少对符号引用的查找时间，提高程序执行的效率。
+ 初始化（Initialization）
    + Java虚拟机会对类的静态变量进行初始化，并执行类中的静态初始化块。静态变量的初始化是按照声明的顺序依次执行的。初始化阶段是类加载过程中执行类构造器<clinit>的过程。
+ 类的加载是按需进行的，只有在首次使用某个类时才会触发类加载过程。Java虚拟机会负责保证类的加载是线程安全的，确保每个类只被加载一次。

## ref

+ [Shiro入门这篇就够了](https://segmentfault.com/a/1190000013875092)
+ [spring：我是如何解决循环依赖的？](https://cloud.tencent.com/developer/article/1769948)