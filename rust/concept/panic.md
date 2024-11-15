
## panic
+ 不可恢复的错误
+ 程序会退出
+ `panic!`主动抛出panic
```rust
fn main() {
    panic!("crash and burn");
}
```

## panic!过程
1. 格式化 panic 信息，然后使用该信息作为参数，调用 std::panic::panic_any() 函数
2. panic_any 会检查应用是否使用了 panic hook，如果使用了，该 hook 函数就会被调用
3. 当 hook 函数返回后，当前的线程就开始进行栈展开：从 panic_any 开始，如果寄存器或者栈因为某些原因信息错乱了，那很可能该展开会发生异常，最终线程会直接停止，展开也无法继续进行
4. 展开的过程是一帧一帧的去回溯整个栈，每个帧的数据都会随之被丢弃，但是在展开过程中，你可能会遇到被用户标记为 catching 的帧（通过 std::panic::catch_unwind() 函数标记），此时用户提供的 catch 函数会被调用，展开也随之停止：当然，如果 catch 选择在内部调用 std::panic::resume_unwind() 函数，则展开还会继续。
5. 在展开过程中，如果展开本身 panic 了，那展开线程会终止，展开也随之停止
6. 最终的输出结果是取决于哪个线程 panic：
    +  main 线程，操作系统提供的终止功能 core::intrinsics::abort() 会被调用，最终结束当前的 panic 进程
    + 它子线程，那么子线程就会简单的终止，同时信息会在稍后通过 std::thread::join() 进行收集。

## tips
+ backtrace 栈展开
    + debug
    + `RUST_BACKTRACE=1 cargo run`

+ panic时可以选择栈展开或直接终止
```rust
//Cargo.toml
[profile.release]
panic = 'abort'
```

+ main线程如果panic则终止，其他线程panic不影响main

+ unwrap, expect