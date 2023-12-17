




## 生命周期
+ 消除悬垂引用
+ Borrow checker
+ 生命周期标注
    + 帮助编译器分析
+ 生命周期
    + 生命周期语法用来将函数的多个引用参数和返回值的作用域关联到一起，一旦关联到一起后，Rust 就拥有充分的信息来确保我们的操作是内存安全的。

+ 生命周期消除
    + 自动识别不用添加生命周期标注
```rust
fn first_word(s: &str) -> &str {
....
}
```

## ref
+ [认识生命周期](https://course.rs/advance/lifetime/basic.html)