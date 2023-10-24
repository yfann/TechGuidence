
## dapr(distributed application runtime)
+ Dapr（分布式应用程序运行时）是一个开源的运行时框架，旨在简化和标准化构建分布式应用程序的开发过程。它提供了一组构建块和最佳实践，用于处理常见的分布式系统挑战，如状态管理、持久性、消息传递、服务调用和事件驱动等。

+ Dapr 的设计目标是使开发人员能够专注于业务逻辑，而不需要处理底层的分布式系统复杂性。它通过提供抽象的方式，使应用程序与底层分布式基础设施解耦，从而实现了应用程序的可移植性和可扩展性。

+ Dapr 是一个与编程语言和框架无关的运行时框架，它可以与现有的应用程序进行集成，并支持在云原生和混合云环境中部署。它提供了一个统一的分布式应用程序开发模型，简化了构建和管理分布式系统的复杂性。

+ 以下是 Dapr 的一些主要特点和功能：
    + 通信、数据持久化、外部 binding，pub-sub
    + 比如服务调用需要有容错重试机制，比如一个数据持久化操作希望使用乐观锁，比如发布消息是要求有投递保证
    + 状态管理：Dapr 提供了用于持久化和管理应用程序状态的 API 和组件。Dapr提供了分布式状态管理的功能，可以轻松地在微服务之间共享和管理状态。这有助于处理状态密集型应用程序的需求。

    + 消息传递：Dapr 支持通过消息传递模式实现应用程序之间的通信和解耦。

    + 服务调用：Dapr 提供了服务调用的抽象和工具，使应用程序能够轻松地进行服务间通信。

    + 事件驱动：Dapr 支持事件驱动的编程模型，以便应用程序可以接收和处理事件。

    + 数据持久性：Dapr 提供了用于处理数据持久性的组件，包括数据库、缓存和文件系统等。

    + 可观察性：Dapr 具有内置的监控和日志功能，以便开发人员可以更好地理解和调试应用程序的行为。

    + 多语言和多框架支持：Dapr 可以与多种编程语言和框架一起使用，如.NET、Java、Python等。

## dapr使用
+ code 引入 dapr sdk
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


## dpar run locally
+ `dapr run --app-id bindings-pythonapp python3 app.py --components-path ./components`
    + It invokes the underlying Dapr runtime and enables both the application and Dapr sidecar to run together.

## tips
+ 容器运行时
    + 就是容器运行起来需要的一系列程序和环境。比如如何使用 namespace 实现资源隔离，如何使用 cgroup 实现资源限制，这些都是容器运行时需要提供的实现

+ Multi Runtime
    + 剥离
        + code -> 依赖库 -> k8s -> sidecar
    + 一个业务运行时，和多个分布式能力运行时

+ lifecycle由k8s提供

+ networking,state,binding由dapr提供

+ dapr部署方式
    + 非k8s
        + dapr有独立的进程
    + k8s
        + sidecar


## ref
+ [dapr](https://docs.dapr.io/zh-hans/getting-started/quickstarts/)

+ [翻译 | 阿里巴巴的Dapr实践与探索](https://developer.aliyun.com/article/783616)

<!-- 云原生 -->
+ [Dapr助力开发云原生应用](https://www.bilibili.com/video/BV1eG4y1s7sT/?spm_id_from=333.999.0.0&vd_source=d3c0a53193a65728ad278e633b3790e5)
+ [Dapr | 云原生的抽象与实现](https://segmentfault.com/a/1190000039863409)