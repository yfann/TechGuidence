
## Eureka
+ 注册中心

## Feign
+ 通过动态代理访问其他微服务

## Ribbon
+ 负载均衡

## tips
+ Feign->Ribbon->Eureka

## Hystrix
+ 隔离，熔断，降级
    - 隔离：独立的线程池去请求不同的微服务
    - 熔断：一定时间内请求直接返回，不走真实服务
    - 降级：不能实现的操作记录log
+ 解决微服务中的雪崩问题(某个微服务挂掉之后导致其他微服务阻塞并挂掉)

## Zuul
+ 微服务网关
+ 网络路由

## ref
+ [一篇文章，让你看懂 Spring Cloud](https://juejin.im/post/5d778cd45188255457502d2e)
+ [史上最简单的 SpringCloud 教程](https://blog.csdn.net/forezp/article/details/70148833)
+ [一张图了解 Spring Cloud 微服务架构](https://zhuanlan.zhihu.com/p/85551214)
+ [zookeeper](https://segmentfault.com/a/1190000016349824)
+ [拜托！面试请不要再问我Spring Cloud底层原理](https://juejin.im/post/5be13b83f265da6116393fc7)