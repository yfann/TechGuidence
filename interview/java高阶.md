
## 并发 

+ 锁
    + 乐观锁
        + 不加锁执行操作
        + 自旋
        + cas
    + 悲观锁
        + synchronized
    + ReentranLock(可重入锁)

+ cas(compare and swap)
    + 原始值和内存值比较
        + 不等
            + return false
        + 相等
            + return true
            + 内存值改为修改值
    + 乐观锁
    + ABA问题


## 多线程

+ JMM(java 内存模型)
    + 每个线程有各自的工作内存
    + 主内存

+ synchronized vs volatile
    + volatile
        + 保证可见性
        + 写不是原子操作

+ sleep() vs wait()
    + sleep()不会释放资源锁

+ 原子类


## IO

+ 应用发起I/O调用（user space没有权限访问I/O）
    + 内核等待I/O设备准备数据
    + 内核将数据从内核空间拷贝到用户空间

+ 同步非阻塞IO模型
    + 轮询,应用一直发起read调用

+ I/O多路复用
    + 线程发起select调用
        + 数据是否ready
    + 数据好了，再发起read调用
        + 数据 内核空间->用户空间
            + read调用是阻塞的



+ BIO(Blocking I/O)

+ NIO(Non-blocking I/O)
    + selector(多路复用器)
        + 一个线程管理多个客户端连接

+ AIO(Asynchronous I/O)
    + NIO 2
    + 基于事件和回调
    + 操作后直接返回,处理完成后,操作系统会通知相应的线程进行后续操作

## ref

+ [IO模型](https://github.com/Snailclimb/JavaGuide/blob/master/docs/java/basis/IO%E6%A8%A1%E5%9E%8B.md)
+ [Java并发编程（总结最全面的面试题！！！）](https://juejin.cn/post/6844904125755293710#heading-11)

+ [Java并发编程之原子类](https://juejin.cn/post/6844903683268804622)

+ [并发-CAS原则](https://www.jianshu.com/p/586c2d0e45fc)
+ [Java中synchronized和volatile的区别](https://zhuanlan.zhihu.com/p/61966479)
+ [Java中sleep()与wait()区别](https://blog.csdn.net/u012050154/article/details/50903326)
+ [synchronized和lock的区别](https://juejin.cn/post/6844903542440869896)