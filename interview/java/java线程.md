

## 线程
+ Thread
    + run()
    + start()

+ Runable
    + run()
    + Thread thread = new Thread(runnable);

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

## 线程同步
+ synchronized
     + 它可以应用于方法或代码块，确保在同一时间只有一个线程可以执行被synchronized修饰的方法或代码块。
     + 对象监视器（monitor）和内置锁（intrinsic lock）
     + 当一个线程想要执行一个synchronized方法或代码块时，它首先必须获得该对象的内置锁。如果锁是可用的（没有其他线程持有该锁），线程将获得锁并继续执行方法或代码块。如果锁已经被其他线程持有，那么线程将被阻塞，直到锁被释放。当一个线程执行完synchronized方法或代码块后，它会释放持有的锁，这样其他线程才能够获得该锁并执行相应的方法或代码块。
     + synchronized关键字可以应用于不同级别的粒度:
        + 当它修饰一个实例方法时，它获取的是该实例对象的锁。
        + 当它修饰一个静态方法时，它获取的是该类的Class对象的锁。
        + 当它修饰一个代码块时，它获取的是括号内指定的对象的锁。

## HashMap vs HashTable vs ConcurrentHashMap

+ HashMap 非线程安全

+ HashTable
    + synchronized保证线程安全(只有一把锁)
    + 效率低下
        + 当一个线程put时，其他线程不能put和get

+ ConcurrentHashMap
    + 锁分段(Segment，Java5)
        + 数据分段存储,每段数据配一把锁
        + 浪费空间，GC效率低
    + synchronized+cas(java8)

## tips
+ 数据竞争