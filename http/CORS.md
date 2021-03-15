
## process

+ A Site 页面 request(header:{Origin:"..."}) ---->b site server
+ b site server response(header:{Access-Control-Allow-Credentials:true,Access-Control-Allow-Origin:"..."})
    + Access-Control-Allow-Origin 如果和 Origin不一致则浏览器会驳回请求
+ server 端设置header('Access-Control-Allow-Origin:*')则任何域名都能访问你的服务器

## tips
+ 同源(协议，域名，端口相同)
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

## solution
+ document.domain
    + 同主域名下的不同子域名
    + 需要iframe提供页面互操作

+ src
    + src都可跨域，只能GET
    + img 更改src时就发请求
    + script,iframe,link[rel=stylesheet] 添加到DOM树后才发请求

+ JSONP
    + <script> 跨域脚本回调

+ CORS

## ref
+ [跨域资源共享 CORS 详解](https://www.ruanyifeng.com/blog/2016/04/cors.html)
+ [Web开发中跨域的几种解决方案](https://harttle.land/2015/10/10/cross-origin.html)


+ [从原理分析CORS——我们到底是怎么跨域的](https://segmentfault.com/a/1190000007078606)


+ [Spring MVC 实现 CORS 跨域](https://www.jianshu.com/p/9203e9b14465)
+ [SpringMVC跨域问题排查以及源码实现](https://www.cnblogs.com/wxw16/p/10674539.html)
+ [SpringBoot--实战开发--处理OPTIONS请求](https://www.jianshu.com/p/1bb4aa97e9d4)