

# python 并发

+ 并发编程通信
    + 共享状态
        + mutex
    + 消息传递
        + actor model

## 并发工具
+ threading
+ mutliprocess
    + 创建多个进程，避免GIL
+ parallel python
+ celery

## tips
+ GIL（Global Interpreter Lock，全局解释器锁）
    + 它保证同一时间只有一个线程可以执行 Python 代码（即使在多核 CPU 上
    + 只影响线程不影响进程
    + 遇到IO时，GIL会释放
    + CPU密集操作时，多线程几乎串行处理



## ref
+ [python并发编程-中文版](https://hellowac.github.io/parallel-programming-with-python-zh/chapter7/)