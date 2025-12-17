# NLL(Non-Lexical Lifetimes)
+ 引用的作用域 ≠ 变量的作用域
    + 变量的作用域（scope of variable）
        + 从创建起，到离开 {} 作用域结束。
    + 引用的作用域（scope/lifetime of a borrow）
        + 最后一次使用该引用为止（Rust 编译器会自动缩短它，这叫 Non-Lexical Lifetimes，NLL）

