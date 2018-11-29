
## cli

+ `mvn spring-boot:run`

+ `java -jar -Dspring.config.location=**.properties <JARFILE> --server.port=8080`

+ `java -jar  <JARFILE> --spring.profiles.active=dev`

+ `java -jar -Dspring.profiles.active=prod <*.jar>`

+ `java –jar demo.jar --debug` application.properties中debug = true


## 注解

+ `@ComponentScan` 查找 @bean,注入@Autowired

+ `@EnableAutoConfiguration`

+ `@SpringBootApplication`

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



## tips

+ runner /*实现ApplicationRunner或CommandLineRunner，启动后立即执行一些代码*/

+ 拦截器 @Component + HandlerInterceptor

+ 过滤器 @Component + Filter

+ application.properties 属性文件,可配置端口(或YAML文件配置) active

+ RestTemplate

+ Actuator

## todo

+ HandlerInterceptor
+ [embedded](https://docs.spring.io/spring-boot/docs/current/reference/html/howto-embedded-web-servers.html)
+ [Spring Boot and Embedded Servers - Tomcat, Jetty and Undertow](http://www.springboottutorial.com/spring-boot-with-embedded-servers-tomcat-jetty)
+ yml
+ embedded jar or war(standalone tomecat)
+ [后端传值](https://blog.csdn.net/bear_lam/article/details/80278590)

## ref

+ [SPRING INITIALIZR](https://start.spring.io/)
+ [spring boot](https://github.com/ityouknow/spring-boot-examples)
+ [official spring boot](https://spring.io/projects/spring-boot)
+ [spring boot索引](http://springboot.fun/)
+ [Spring Boot Tutorial](https://www.tutorialspoint.com/spring_boot/index.htm)
+ [纯洁的微笑](http://www.ityouknow.com/spring-boot.html)
+ [Spring boot参考指南](https://www.jianshu.com/p/67a0e41dfe05)
+ [Spring Boot 2 官方指导手册译文](https://www.jianshu.com/p/e7e3ff541bfb)

+ [Spring Boot 数据库迁移](http://412887952-qq-com.iteye.com/blog/2425506)
+ [Spring Boot简介](https://www.yiibai.com/spring-boot/)
+ [Thymeleaf 教程](https://waylau.gitbooks.io/thymeleaf-tutorial/content/)
+ [set config in standalone tomecat](https://stackoverflow.com/questions/43657626/server-session-timeout-in-application-yml-is-not-used-when-deployed-to-a-tomcat)
+ [YAML](https://www.jianshu.com/p/97222440cd08)
