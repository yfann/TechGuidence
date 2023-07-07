

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

## 内置锁（intrinsic lock）
+ 监视器锁（monitor lock）或对象锁（object lock）
+ Java中一种用于实现同步的机制。每个Java对象都有一个内置锁，它是与对象实例关联的。
+ 内置锁是通过synchronized关键字来获取和释放的
+ 每个Java对象都有一个与之相关联的锁标志（lock flag
    + 当一个线程获得了对象的监视器，它将锁标志设置为指示该锁已被占用。其他线程想要获得该对象的监视器时，会发现锁标志被设置，从而无法继续执行，只能等待直到锁标志被释放。

## 原子类（Atomic classes）
+ 这些类是线程安全的，可以在多线程环境下进行原子操作，而无需使用显式的锁或synchronized关键字
+ 原子类：
    + AtomicBoolean
    + AtomicInteger
    + AtomicLong
    + AtomicReference
        + 原子操作
            + get
            + set
            + compareAndSet
            + getAndSet

+ 原子类适用于需要保证原子性操作的场景，可以用于替代使用synchronized关键字或volatile修饰符的方式来实现线程安全。原子类的使用可以提高性能，避免了线程争用的开销，但需要注意合理使用，因为过多的原子操作也可能带来性能问题

+ 原子类实现
    + 内存可见性（Memory Visibility）
        + 原子类使用volatile关键字来确保对共享变量的修改对其他线程是可见的
    + 原子性操作（Atomic Operations）
        + 原子类使用底层的硬件支持或CAS（Compare and Swap）等算法来执行原子操作。
    + 自旋锁（Spin Locking）
        + 在原子类的实现中，自旋锁被广泛使用。自旋锁是一种忙等待的机制，当一个线程发现自己无法获得锁时，它会一直循环尝试获取锁，而不是被阻塞。这样可以避免线程切换带来的开销，提高了并发性能。




## 线程安全(Thread safety)
+ 一个方法、类或系统能够正确地处理多个线程的并发访问，而不会导致不确定的结果或数据不一致的问题
+ 线程安全特点
    + 原子性（Atomicity）
        + 操作是原子的，要么全部执行成功，要么全部不执行，不存在部分执行的情况
    + 可见性（Visibility）
        + 对共享数据的修改对其他线程是可见的，一个线程对共享数据的修改对其他线程是可见的。
    + 有序性（Ordering）
        + 操作的执行顺序按照程序的规定顺序执行，不会发生乱序执行的情况。
+ 实现线程安全的方法可以有多种方式：
    + 例如使用锁机制（如synchronized关键字、ReentrantLock等）
    + 使用原子类（如AtomicInteger、AtomicReference等）
    + 使用并发集合（如ConcurrentHashMap、ConcurrentLinkedQueue等）等。



## tips
+ 数据竞争(Data Race)
+ 竞态条件(Race condition)
+ volatile
    + 关键字会防止线程将变量缓存在寄存器或对其他线程不可见的地方，保证了多线程之间对变量的可见性
+ CAS
    + 是一种乐观锁策略，它通过比较内存中的值与期望值，然后根据比较结果来决定是否修改内存的值。CAS操作是原子的，保证了原子类方法的原子性。
    + CAS的ABA问题（CAS ABA Problem）
        + CAS操作可能存在ABA问题，即在执行CAS操作期间，变量的值从A变为B，然后再变回A。为了解决ABA问题，原子类中的一些实现使用了版本号或标记来跟踪变量的变化，以确保在执行CAS操作时检测到变量的值是否发生了变化。
+ 自旋锁（Spin lock）
    + 一种用于实现线程同步的锁机制，它在多线程环境中通过循环检查锁的状态来实现线程的等待和竞争。相比于传统的阻塞锁（如互斥锁），自旋锁避免了线程的上下文切换，从而减少了开销
    + 自旋锁的基本思想是，当一个线程尝试获取锁时，如果锁已被其他线程持有，该线程不会立即被阻塞，而是会循环等待，不断检查锁的状态，直到锁被释放。在等待期间，线程处于忙等待的状态，不会放弃CPU的使用权。
    + 适用于：
        + 锁被持有的时间非常短，等待的时间很短。
        + 线程竞争锁的概率较低。
        + 系统的负载较轻，CPU资源较为充足
    + 缺点：
        + 自旋锁不适用于长时间等待的情况，因为自旋锁会一直占用CPU资源，浪费了大量的处理器时间
    + 特点：
        + 消耗CPU时间，减少了上下文切换的开销

+ Java中的锁框架（Lock Framework）
    + SpinLock