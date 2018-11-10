
## cli

+ `mvn spring-boot:run`

+ `java -jar -Dspring.config.location=**.properties <JARFILE> --server.port=8080`

+ `java -jar  <JARFILE> --spring.profiles.active=dev`

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