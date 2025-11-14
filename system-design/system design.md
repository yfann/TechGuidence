

## books
+ DDIA
+ 凤凰架构
+ Patterns of Enterprise Application Architecture
+ Clean Architecture
+ 亿级流量网站架构核心技术
+ system design interview 
    + An insider's Guide
+ 微服务架构设计模式
+ Fundamentals of software architecture
+ Monolith to Microservices: Evolutionary Patterns to Transform Your Monolith
    + [从单体应用到微服务架构](https://wangwei1237.github.io/monolith-to-microservices/)
+ [Acing the System Design Interview](https://learning.oreilly.com/library/view/acing-the-system/9781633439108/OEBPS/Text/08.html#heading_id_3)


## collection
+ [system-design-101](https://zhuanlan.zhihu.com/p/665637912)
+ [system design](https://www.geeksforgeeks.org/what-is-system-design-learn-system-design/?ref=outind)
+ [system-design-primer](https://github.com/donnemartin/system-design-primer/blob/master/README-zh-Hans.md)
+ [系统设计面试：内幕指南](https://learning-guide.gitbook.io/system-design-interview)
+ [system-design-primer](https://github.com/donnemartin/system-design-primer/blob/master/README-zh-Hans.md#%E5%AD%A6%E4%B9%A0%E6%8C%87%E5%BC%95)
+ [深入高可用系统原理与设计](https://www.thebyte.com.cn/)
+ [Grokking System Design Interview](https://github.com/Jeevan-kumar-Raj/Grokking-System-Design)
+ [System Design Interview An Insider’s Guide by Alex Xu (z-lib.org).pdf](https://github.com/G33kzD3n/Catalogue/blob/master/System%20Design%20Interview%20An%20Insider%E2%80%99s%20Guide%20by%20Alex%20Xu%20(z-lib.org).pdf)



## log system
+ [设计一套完整的日志系统](https://juejin.cn/post/7028229305050071071)
<!-- book -->
+ [Logging in Action](https://learning.oreilly.com/library/view/logging-in-action/9781617298356/OEBPS/Text/03.htm#heading_id_3)
+ [I Heart Logs](https://learning.oreilly.com/library/view/i-heart-logs/9781491909379/ch02.html#idp195296)


## others
+ [系统设计入门](https://github.com/donnemartin/system-design-primer/blob/master/README-zh-Hans.md)
+ [设计数据密集型应用](http://ddia.vonng.com/#/)
+ [为什么这么设计系列文章](https://draveness.me/whys-the-design/)
+ [awesome](https://github.com/sindresorhus/awesome)
+ [存储](http://catkang.github.io/2017/12/17/data-placement.html)
+ Big data(Principles and best practices of scalable realtime data systems)
+ Foundations of scalable systems



## ref

+ [Everything I know about good system design](https://www.seangoedecke.com/good-system-design/)
    + ()[https://www.ruanyifeng.com/blog/2025/08/weekly-issue-362.html]
    + 程序设计是组装代码，系统设计是组装服务
    + 数据库可以做成一个写入节点和多个只读副本
    + 耗时的操作要拆分出来，放在后台作业（即系统外部的单独服务）
        + 后台作业主要分成两个组件：一个队列服务，一个作业运行器（从队列中获取任务并执行）
        + 队列任务的软件，可以用 Redis（需要尽快执行的任务），也可以用数据库（不着急的任务）
    + 如果数据的生成速度和读取速度不匹配，经典解决方案就是缓存。
    + 大型系统通常还有事件中心，一般用的是 Kafka
    + 数据需要传送到多处，有拉取（pull）和推送（push）两种选择
        + pull
            + 比较简单（比如大多数网站采用的轮询）
            + 向100万个客户端提供最新数据
                + 就要部署一堆（比如100台）快速的只读缓存服务器，处理所有读取流量
        + push
            + 节省资源
            + 向100万个客户端提供最新数据
                + 要把每次推送放入一个事件队列，并让一大群事件处理器从队列中拉取数据并推送