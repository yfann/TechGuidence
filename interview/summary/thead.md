
## mutex
+ 互斥锁，Mutual Exclusion
    + 是一种并发控制原语，用于在多线程或多进程环境中，保证同一时间只有一个执行单元访问某个共享资源，从而避免竞态条件（race condition）
+ lock/unlock/try_lock
```md
lock
  访问共享资源
unlock
```
+ 原理
    + 原子指令(在并发环境下，一个操作要么完整执行，要么完全不执行，中途绝不会被其他线程或 CPU 核心观察到“半完成状态”的 CPU 指令)
        + CAS
    + 内存屏障（Memory Barrier）
        + 写入不会被乱序
            + lock 之前的读写不能跑到 lock 后面
            + unlock 之后的读写不能跑到 unlock 前面
        + 其他 CPU 能“看到”最新值
    + 自旋阶段：用户态忙等（Spin）
        + 现代 Mutex（Linux / Rust / Java）不会一直自旋
            + 短暂自旋（fast path）
                + 尝试 CAS → 成功：直接进入临界区
            + 阻塞（slow path）
                + 仍失败 → 进入内核 → 挂起线程
    ```c
    while (!CAS(lock, 0, 1)) {
        ; // 自旋
    }
    ```
+ 关键区（Critical Section）
    + 在并发程序中，访问或修改共享资源的一段代码，这段代码在同一时刻只允许一个执行单元进入。
    ```c
    // 共享变量
    int count = 0;

    void increment() {
        count++;   // 这是关键区
    }
    //count++ 不是原子操作，因此属于关键区。
    ```