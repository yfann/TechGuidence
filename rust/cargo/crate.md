# Crate



## Crate vs package
+ crate: 
    + 是 Rust 代码的最小的编译单位
    + 每个 crate 都有自己的根模块，编译器会从这个根模块开始构建 crate
    + Crate 可以是一个 library crate（库）或者 binary crate（二进制可执行程序）
        + binary crate:
            + 包含main
            + src/main.rs
        + library crate:
            + 是一个共享的库，通常用来提供可复用的功能模块
            + src/lib.rs
+ package: 
    + 是一个分发单元（由一个或多个 crate 组成）
    + 包含Cargo.toml
    + 一个package可以包含:
        + 一个library crate
        + 多个binary crate

## crate
<!-- Binary Crate -->
+ src/main.rs

+ src/bin/*.rs
    + 每个文件是一个crate
    + 每个文件都含有main()
    + 每个文件都会被编译成一个独立的可执行程序

<!-- Library Crate -->
+ src/lib.rs
    + Library Crate的根文件
        + 根文件可以导出其他文件中的mod
