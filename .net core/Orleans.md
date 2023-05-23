# .net Orleans
+ 分布式编程框架
    + 构建可扩展、高可用和容错的应用
+ 针对云计算和边缘计算
+ Grains
    + 可独立部署和管理的小型角色
    + Grains之间相互通信和协作，使应用程序能够处理大规模的并发和负载
    + 可以动态添加和删除角色实例，以适应流量的变化
    + 容错机制：当节点恢复时，它可以自动恢复并重新分配Grain实例
    + 事件驱动编程模型: Grains之间发送和接收事件来实现松耦合通信
+ 灵活的插件模型

## ref
+ [Microsoft Orleans](https://learn.microsoft.com/zh-cn/dotnet/orleans/overview)