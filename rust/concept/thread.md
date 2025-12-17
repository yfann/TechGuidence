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

## std::sync::Mutex
+ Mutex vs MutexGuard
    + Mutex<T>
        + 锁 + 数据的容器
    + MutexGuard
        + 我当前持有这把锁的证明（RAII 对象）
+ drop()释放锁
+ quick start
```rust
use std::sync::Mutex;

let m = Mutex::new(10);

{
    let mut guard = m.lock().unwrap(); //返回MutexGuard
    *guard += 1;
} // guard drop → 自动 unlock

```