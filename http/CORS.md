
## tips
+ spring boot加`@CrossOrigin(allowCredentials="true",maxAge = 3600)`
+ localhost 前必须加`http://`
+ cors简单和非简单请求
    - 当添加自定义头时触发非简单请求
        + 非简单请求会先preflight(预检) 
        + 服务端要对options请求做处理
+ `xhr.withCredentials = true;` 这种条件下 `orgin:*` 无效,必须指定具体值


## issues
+ `Response to preflight request doesn't pass access control check: It does not have HTTP ok status`
    - 英文服务端对options请求没做处理

## Todo

+ 阿里云中cors的处理

## ref
+ [跨域资源共享 CORS 详解](https://www.ruanyifeng.com/blog/2016/04/cors.html)
+ [从原理分析CORS——我们到底是怎么跨域的](https://segmentfault.com/a/1190000007078606)
+ [Spring MVC 实现 CORS 跨域](https://www.jianshu.com/p/9203e9b14465)
+ [SpringMVC跨域问题排查以及源码实现](https://www.cnblogs.com/wxw16/p/10674539.html)
+ [SpringBoot--实战开发--处理OPTIONS请求](https://www.jianshu.com/p/1bb4aa97e9d4)