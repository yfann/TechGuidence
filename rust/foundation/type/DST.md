# DST(Dynamically Sized Type)
+ unsized(动态大小)
    + 不能在栈上创建，只能通过引用使用
        + Rust必须在编译时知道类型的大小
    + 指针大小固定
```rust
let x: Path = ...;  // ❌ 编译错误
let x: &Path = Path::new("abc");  // ✅
```

+ sized
    + PathBuf
```rust
let p: PathBuf = PathBuf::from("abc");  // OK
// PathBuf 大小固定的结构体,包含指向堆上路径数据的指针
//Path
struct Path {
    data: [u8], // unsized
}

```
+ DST类型有：
    + Path
    + OsStr
    + str

