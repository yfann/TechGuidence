# rust async/await
+ Future + 状态机
    + async 返回Future,表示未来会运行
    + await可以执行Future,拿到结果
    + async fn 在编译时会被编译成一个 状态机，实现了 Future trait
    + poll 方法被运行时（例如 Tokio）不断调用，直到返回 Poll::Ready(val)，表示结果完成。
    + Rust 的异步不是抢占式线程，而是 协作式任务。
        + 抢占式：线程切换
        + 协作
            + .await时主动让出控制权
            + 
```rust
async fn say_hello() -> String {
    "Hello from async!".to_string()
}

#[tokio::main]  // 提供 async 运行时
async fn main() {
    let msg = say_hello().await;  // 等待 Future 完成
    println!("{}", msg);
}
```

+ poll
    + Future是个状态机
    + poll：就是运行时用来 驱动 Future 前进一步 的方法。
    + 执行poll
        + 第一次创建Future
            + Ready
                + 直接返回结果
            + Pending
                + Future没好时Pending
                    + IO操作
                    + 定时器
                + 并把一个 Waker 注册到运行时，然后挂起任务
                    + I/O 完成后，操作系统（epoll/kqueue/io_uring）会通知运行时
                    + 运行时用 Waker 把 Future 放回任务队列，再次调用 poll
                    + 直到返回 Ready，任务才算真正完成。

```rust
pub trait Future {
    type Output;
    fn poll(
        self: Pin<&mut Self>, 
        cx: &mut Context<'_>
    ) -> Poll<Self::Output>;
}

enum Poll<T> {
    Ready(T),   // 任务完成，返回结果
    Pending,    // 任务没完成，需要等一等
}

```

+ task queue / ready queue
    + 在Tokio/async-std 这样的异步运行时中
    + 存放 可以继续执行的 Future
        + 运行时会不断从队列里取任务 → 调用它的 poll 方法
    + 如果 Future 还没准备好 → 它返回 Pending，运行时把它挂起，不在队列里
    + 一旦某个事件（比如 socket 可读）触发，运行时通过 Waker 把这个 Future 重新推回队列。

+ Waker
    + Waker 本质上是一个指针，指向运行时的 任务调度器。
    + 当某个 I/O 事件完成后（比如 epoll 通知 socket 可读）：
        + 系统调用唤醒运行时。
        + 运行时通过 Waker.wake() 把对应的 Future 重新推入队列。
        + 下次事件循环时，这个任务会被取出并再次 poll。
```rust
loop {
    // 1. 从就绪队列里取任务
    while let Some(task) = ready_queue.pop() {
        poll(task);
    }

    // 2. 如果没有就绪任务，就去等待 I/O 或定时器事件
    //    (epoll/kqueue/io_uring 等)
    wait_for_events();

    // 3. 事件完成后，把相关任务通过 Waker 推回就绪队列
}


```
## async
+ Async开销是0
+ async与多线程多事并发模型，两者不互通
+ async 底层也是基于线程实现，但是它基于线程封装了一个运行时，可以将多个任务映射到少量线程上，然后将线程切换变成了任务切换，后者仅仅是内存中的访问，因此要高效的多
+ async 标记的语法块会被转换成实现了Future特征的状态机

## Future traint
+ 惰性，被轮询(poll)时才会运行
+ 一个在未来某个时间点被调度执行的任务
+ 与同步调用阻塞当前线程不同，当Future执行并遇到阻塞时，它会让出当前线程的控制权，这样其它的Future就可以在该线程中运行，这种方式完全不会导致当前线程的阻塞。
+ `async fn`的返回值是`Future`
+ Future的执行需要executor
    + `block_on(future);`
        + 阻塞当前线程等待future完成
    + `futures::join!(f1, f2);`
        + 等待多个future完成 
    + `hello_cat().await;`
        + 等待异步调用完成，不会阻塞当前线程(等待的过程中当前方法可能挂起，线程去执行其他异步方法)


## Pin
+ 保证某个值在内存中不会被移动(moved)
    + 保证指针依然有效

```rust
pub struct Pin<P> {
    pointer: P,
}
// Pin<Box<T>> 把堆固定住
```

+ Unpin
    + 大部分类是实现Unpin的，本身可以安全移动
    + 如果一个类型 没有实现 Unpin（比如 Future），那就必须用 Pin 来保证它不被移动。
    + 所有权move后，原地址失效

+ 在 async/await 里的作用
    + Rust 编译器把 async fn 编译成一个 状态机（state machine），里面保存了指向自己局部变量的引用。
    + 如果这个 Future 被随意移动，内部的指针就会失效。所以所有 Future 默认是 !Unpin，需要通过 Pin 固定。

+ 应用场景
    + 自引用结构（self-referential struct）
    + Future

## .await与多线程
+ 线程 Future 执行器( executor )
    + Future 可能会在线程间被移动，因此 async 语句块中的变量必须要能在线程间传递
         +它内部的任何.await都可能导致它被切换到一个新线程上去执行
+ .await 时使用普通的锁也不安全
    + 它可能会导致线程池被死锁
    + 用futures::lock代替Mutex

## async的什么周期


## tips
+ 并发框架
    + actix
    + tokio

+ 高并发适合IO密集型
    + web
    + 数据库连接
    + 适合async模型
        + 一旦IO阻塞，任务可以切走，性能高于线程的上下文切换

+ 并行（线程数等于核数）
    + 适合CPU密集型任务
    + 适合用多线程

+ 编译器会为每一个async函数生成状态机

+ block_on
    + 会阻塞当前线程

## ref
+ [浅析 rust 大明星 Tokio](https://zhuanlan.zhihu.com/p/1923366370063660292)