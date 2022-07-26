
# rust

+ cargo 包管理


## install rust
<!--install on mac and linux -->
+ `curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh`
+ 安装c编译器,rust依赖libc和linker
    + `xcode-select --install` for macOS

<!-- install on windows -->
+ WSL
    + `curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh`

<!-- uninstall -->
+ `rustup self uninstall`

<!-- check -->
+ `rustc -V`
+ `cargo -V`

## vscode for Rust
+ install plugin `rust-analyzer`


## rust GC

+ 对象类型赋值时，一个变量赋值给另一变量时会移交所有权，原变量不可继续访问
+ 没有auto GC
+ 内存如何回收在编译完成时已经确定，代码运行到回收点时回收内存，精确管理内存

## ref
+ [Rust语言圣经(Rust Course)](https://course.rs/first-try/intro.html)
+ [rust course](https://github.com/sunface/rust-course)
+ [Rust wiki](https://learnku.com/rust/wikis/29014S)
+ [The Rust Programming Language](https://doc.rust-lang.org/book/)
<!-- details -->
+ [Rust 所有权：内存管理新流派](https://juejin.cn/post/6844903509087764488)

<!-- install -->
+ [WSL安装Rust开发环境](http://www.voycn.com/article/wslanzhuangrustkaifahuanjing)
