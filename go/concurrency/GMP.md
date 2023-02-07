# GMP
+ G: goroutine
    + 新建的G   
        + 全局队列
        + P对应的队列
    + 并行G的数量等于P的数量

+ P: processor
    + Go Scheduler
    + GOMAXPROCS
    + 程序启动时创建
    + work-stealing
        + 本地队列为空的P可以尝试从其他P本地队列偷取一半的G补充到自身队列

+ M: machine
    + 内核线程
    + 绑定P,才能调度G
    + M调度G时，优先取P本地队列，其次取全局队列，最后取wait队列；这样的好处是，取本地队列时，可以接近于无锁化，减少全局锁竞争

## tips
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
+ [gmp](https://www.zhihu.com/question/447947474/answer/2844538509)
+ [[Golang三关-典藏版] Golang 调度器 GMP 原理与调度全分析](https://learnku.com/articles/41728)