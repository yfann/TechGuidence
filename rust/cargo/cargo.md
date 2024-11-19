# cargo

+ 项目类型
    + bin
        + 可运行
    + lib
        + 依赖库

+ `Cargo.toml` 项目描述文件
    + 从 crates.io 下载包

+ `Cargo.lock` 
    + cargo自行维护，包含了cargo包的详细信息
    + 会锁住依赖的版本
    + 后续cargo lib升级了，也会用cargo.lock中的版本
    + 如何开发的是lib,则把 Cargo.lock 加入到 .gitignore 中。

## cmd
+ `cargo new <project>` 
    + 创建bin项目

+ `cargo new <lib name> --lib`
    + 创建lib项目

+ `cargo run` run project under project folder
    + `cargo run --release`

+ `cargo build` 默认debug
    + `cargo build --release`

+ `cargo check` 检验编译是否能通过

+  `cargo update` 更新所有依赖到最新版本
    + `cargo update -p <package ID>`只更新特定依赖

+ `cargo test`

## dependencies

+ cargo.lock会自动记录依赖的版本，rev也可以省略
```rust
[dependencies]
regex = { git = "https://github.com/rust-lang/regex.git", rev = "9f9f693" }
```

+ 引用同一workspace下的其他crate
```rust
[dependencies]
crate1 = { path = "../crate1" }
```

## cargo命令范围
+ 指定cargo命令要操作的package
    + -p
    + --workspace
+ 如果没有指定参数则选择当前工作目录中的package
    + 如果是virtual manifest，则选择workspace下的所有package
        + `default-members` 可以指定默认的packages

## tips
+ 默认debug模式，编译快
    + ./target/debug

+ 标准编译
    + `rustc xxx.rs`

+ CARGO_HOME 
    + cargo下载的包会放这里

+  cargo-cache可以清除cargo缓存中的指定部分

## ref
+ [指定依赖项](https://course.rs/cargo/reference/specify-deps.html)
+ [标准的 Package 目录结构](https://course.rs/cargo/guide/package-layout.html)