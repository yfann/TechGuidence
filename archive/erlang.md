# Erlang
+ Actor 并发模型：单独进程 + 隔离 + 消息传递
    + Actor = 一个独立的小进程（或实体），只通过消息通信，不共享内存。
    + 一个 actor 收到消息后可以执行 3 件事情：
        + 发送消息给其他 actors（包括自己）
        + 创建新的 actors
        + 改变自己的内部状态
    + 无锁高并发（No Locks
+ 分布式透明性：节点之间发送消息和本地一样
+ 原生容错机制：Let it crash + 监督树（Supervision Tree）
    + 每个服务都有supervisor监督
    + worker 崩了 supervisor 会 自动重启
    + 服务以 树状结构 组织（OTP supervision tree）
    + 监督树（supervision tree
        + 根 supervisor 崩溃 → 应用被关闭（但不影响整个 VM
    + “逐级崩溃，逐级恢复”

+ Erlang在BEAM VM上运行
    + 抢占式调度
    + GC是per-process,不是全局STW(stop-the-world)

+ 原生热更新（Hot Code Upgrade）

## ref
+ [awesome-erlang-cn](https://github.com/hstcscolor/awesome-erlang-cn?tab=readme-ov-file)
+ [Erlang](https://learnyousomeerlang.com/content)