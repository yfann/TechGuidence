# ouroboros
+ 用于安全地构建“自引用（self-referential）结构体”的库
    + 在不手写 unsafe 的前提下，安全地定义和使用自引用结构体
+ ouroboros提供一个宏驱动的方式,生成一个不可被安全move的结构
    + 在内部使用 unsafe，但对使用者是安全接口

+ Pin + 内部 unsafe
    确保结构体一旦构造完成就不会再被移动

## 自引用结构体
+ Rust 不允许结构体中字段互相借用
    + 结构体可以被 move,一旦 move，slice 指向的地址就失效
```rust
struct Bad {
    data: String,
    slice: &str,   // 引用 data
}
```

## ouroboros::self_referencing
```rust
use ouroboros::self_referencing;

#[self_referencing]
struct MyStruct {
    data: String,
    #[borrows(data)]
    slice: &'this str,
}

//确保 data 先被放到最终内存地址
let s = MyStructBuilder {
    data: "hello world".to_string(),
    slice_builder: |data| &data[0..5],
}.build();

```