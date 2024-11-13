
# rust



## 静态分发(static dispatch) vs 动态分发(dynamic dispatch)
+ 静态分发
    + 泛型是在编译期完成处理，编译器会为每一个泛型参数对应的具体类型生成一份代码
    + `Box<T>`
+ 动态分发
    + 直到运行时，才能确定需要调用什么方法
    + `dyn`特征对象
        + Rust 在运行时使用特征对象中的指针来知晓需要调用哪个方法
        + 鸭子类型(duck typing)
    + `Box<dyn Trait>`
        + ptr
            + 一个指针 ptr 指向实现了特征 Draw 的具体类型的实例
        + vptr
            + 另一个指针 vptr 指向一个虚表 vtable,vtable 中保存了实现特征的方法


## ref
+ [Rust语言圣经(Rust Course)](https://course.rs/first-try/intro.html)
+ [rust course](https://github.com/sunface/rust-course)
+ [Rust wiki](https://learnku.com/rust/wikis/29014S)
+ [The Rust Programming Language](https://doc.rust-lang.org/book/)
<!-- details -->
+ [Rust 所有权：内存管理新流派](https://juejin.cn/post/6844903509087764488)

<!-- install -->
+ [WSL安装Rust开发环境](http://www.voycn.com/article/wslanzhuangrustkaifahuanjing)
