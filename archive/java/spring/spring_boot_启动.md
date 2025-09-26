
## 启动
+ Main()
    + `main类`在`root package`
        - 添加`@EnableAutoConfiguration` 
            + 定义了`search package`
                - 会搜索`@EnableAutoConfiguration`所在的包中的所有`@Service`,`@Entity` ...
                - 使用`@ComponentScan`不需要指定basePackage
    + `SpringApplication.run(MySpringConfiguration.class, args);` 
+  debug 启动过程
    - `java -jar myproject-0.0.1-SNAPSHOT.jar --debug`
    - 开启debug日志级别
## SpringApplication
+ `SpringApplication.addListeners(…)`
+ ApplicationContext
    - AnnotationConfigApplicationContext
    - AnnotationConfigEmbeddedWebApplicationContext（web环境创建的context）
+ setWebEnvironment(false) 设置当前是否为web环境
+ 获取传递给SpringApplication.run的参数
```java
@Autowired
    public MyBean(ApplicationArguments args)
```
+ ApplicationRunner使用ApplicationArguments参数
    + CommandLineRunner使用string 数组参数
    + SpringApplication.run(…)完成之前调用
    + `org.springframework.core.annotation.Order` 特定顺序调用

## load class
+ `org.springframework.boot.loader.Launcher` 启动spring boot
    + jar包中META-INF/MANIFEST.MF
        + Main-Class:org.springframework.boot.loader.Launcher
            - Launcher会调用启动类中的main()
        + Start-Class:启动类(包含main())
    + 子类
        - jarLauncher
        - WarLauncher
        - PropertiesLauncher
            + 可以添加外部依赖

## ref
+ [spring boot应用启动原理分析](https://blog.csdn.net/hengyunabc/article/details/50120001)
+ [SpringBoot Jar启动](https://blog.csdn.net/BryantLmm/article/details/86305047)