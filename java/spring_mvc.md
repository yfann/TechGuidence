## MVC

+ spring-boot-starter-web
+ Tomcat,Jetty,Undertow
<!-- MVC -->
+ `@ResponseBody` 加上后返回值作为数据返回，不加则返回值作为页面名称
+ `@RestController` = `@Controller` + `@ResponseBody`
+ `@RequestMapping` `@RequestBody` `@PathVariable` `@RequestParam`

+ HttpMessageConverter 转换http请求和响应
```java
//Jackson 对象转JSON
//Jackson XML 对象转XML
@Configuration
public class MyConfiguration {
    @Bean
    public HttpMessageConverters customConverters() {
        HttpMessageConverter<?> additional = ...
        HttpMessageConverter<?> another = ...
        return new HttpMessageConverters(additional, another);
    }
}
```

+ `@JsonComponent`将自定义的序列化器注册为Sping Bean
+ MessageCodesResolver渲染错误
+ WebBindingInitializer为每个特殊的请求初始化相应的WebDataBinder,ConfigurableWebBindingInitializer用于自定义
+ `src/main/resources/templates` 模板路径

## 静态资源

+ classpath下的/static（/public，/resources或/META-INF/resources）文件夹，或从ServletContext根目录提供静态内容
    - 这是通过ResourceHttpRequestHandler实现的，可以自定义WebMvcConfigurerAdapter并覆写addResourceHandlers来改变该行为（加载静态文件）。
+ spring.resources.staticLocations 可以设置静态资源位置
+ Webjars 任何在/webjars/**路径下的资源都将从jar文件中提供
+ `src/main/webapp`路径仅在war下起作用,jar会忽略改路径
+ Spring Boot也支持Spring MVC提供的高级资源处理特性，可用于清除缓存的静态资源或对WebJar使用版本无感知的URLs(version agnostic)。
>如果想使用针对WebJars版本无感知的URLs（version agnostic），只需要添加webjars-locator依赖，然后声明你的Webjar。以jQuery为例，?>"/webjars/jquery/dist/jquery.min.js"实际为"/webjars/jquery/x.y.z/dist/jquery.min.js"，x.y.z为Webjar的版本。
+ `spring.resources.chain.strategy.content.enabled=true` `spring.resources.chain.strategy.content.paths=/**`清缓存方案
```java
//将hash添加到了URL中
//ResourceUrlEncodingFilter 作用
//Thymeleaf,Velocity,FreeMarker会自动配置
<link href="/css/spring-2a2d595e6ed9a0b24f027f2b63b134d6.css"/>
```

## 安全

+ 添加Spring Security依赖，web引用会对所以的Http路径使用basic认证
+ `@EnableGlobalMethodSecurity`应用方法级别保护
+ `AuthenticationManager`,`SecurityProperties.User`
+ OAuth2
    - `spring-security-oauth2`添加依赖
    - `@EnableAuthorizationServer`创建授权服务器,提供access token,/token端点basic形式的认证证书是`security.oauth2.client.client-id`和`security.oauth2.client.client-secret`，用户证书通常是Spring Security的user详情（Spring Boot中默认是"user"和一个随机的密码）。`AuthorizationServerConfigurer`自定义授权服务器特性。
    - `@EnableResourceServer`创建资源服务器(可以和授权服务器同一个),使用access token。如果应用也是授权服务器，不需要配置解码token。如何使独立服务需要配置`security.oauth2.resource.user-info-uri` 用于/me资源或`security.oauth2.resource.token-info-uri`用于token解码
+ Bearer默认token类型
+ 设置user-info-uri后，OAuth2RestTemplate用于抓取用户信息

## ref

+ [MVC framework](https://docs.spring.io/spring/docs/4.3.3.RELEASE/spring-framework-reference/htmlsingle/#mvc)
+ [spring boot参考指南](https://qbgbook.gitbooks.io/spring-boot-reference-guide-zh/IV.%20Spring%20Boot%20features/27.%20Developing%20web%20applications.html)
+ [OAuth 2 Developers Guide](http://projects.spring.io/spring-security-oauth/docs/oauth2.html)
+ [JWT](http://www.ruanyifeng.com/blog/2018/07/json_web_token-tutorial.html)

+ [java-springmvc4-几种获取 HttpServletRequest 对象的方式](https://blog.csdn.net/xxj_jing/article/details/70754428)
+ [SpringMVC的生命周期](https://blog.csdn.net/WuLex/article/details/77649944)
+ [深入理解SpringMVC原理及源码解析](https://zhuanlan.zhihu.com/p/39607030)
+ [由DispatcherServlet看spring mvc请求处理过程](https://segmentfault.com/a/1190000008471934)
+ [doDispatch请求分发流程源码分析](https://blog.csdn.net/shanchahua123456/article/details/87541241)
+ [Spring MVC 原理 - DispatcherServlet调用完整过程](https://blog.csdn.net/qq_33314107/article/details/79121809?utm_source=distribute.pc_relevant.none-task)
+ [Spring MVC Servlet 生命周期、工作原理](https://blog.csdn.net/yelllowcong/article/details/78510083)
+ [SpringMVC 方法顺序](https://www.jianshu.com/p/8a20c547e245)
+ [Servlet Filter和Spring mvc Interceptor](https://www.jianshu.com/p/685c65ed6944)