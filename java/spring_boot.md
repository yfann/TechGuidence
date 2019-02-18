## Main

+ main类放在root package中
+ `SpringApplication.run(xxx.class, args);` xxx.class将作为spring beans的配置源，它是@Configuration类的引用，但也可能是XML配置或要扫描包的引用。
+ `SpringApplication.addListeners(…)`监听Spring框架事件
+ ApplicationContext根据是否为web应用使用AnnotationConfigApplicationContext或AnnotationConfigEmbeddedWebApplicationContext。
```java
setWebEnvironment(boolean webEnvironment)//更改环境
setApplicationContextClass(…)//控制ApplicationContext的类型
```
+ ApplicationArguments获取参数
```java
@Component
public class MyBean {

    @Autowired
    public MyBean(ApplicationArguments args) {
        boolean debug = args.containsOption("debug");
        List<String> files = args.getNonOptionArgs();
        // if run with "--debug logfile.txt" debug=true, files=["logfile.txt"]
    }

}
```

+ runner /*实现ApplicationRunner或CommandLineRunner，两者参数不同，启动后立即执行一些代码*/


## 配置

+ `@Configuration`代替XML
+ 可以把配置放在不同的类中通过`@Import`导入
+ `@ComponentScan`可以收集`@Configuration`类
+ `@Configuration`类中通过`@ImportResource`导入XML配置
+ spring将搜索`@EnableAutoConfiuration`类所在的包
+ 自动配置,在`@Configuration`类上加`@EnableAutoConfiguration`或`@SpringBootApplication`
```java
//exclude 可以禁用某些自动配置
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
```
+ 运行应用时打开`--debug`,查看启动了哪些自动配置
+ 调试mongo
>logging.level.org.springframework.data.mongodb.core.MongoTemplate=DEBUG

## 注解

+ `@ComponentScan` 查找bean,配合`@Autowired`注入
+ `@SpringBootApplication` 等价于`@Configuration`,`EnableAutoConfiguration`,`@ComponentScan`
+ `@ResponseBody` 加上后返回值作为数据返回，不加则返回值作为页面名称
+ `@RestController` = `@Controller` + `@ResponseBody`
+ `@RestController` `@RequestMapping` `@RequestBody` `@PathVariable` `@RequestParam`
+ `@Value`  读取属性值
```java
   @Value("${spring.application.name}")
   private String name;
    //thr语法设置默认值
   @Value("${property_key_name:default_value}")
   @Value("${spring.application.name:demoservice}")
```
+ `@ControllerAdvice` /*全局异常*/  `@ExceptionHandler`
+ `@Scheduled`



## tips


+ 拦截器 @Component + HandlerInterceptor

+ 过滤器 @Component + Filter

+ application.properties 属性文件,可配置端口(或YAML文件配置) active

+ RestTemplate

+ Actuator

## 模块

+ spring-boot-devtools
+ [Starters](https://qbgbook.gitbooks.io/spring-boot-reference-guide-zh/III.%20Using%20Spring%20Boot/13.5.%20Starters.html)

## ref

+ [Spring Boot参考指南](https://qbgbook.gitbooks.io/spring-boot-reference-guide-zh/)

+ [SPRING INITIALIZR](https://start.spring.io/)

+ [spring boot](https://github.com/ityouknow/spring-boot-examples)
+ [official spring boot](https://spring.io/projects/spring-boot)
+ [spring boot索引](http://springboot.fun/)

+ [Spring Boot 2 官方指导手册译文](https://www.jianshu.com/p/e7e3ff541bfb)
+ [Spring Boot 系列文章](http://www.ityouknow.com/spring-boot.html)
+ [Spring Boot简介](https://www.yiibai.com/spring-boot/)


+ [Thymeleaf 教程](https://waylau.gitbooks.io/thymeleaf-tutorial/content/)
+ [set config in standalone tomecat](https://stackoverflow.com/questions/43657626/server-session-timeout-in-application-yml-is-not-used-when-deployed-to-a-tomcat)
+ [YAML](https://www.jianshu.com/p/97222440cd08)
+ [TaskExecutor](https://docs.spring.io/spring/docs/4.2.x/spring-framework-reference/html/scheduling.html)


## todo

+ HandlerInterceptor
+ [embedded](https://docs.spring.io/spring-boot/docs/current/reference/html/howto-embedded-web-servers.html)
+ [Spring Boot and Embedded Servers - Tomcat, Jetty and Undertow](http://www.springboottutorial.com/spring-boot-with-embedded-servers-tomcat-jetty)
+ yml
+ embedded jar or war(standalone tomecat)
+ [后端传值](https://blog.csdn.net/bear_lam/article/details/80278590)