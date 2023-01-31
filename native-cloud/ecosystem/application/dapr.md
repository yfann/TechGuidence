# dapr(distributed application runtime

+ code 引入 dapr sdk
+ 应用程序运行所需分布式能力的实现
    + 通信、数据持久化、外部 binding，pub-sub
    + 比如服务调用需要有容错重试机制，比如一个数据持久化操作希望使用乐观锁，比如发布消息是要求有投递保证

+ dapr
    + API
        + application ----http/grpc API---> dapr
    + Building blocks(对外提供的能力)
        + service-to-service invocation
            + 服务发现
            + 通讯安全
            + 失败重试
            + 可观测
        + State management
            + 提供一致的键值对存储抽象
            + 并发
                + first-write-wins
                    + http etags实现
                + last-write-wins
                    + request更新没有带etags
            + 事务
            + 一致性(强一致性，最终一致性)
        + Publish and subbscribe
            + cloud events
        + Resource bindings
            + 对接外部输入输出
                + kafka
        + Actors
            + 一种并发编程的模型
        + Observabbility
        + Secrets
    + Components（提供各种分布式实现的对接
        + building block 可以组合使用任意的 components，一个 component 也可以被不同的 building block 使用
## dapr sidecar
+ instance
    + container
    + process

+ app<----Dapr API(http/gRPC)---->dapr

+ 主要提供NFR
    + APP可以专注于业务

## tips
+ 容器运行时
    + 就是容器运行起来需要的一系列程序和环境。比如如何使用 namespace 实现资源隔离，如何使用 cgroup 实现资源限制，这些都是容器运行时需要提供的实现

+ Multi Runtime
    + 剥离
        + code -> 依赖库 -> k8s -> sidecar
    + 一个业务运行时，和多个分布式能力运行时
+ lifecycle由k8s提供
+ networking,state,binding由dapr提供
+ 部署方式
    + 非k8s
        + dapr由独立的进程
    + k8s
        + sidecar
## ref
+ [dapr](https://dapr.io/)
+ [Dapr助力开发云原生应用](https://www.bilibili.com/video/BV1eG4y1s7sT/?spm_id_from=333.999.0.0&vd_source=d3c0a53193a65728ad278e633b3790e5)
+ [Dapr | 云原生的抽象与实现](https://segmentfault.com/a/1190000039863409)