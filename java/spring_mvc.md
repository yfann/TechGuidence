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

## ref

+ [MVC framework](https://docs.spring.io/spring/docs/4.3.3.RELEASE/spring-framework-reference/htmlsingle/#mvc)
+ [spring boot参考指南](https://qbgbook.gitbooks.io/spring-boot-reference-guide-zh/IV.%20Spring%20Boot%20features/27.%20Developing%20web%20applications.html)