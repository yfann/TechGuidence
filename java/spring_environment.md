## Environment

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

## profile

+ 配置是一个被命名的，bean定义的逻辑组，这些bean只有在给定的profile配置激活时才会注册到容器。
+ `spring.profiles.active`激活
    - `-Dspring.profiles.active="profile1,profile2"`启动参数使用
    - `spring.profiles.active=dev,hsqldb`application.properties中使用
    - 或配置在系统变量、JVM系统属性、web.xml中
+ 代码active
```java
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
ctx.getEnvironment().setActiveProfiles("dev");
ctx.register(SomeConfig.class, StandaloneDataConfig.class, JndiDataConfig.class);
ctx.refresh();

//SpringApplication.setAdditionalProfiles(…)
```
+ `@Profile` 根据active注册组件

```java
@Configuration
@Profile("dev")
public class StandaloneDataConfig {

    @Bean
    public DataSource dataSource() {
        return new EmbeddedDatabaseBuilder()
            .setType(EmbeddedDatabaseType.HSQL)
            .addScript("classpath:com/bank/config/sql/schema.sql")
            .addScript("classpath:com/bank/config/sql/test-data.sql")
            .build();
    }
}

@Configuration
@Profile("production")
public class JndiDataConfig {

    @Bean(destroyMethod="")
    public DataSource dataSource() throws Exception {
        Context ctx = new InitialContext();
        return (DataSource) ctx.lookup("java:comp/env/jdbc/datasource");
    }
}
```
+ `@ConfigurationProperties`可以引入文件


## property

+ spring方便的访问property属性，包含系统属性，环境变量和自定义的。spring使用PropertySources 来管理不同的PropertySource.
```java
ApplicationContext ctx = new GenericApplicationContext();
Environment env = ctx.getEnvironment();
boolean containsFoo = env.containsProperty("foo");
System.out.println("Does my environment contain the 'foo' property? " + containsFoo);

MutablePropertySources sources = context.getEnvironment().getPropertySources();
sources.addFirst(new MypropertySource());
```
+ PropertySource
    - JVM系统properties(System.getProperties())
    - 系统环境变量System.getEnv()

+ `@PropertySource`用于增加一个PropertySource到Spring的环境中
```java
// file app.properties
// testbean.name=myTestBean

@Configuration
@PropertySource("classpath:/com/myco/app.properties")
public class AppConfig {
    @Autowired
    Environment env;

    @Bean
    public TestBean testBean() {
        TestBean testBean = new TestBean();
        testBean.setName(env.getProperty("testbean.name"));
        return testBean;
    }
}
```
+ `-Dtest=test`启动时传property
+ 代码加property
```java
    String key = "test";
    String value = "test";
    Properties pp = System.getProperties();
    pp.put(key, value);
```
+ `@PropertySource`
