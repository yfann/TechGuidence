# RAII(Resource Acquisition Is Initialization)
+ 资源的获取即初始化
    + 对象一旦被创建，就已经安全地拥有了某种资源
    + 对象一旦被销毁，就必然释放该资源

+ 资源
    + 内存
    + 锁
    + 文件句柄
    + socket
    + mmap
    + 数据库连接
    + GPU 资源

+ 把资源的生命周期，绑定到对象的生命周期上
    + 构造函数 → 获取资源
    + 析构函数（Drop） → 释放资源

+ 例子
```rust
// mutex
{
let guard = mutex.lock().unwrap();
// 创建 MutexGuard 对象
// 同时成功获取 mutex 的锁
}// guard drop
// Drop for MutexGuard 被调用
// 自动 unlock



use std::fs::File;
let f = File::open("a.txt")?;
// 用文件
// 作用域结束 → 自动 close


let r = rwlock.read().unwrap();
// 多个读者
drop(r); // 显式释放读锁


let a = Arc::clone(&x);
// a drop → refcount -1
```

+ 实现RAII
    + ownership
    + drop trait