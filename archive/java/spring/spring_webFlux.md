
## tips
+ lterator(拉模式)
+ Reactive(发布订阅)推模式
+ backpressure
    - 订阅者反馈发布者消息生成过快
    - 订阅者通过request()来声明一次能处理的消息数量，然后发布者只发布相同数量的消息，直到下次request()

## ref
+ [Official Spring WebFlux](https://docs.spring.io/spring/docs/current/spring-framework-reference/web-reactive.html)
+ [webflux 学习之路](https://xwjie.github.io/webflux/webflux-study-path.html#lambda%E8%A1%A8%E8%BE%BE%E5%BC%8F%E4%B8%AD%E7%9A%84this)
+ [Spring WebFlux 的设计及工作原理剖析](https://learnku.com/articles/30263)
+ [Spring WebFlux 原理与适用场景](https://chinalhr.github.io/post/spring_webflux_principle/)
<!-- reactor -->
+ [Spring Reactor 入门与实践](https://www.jianshu.com/p/7ee89f70dfe5)
+ [Get Started with Reactive Programming in Spring](https://developer.okta.com/blog/2018/09/21/reactive-programming-with-spring)
+ [Reactor Mono和Flux 进行反应式编程详解](https://blog.csdn.net/ZYC88888/article/details/103679605)