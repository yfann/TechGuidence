# rust macro
+ 宏是通过一种代码来生成另一种代码

+ 可变参数
```rust
println!("hello")
println!("hello {}", name)
```

+ 宏展开
    + 替换为特定代码
    + 发生在编译前


+ 参数可以是[],(),{}
```rust
fn main() {
    println!("aaaa");
    println!["aaaa"];
    println!{"aaaa"}
}
```

## 声明式宏( declarative macros )
+ macro_rules!
    + 类似于match的模式匹配，一单匹配对应的代码就会替换宏，开始宏展开
    + 代码替换

+ 例子
```rust
#[macro_export] //将宏进行了导出
macro_rules! vec {
    ( $( $x:expr ),* ) => { //$()包含模式匹配的值会被提取，expr匹配任何表达式，$x别名
        {
            let mut temp_vec = Vec::new();
            $(
                temp_vec.push($x);
            )*//根据模式匹配次数生成对应代码
            temp_vec
        }
    };
}

//使用宏
let v: Vec<u32> = vec![1, 2, 3];
```

## 过程宏( procedural macros )
+ 类似于函数，输入源代码，操作后，输出一段代码
+ 输出代码不会替换之前的代码
+ 当创建过程宏时，它的定义必须要放入一个独立的包中



### [derive]
+ 为目标结构体或枚举派生指定的代码
+ 包名以`_derive`做结尾
+ 只能在struct/enum/union上
```rust
// xxx_derive/Cargo.toml
[lib]
proc-macro = true

[dependencies]
syn = "1.0"
quote = "1.0"

```

### 类属性宏(Attribute-like macro)
+ 为目标添加自定义的属性
+ 可以加在fn上

### 类函数宏(Function-like macro)

## built-in macro
+ `stringify!`
    + 表达式转换成字面量



## tips
+ `cargo install cargo-expand`
    + `cargo expand --bin hello_macro`
        + 展开调试宏

## ref
+ [rust macro](https://doc.rust-lang.org/std/macro.dbg.html)
+ [Macros By Example](https://doc.rust-lang.org/reference/macros-by-example.html)
+ [The Little Book of Rust Macros](https://veykril.github.io/tlborm/)
+ [macro](https://course.rs/advance/macro.html)