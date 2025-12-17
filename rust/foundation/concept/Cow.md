# Cow(Copy-on-Write)
+ 多个读者共享同一份不可变数据；只有在“需要写”时，才复制一份新数据进行修改
    + 读：零拷贝、无锁或低锁
    + 写：复制 → 修改 → 原子替换

+ 写操作（低频）
    + 复制一份完整 State
    + 在副本上修改
    + 原子地替换“当前指针”
```md
旧 Arc<State>
   │
   ├── clone → 新 Arc<State'>
   │           （复制一份）
   │
   └── 保留给读线程继续使用

```

## CoW 适合 LSM Tree
+ LSM
    + 读多写少
        + 大部分时间只是读 memtable / sstable 列表
    + 状态切换是“整体性的”，而不是原地小修改
        + memtable freeze
        + 新 memtable 切换
        + manifest / version 更新
        + compaction 完成后更新版本

## Arc<RwLock<Arc<State>>>
```rust
let new_state = {
    let old = {
        let r = self.state.read().unwrap();
        Arc::clone(&*r)
    };

    let mut new = (*old).clone(); // 深拷贝 State
    new.apply_compaction();
    Arc::new(new)
};

{
    let mut w = self.state.write().unwrap();
    *w = new_state; // 原子切换
}

```


## `Arc<RwLock<State>>` vs `Arc<RwLock<Arc<State>>>`

+ `Arc<RwLock<State>>`
    + 锁保护数据本体
    + State
        + State 是可变的
        + 读写都发生在同一份 State 上
        + RwLock 直接保护 State 内容
    + read
        + 每次读都有获取读锁
        + write会block所有read
    ```rust
    let r = state.read().unwrap();
    r.get(key);
    ```
    + write
        + 所有读被阻塞
    ```rust
    let mut w = state.write().unwrap();
    w.apply_compaction(); // 长时间
    ```
+ `Arc<RwLock<Arc<State>>>`
    + 锁保护状态指针(版本)
    + CoW模型
    + State
        + State 一旦创建后逻辑不可变
        + 写操作创建新 State
        + RwLock 只负责 切换版本指针
    + read
        + 锁只保护一次 Arc clone
        + 后续访问 完全无锁
        + 写操作不会阻塞已有读
    ```rust
    let snapshot = {
        let r = state.read().unwrap();
        Arc::clone(&*r)
    }; // 立刻释放锁

    snapshot.get(key); // 无锁
    ```
    + write
        + 写锁只用于“指针切换”
        + 极短
        + 老读者继续用旧版本
    ```rust
    // 先在锁外构建新版本
    let new_state = Arc::new(build_new_state(old_state));

    // 再短暂写锁
    {
        let mut w = state.write().unwrap();
        *w = new_state;
    }
    ```

+ 写的时候，修改同一个 State，还是生成一个新 State?
    + 修改同一个 → Arc<RwLock<State>>
    + 生成新版本 → Arc<RwLock<Arc<State>>>