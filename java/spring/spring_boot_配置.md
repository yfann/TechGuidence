
## externalize(外部化配置)
+ properties
+ YAML
+ 环境变量
+ 命令行参数
+ `@Value`
+ `@ConfigurationProperties`
    - `ConversionService`

+ `@TestPropertySource`
+ 命令行传递属性`java -jar app.jar --name="Spring"`
+ shell传递属性`SPRING_APPLICATION_JSON='{"foo":{"bar":"spam"}}'`
+ `spring.profiles.active=dev,hsqldb` 设置环境
    - @Profile("production") 只在特定环境生效，可以加在@Compnent或@Configuration
    - `spring.profiles: prod`
    - `spring.profiles.include: proddb,prodmq`
## 日志
+ `java -jar myapp.jar --debug`
+ `debug=true` 配置
+ `trace=true`
+ `logging.file`
+ `logging.path`
+ `logging.level`
```yaml
logging.level.root=WARN
logging.level.org.springframework.web=DEBUG
logging.level.org.hibernate=ERROR
```
## tips
+ spring-boot-dependencies
    + spring-boot-starter-parent
    ```yaml
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.1.1.RELEASE</version>
    </parent>
   ```
+ `mvn dependency:tree`查看依赖
+ `my.secret=${random.value}` 注入随机值
+ `--server.port=9000`命令行参数
    - 转化为Spring Environment
+ `application-{profile}.properties`
    - `spring.profiles.active`
    - multi-rpofile
    ```yaml
    spring:
        profiles: default
    ```
+ 属性占位符
```yml
app.name=MyApp
app.description=${app.name} is a Spring Boot application
```

+ `@PropertySource`不能加载YAML

## ref
+ [spring-boot-starter-parent](https://www.jianshu.com/p/628acadbe3d8)
+ [spring-boot-devtools](http://blog.didispace.com/books/spring-boot-reference/III.%20Using%20Spring%20Boot/20.1%20Property%20defaults.html)
+ [Log Levels](https://docs.spring.io/spring-boot/docs/1.4.1.RELEASE/reference/htmlsingle/#boot-features-custom-log-levels)
+ [@ConfigurationProperties](https://docs.spring.io/spring-boot/docs/1.4.1.RELEASE/reference/htmlsingle/#boot-features-external-config-typesafe-configuration-properties)