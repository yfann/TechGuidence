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
<!-- install -->
+ `cargo install <name>`
    + 从crates.io或本地源码安装一个可执行程序(binary crate)
    + 安装到~/.cargo/bin/

+ `cargo add <pkg>`
    + `cargo add tokio@1.35`
        + `--dev`
            + 开发依赖
        + `--build`
            + build依赖
        + `--git <url>`
            + 从git添加
        + `--path ../mycrate`
            + 从本地添加
    + 自动修改Cargo.toml，添加依赖项

+ `cargo rm <name>`
    + 删除依赖

+ `cargo get <name>`
    +  查询依赖

+ `cargo update` 更新所有依赖到最新版本
    + `cargo update -p <package ID>`只更新特定依赖


<!-- create -->
+ `cargo new <project>` 
    + 创建bin项目

+ `cargo new <lib name> --lib`
    + 创建lib项目

+ `cargo run` run project under project folder
    + `cargo run --release`
    + `cargo run -- <args>`
    + `cargo run --bin <app name>`
        + 如果一个项目有多个可执行bin

+ `cargo build` 默认debug
    + `cargo build --release`


<!-- others -->
+ `cargo check` 检验编译是否能通过

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


## cargo proxy
+ `~/.cargo/config.toml`
```toml
[http]
proxy = "http://xxxx"
```

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
+ [The cargo book](https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html)
<!-- repo -->
+ [](lib.rs)
+ [](crates.io)