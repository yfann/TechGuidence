

## property来源
<!-- src/main/resources auto-detected -->
+ application.properites/application.yml
```
myapp.mail.enabled=true
myapp.mail.default-subject=test
```

+ 命令行设置
    + `java -jar app.jar --property="value"`
    + `java -Dproperty.name="value" -jar app.jar`system properties,在-jar之前设置

+ 环境文件
    + application-staging.properties
    + set a Spring profile with the same environment name.

+ 测试时spring 会在src/test/resources 下找
    + 也可以通过@TestPropertySource设置

+ environment variable
    + `export name=value`
    + treating them as properties

### @PropertySource加载property文件
+ 不能加载yaml
+ spring中会自动加载，一般不用指定property路径
+ 加载文件到IOC容器
```java
// 根据环境变量动态配置property source
@PropertySource({ 
  "classpath:persistence-${envTarget:mysql}.properties"
})

```

+ @PropertySources
```java
@PropertySources({
    @PropertySource("classpath:foo.properties"),
    @PropertySource("classpath:bar.properties")
})
```


## @ConfigurationProperties读取配置(Hierarchical properties)
```java
database.url=jdbc:postgresql:/localhost:5432/instance
database.username=foo
database.password=bar

@ConfigurationProperties(prefix = "database")
public class Database {
    String url;
    String username;
    String password;
 
    // standard getters and setters
    // 需要getter支持
}
```
+ 字段需要getter支持******************
+ relaxed binding
+ Meta-data support


+ ignoreUnknownFields
+ `@Validated`
    + 配合@Validated验证
    + @PostConstruct 自定义验证逻辑
+ Duration 类型支持
    + `myapp.mail.pause-between-mails=5s`(不写单位是毫秒)
```java
@DurationUnit(ChronoUnit.SECONDS)
private Duration pauseBetweenMails;
```

+ DataSize
    + `myapp.mail.max-attachment-size=1MB`

+ 自定义类型
    + 实现Converter接口

<!-- + 用@EnableConfigurationProperties激活
    + 内部使用了@Import(EnableConfigurationPropertiesImportSelector.class)
```java
@Configuration
@EnableConfigurationProperties(MailProperties.class)
class PropertiesConfig{
    ...
}
``` -->

## @ConditionalOnProperty
```java
@ConditionalOnProperty(prefix = "application.server", havingValue = "akamai")
@ConfigurationProperties(prefix="akamai", ignoreUnknownFields=true){
class AkamaiApplicationConfig implements SomeMarkerInterface{
private String host;
}

@ConditionalOnProperty(prefix = "application.server", havingValue = "local")
@ConfigurationProperties(prefix="local", ignoreUnknownFields=true){
class LocalApplicationConfig implements SomeMarkerInterface{
private String host;
}
```

## @Value读取配置
```java
@Value( "${jdbc.url:default value}" )
private String jdbcUrl;

```
+ SpEL evaluation support
+ 字段不需要setter



## Environment(Spring environment)读取property
```java
@Autowired
private Environment env;
...
dataSource.setUrl(env.getProperty("vcap.services.elephantsql-binding-c6c60.label"))
```

+ 遍历property source
```java
    @Autowired
    Environment env;

    public void someMethod() {
        ...
        Map<String, Object> map = new HashMap();
        for(Iterator it = ((AbstractEnvironment) env).getPropertySources().iterator(); it.hasNext(); ) {
            PropertySource propertySource = (PropertySource) it.next();
            if (propertySource instanceof MapPropertySource) {
                map.putAll(((MapPropertySource) propertySource).getSource());
            }
        }
        ...
    }
```

## system property(JRE system)
+  `-D<name>=<value>`  设置system property
  + `java -Djava.ext.dirs=lib MyClass`

+ `System.getProperty("config")`只能获取system property
+ `System.setProperty("net.jxta.tls.principal", "client");`



## ref
+ [@ConfigurationProperties 注解使用姿势，这一篇就够了](https://segmentfault.com/a/1190000020183307)
+ [Properties with Spring and Spring Boot](https://www.baeldung.com/properties-with-spring)