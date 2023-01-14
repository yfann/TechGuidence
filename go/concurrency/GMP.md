# GMP
+ G: goroutine
    + 新建的G   
        + 全局队列
        + P对应的队列
+ P: processor
    + GOMAXPROCS
    + 程序启动时创建
+ M: thread
    + 内核线程
    + 绑定P

## tips
+ Go Scheduler
+ 内核空间
    + thead
        + 协程调度器（M:N）
            + 对多个co-routine
+ 用户空间
    + co-routine->Goroutine
## ref
+ [深入分析Go1.18 GMP调度器底层原理](https://zhuanlan.zhihu.com/p/586236582)
+ [Golang深入理解GPM模型](https://www.bilibili.com/video/BV19r4y1w7Nx/?spm_id_from=333.337.search-card.all.click&vd_source=d3c0a53193a65728ad278e633b3790e5)
+ [Go的CSP并发模型实现：M, P, G](https://developer.aliyun.com/article/611313)