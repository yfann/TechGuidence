# rust thread

## std::sync::RwLock
+ 允许多个读者同时访问
+ 写者是独占的
+ 写锁会阻塞所有读锁
+ 读锁也会阻塞写锁
+ `Arc<RwLock<T>>`
    + 多线程下使用

+ quick start
```rust
use std::sync::RwLock;
let lock = RwLock::new(10);
// 读
{
    let r = lock.read().unwrap();
    println!("value = {}", *r);
} // r 在这里 drop，释放读锁
// 写
{
    let mut w = lock.write().unwrap();
    *w += 1;
}
```

