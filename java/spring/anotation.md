
## basic
+ `@Service("videoB")` 设置名称
+ `@Qualifier("videoB")` 注入名称
+ `@NoRepositoryBean`
+ `@Primary` 优先被注入
+ `@ConfigurationProperties`

## instance
+ `@Bean`
    - Spring只调用一次产生Bean的方法,Bean对象交给IOC管理
    - 类似xml创建，id为方法名
    ```xml
    <beans>
        <bean id="transferService" class="com.acme.TransferServiceImpl"/>
    </beans>
    ```     
    - 可在`@Configuration` `@Component`中使用
    - `@Bean(initMethod = "init")`
    - `@Bean(name = "myFoo")`
    - 
+ `@Conditional` 可根据条件创建bean
+ `@Scope`
    - 默认注入bean是Singleton
    - `@Scope("prototype")` 每次注入都会创建新的bean
    - `@Scope("request")` 每个http request创建个Bean instance
    - Singleton,Prototype,Request,Session,Global Session
+ `@Resource`
    - `@Resource(name="consolePrint")`指定bean名称注入
+ `@Primary` 多个bean满足注入条件时，有这个注解的优先
    - 影响`@Autowired`的选择

## 依赖注入
+ `@ComponentScan` 搜索beans
    - main放在最顶层rootpackage
+ `@Autowired`
    - 注入集合时，找到所有该类型的bean的集合再注入
    - `@Autowired(required = false)` 允许注入null
    - 属性名即为注入的bean名
    ```java
    //注入 bean name=logPrint的bean
    @Autowired
    private IPrint logPrint;
    ```
## config
+ `@SpringBootApplication`包含下面三种注解,在main类上
    - `@Configuration`
    - `@EnableAutoConfiguration`
    - `@ComponentScan`
+ `@Configuration`
    - `@Import` 导入其他配置类
    - `@ImportResource`导入XML配置
+ `@Component`
    - `@Component("bean name")`
+ `@ComponentScan` 搜集所有Spring组件
+ `@EnableAutoConfiguration`
    - 自动配置
    - 添加在`@Configuration`类上
    - 只加一个`@EnableAutoConfiguration`在primary @Configuration上
    - 例如项目中用了HSQLDB，但没有配置连接信息,自动配置会配置一个in-memory数据库
    - 运行时--debug，核心日志开启debug级别,可以查看应用启动了哪些自动配置
    - exclude(excludeName) 排除一些自动配置
    ```java
    @Configuration
    @EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
    public class MyConfiguration {
    }
    ```

## sping cache

+ `@Cacheable`
+ `@CachePut`
+ `@CacheEvict`
+ [spirng cache](https://my.oschina.net/u/3452433/blog/1831026)

## Lombok

+ `@NoArgsConstructor` 生成无参构造
+ `@AllArgsContructor`
+ `@RequiredArgsConstructor`

## ref
+ [@transactional](https://www.ibm.com/developerworks/cn/java/j-master-spring-transactional-use/index.html)
+ [@Retryable](https://chinalhr.github.io/tags/java_springboot_component1/)
+ [Spring Boot轻松理解动态注入，删除bean](https://www.jianshu.com/p/916800fdd52d)
+ [@ConditionalOn](https://zhuanlan.zhihu.com/p/78251301)
+ [@ConfigurationProperties](https://juejin.im/post/6844903901607493646)