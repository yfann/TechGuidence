# cargo

+ 项目类型
    + bin
        + 可运行
    + lib
        + 依赖库

+ `Cargo.toml` 项目描述文件
+ `Cargo.lock` 根据toml生成的项目一览清单

## cmd
+ `cargo new <project>` 
+ `cargo run` run project under project folder
    + `cargo run --release`

+ `cargo build`
    + `cargo build --release`

+ `cargo check` 检验编译是否能通过

## tips
+ 默认debug模式，编译快
    + ./target/debug

+ 优化编译速度

## ref
+ [指定依赖项](https://course.rs/cargo/reference/specify-deps.html)
+ [标准的 Package 目录结构](https://course.rs/cargo/guide/package-layout.html)