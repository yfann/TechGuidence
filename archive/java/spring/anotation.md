
## basic
+ `@Service("videoB")` 设置名称
+ `@Qualifier("videoB")` 注入名称
+ `@NoRepositoryBean`
+ `@Primary` 优先被注入
+ `@ConfigurationProperties`

## instance
+ `@Conditional` 可根据条件创建bean
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

## @Bean
+ 类似xml创建，id为方法名
    + @bean 等价于`<Bean></Bean>`
```xml
<beans>
    <bean id="transferService" class="com.acme.TransferServiceImpl"/>
</beans>
```   
+ 注册bean到Spring容器中
+ 加在method上
    + 告诉spring返回一个对象，对象注册为Spring应用上下文中的bean
    + 方法中订阅量创建bean的方式
    + Spring只调用一次产生Bean的方法,Bean对象交给IOC管理  
+ 可在`@Configuration` `@Component`中使用
+ `@Bean(initMethod = "init")`
+ `@Bean(name = "myFoo")`
+ `@Scope`
    + bean的作用域
    + 默认注入bean是Singleton
    + `@Scope("prototype")` 每次注入都会创建新的bean
    + `@Scope("request")` 每个http request创建个Bean instance
    + Singleton,Prototype,Request,Session,Global Session

   
## @Component
+ 等价于`<Beans></Beans>`
+ 加在class上
    + 类为组件类，spring要为这个class创建bean
+ 注册bean到Spring容器中
+ @Component（@Controller、@Service、@Repository）通常是通过类路径扫描来自动侦测以及自动装配到Spring容器中。
+ `@Component("bean name")`
+ ComponentScan 搜集所有Spring组件

## @ComponentScan
+ `<context:component-scan base-package=”com.dxz.demo”/>` 

## @Configuration
+ 加在class上
    + 该class相当于xml中的`<beans>`
+ `@Import` 导入其他配置类
+ `@ImportResource`导入XML配置
+


## ref
+ [@transactional](https://www.ibm.com/developerworks/cn/java/j-master-spring-transactional-use/index.html)
+ [@Retryable](https://chinalhr.github.io/tags/java_springboot_component1/)
+ [Spring Boot轻松理解动态注入，删除bean](https://www.jianshu.com/p/916800fdd52d)
+ [@ConditionalOn](https://zhuanlan.zhihu.com/p/78251301)
+ [@ConfigurationProperties](https://segmentfault.com/a/1190000020183307)