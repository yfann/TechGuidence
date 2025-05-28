
# rust





## 符号
+ `&` 引用，借用
    + 不可变借用

+ `@`
    + 绑定值的同时解构

+ `*` 
    + 解引用对`&x`取值
    + 裸指针定义的一部分

+ `::`
    + 路径访问
    + `::`开头表示根模块开始
    + `::`优先于`&`
        + `&Self::Target`

+ `extern`
    + 声明外部函数或静态变量

+ `?`
    + 遇到Err或None时提前返回
    + 解包result
    + 用在方法后面，方法需返回Result或Option
    + 可以链式使用
    + `?Sized`
        + 泛型约束，动态大小

+ `..`
    + range
        + `for i in 1..5 {...}`
        + `for i in 1..=5`
    + slice
        + `&arr[..]` 
            + 整个数组
        + `&arr[2..]`
            + 2到末尾
        + `&arr[..3]`
            + 开头到2
    + 忽略剩余元素
        + ` (first, .., last)`
    + 结构体更新,表示任意数量的元素
        + `let point2 = Point { x: 10, y: 20, ..point1 };`

## tips
+ `new`不是关键字，一般用作关联函数名用于新建对象
+ `prelude` 
    + rust自动导入一些函数，不需要use
+ `Deref` 用于解引用的trait
    + `DerefMut`可变版本
    + 将智能指针类型解引用为其内部的数据类型
    + 对实现了Deref的类型使用`*`,会自动调用deref方法,从而获取该类型内部的数据的引用
```rust
pub trait Deref {
    type Target: ?Sized;

    fn deref(&self) -> &Self::Target;
}
```

+ 自动解引用
    + 如果有一个 Box<String> 类型的变量，在调用 box_str.len() 时，Rust 会自动将 Box<String> 解引用为 String，然后调用 String 的 len 方法。



+ Self:类型
    + self: 实例，所有权转移
    + &self: 实例，不可变借用
    + &mut self: 实例，可变借用

+ DST, Dynamically Sized Types（动态大小类型）
    + 编译时无法知道大小的类型
        + dyn Trait
        + [T]
        + str





## ref
<!-- 经典教程 -->
+ [Rust语言圣经(Rust Course)](https://course.rs/first-try/intro.html)
+ [通过例子学 Rust 中文版](https://rustwiki.org/zh-CN/rust-by-example/)


<!-- 教程 -->
+ [rust course](https://github.com/sunface/rust-course)
+ [Rust wiki](https://learnku.com/rust/wikis/29014S)
+ [The Rust Programming Language](https://doc.rust-lang.org/book/)



<!-- details -->
+ [Rust 所有权：内存管理新流派](https://juejin.cn/post/6844903509087764488)

<!-- install -->
+ [WSL安装Rust开发环境](http://www.voycn.com/article/wslanzhuangrustkaifahuanjing)
+ [《Command-Line Rust》](https://learning.oreilly.com/library/view/command-line-rust/9781098109424/ch01.html#id3)
<!-- crates -->
+ [std](https://doc.rust-lang.org/stable/std/index.html)
+ [crate](https://docs.rs/)
+ [Crate std](https://rustwiki.org/zh-CN/std/)


<!-- learn -->
+ [Rust by Example](https://doc.rust-lang.org/rust-by-example/)
+ [rustlings](https://github.com/rust-lang/rustlings)