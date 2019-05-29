
## url

+ 绝对路径`<a th:href="@{http://www.thymeleaf/documentation.html}">`
+ context relative url(relative to the application root)
```html
<!-- in war package {host}/{application context}/{context relative url} -->
<!-- base url:http://localhost:8080/myapp
'myapp' is application context  -->
<a th:href="@{/order/list}">
<!-- out put -->
<a href="/myapp/order/list">
```
+ server relative url
```html
<a th:href="@{~/billing-app/showDetails.htm}">
<!-- base url:http://localhost:8080/myapp -->
<!-- out put -->
<a href="/billing-app/showDetails.htm">
```

+ protocol relative url(链接使用与当前页相同的协议http或https)
```html
<script th:src="@{//scriptserver.example.net/myscript.js}">...</script>
<!-- out put -->
<script src="//scriptserver.example.net/myscript.js">...</script>
```

+ parameter
```html
<a th:href="@{/order/details(id=3)}">
<!-- out put -->
<a href="/order/details?id=3">

<a th:href="@{/order/{id}/details(id=3,action='show_all')}">
<!-- out put -->
<a href="/order/3/details?action=show_all">

<a th:href="@{/home#all_info(action='show')}">
<!-- out put -->
<a href="/home?action=show#all_info">


<a th:href="@{/order/details(id=${order.id})}">
```

## tips

+ Thymeleaf的模板放在(src/main/resources/templates/)下,maven source(src/main/resources)+模板路径(/templates)
+ 静态资源(js,css,image)放在(src/main/resources/static/)下
+ `spring.thymeleaf.prefix = classpath:/templates/`可更改路径
+ 动态传值
```java
@Component
public class ViewUtil {
    @Resource
    private Environment env;


    @Resource
    private void configureThymeleafStaticVars(ThymeleafViewResolver viewResolver) {
        if (viewResolver != null) {
            Map<String, Object> vars = new HashMap();
            vars.put("baseUrl", env.getProperty("baseUrl"));
            viewResolver.setStaticVariables(vars);
        }

    }
}

//const global_base_url = '[(${baseUrl})]';
```

+ 静态资源访问
```java
//spring.mvc.static-path-pattern=/mystatic/*
//spring.resources.static-locations= classpath:mystatic/
//resources/mystatic/static.html
//localhost:8080/mystatic/static.html

//静态资源默认查找顺序，可通过spring.resources.static-locations改写
// {maven source}/META-INF/resources/
// {maven source}/resources/
// {maven source}/static/
// {maven source}/public/
```

## ref

+ [深入学习spring-boot系列（三）--使用thymeleaf模板](https://jisonami.iteye.com/blog/2301387)
+ [Spring Boot(四)：Thymeleaf 使用详解](https://www.cnblogs.com/ityouknow/p/5833560.html)
+ [Thymeleaf 教程](https://waylau.gitbooks.io/thymeleaf-tutorial/content/)
+ [Thymeleaf前端传值](https://blog.csdn.net/bear_lam/article/details/80278590)
+ [Thymeleaf url syntax](https://www.thymeleaf.org/doc/articles/standardurlsyntax.html)