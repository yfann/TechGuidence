
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
        + 保证可见性（各个线程的工作内存值相同）
        + 写不是原子操作

+ sleep() vs wait()
    + sleep()不会释放资源锁

+ 原子类




## JVM


+ 调优

+ 类加载机制
    + ClassLoader

## ref


+ [Java并发编程（总结最全面的面试题！！！）](https://juejin.cn/post/6844904125755293710#heading-11)
+ [并发编程面试题](https://thinkwon.blog.csdn.net/article/details/104863992)

+ [Java并发编程之原子类](https://juejin.cn/post/6844903683268804622)


+ [Java中synchronized和volatile的区别](https://zhuanlan.zhihu.com/p/61966479)
+ [Java中sleep()与wait()区别](https://blog.csdn.net/u012050154/article/details/50903326)
+ [synchronized和lock的区别](https://juejin.cn/post/6844903542440869896)
+ [Java虚拟机(JVM)面试题](https://blog.csdn.net/ThinkWon/article/details/104390752)