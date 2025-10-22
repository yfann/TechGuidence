## tokio
+ tokio 是协作式的调度器

+ 多线程异步框架
    + 异步runtime

+ asynchronous runtime
    + 事件驱动的
    + 基于任务的并发模型

+ major component
    + A multi-threaded runtime for executing asynchronous code.
    + An asynchronous version of the standard library.


## [tokio::main]
+ 启动异步运行时

```rust
#[tokio::main]
async fn main() {
    println!("hello");
}

// equals to 

fn main() {
    let mut rt = tokio::runtime::Runtime::new().unwrap();
    rt.block_on(async {
        println!("hello");
    })
}
```



## spawn_blocking
+ 用spawn_blocking创建阻塞线程去完成cpu密集型任务
    + spawn_blocking创建单独的 OS 线程，该线程并不会被 tokio 所调度
    + 果某个 CPU 密集的异步任务是通过 tokio 创建的，CPU 密集的任务很可能会一直霸占着 CPU，此时 tokio 的调度方式决定了该任务会一直被执行，这意味着，其它的异步任务无法得到执行的机会，最终这些任务都会因为得不到资源而饿死。


## ref
+ [tokio](https://tokio.rs/tokio/tutorial)