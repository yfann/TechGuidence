
## 所有权
+ 核心在于谁负责释放资源
+ 编译期检查
+ Rust 中每一个值都被一个变量所拥有，该变量被称为值的所有者
+ 一个值同时只能被一个变量所拥有，或者说一个值只能拥有一个所有者
+ 当所有者（变量）离开作用域范围时，这个值将被丢弃(drop)
+ 栈上所有权复杂，堆上所有权转移

## 变量作用域

```rust
{                      // s 在这里无效，它尚未声明
    let s = "hello";   // 从此处起，s 是有效的

    // 使用 s
}                      // 此作用域已结束，s不再有效

```

## 值类型copy,所有权复制
+ 发生在栈上
```rust
let x = 5;
let y = x;
```

## 所有权转移
+ 发生在堆上
```rust
let s1 = String::from("hello");
let s2 = s1; //s1不再有效，s1离开作用域后不会释放内存
println!("{}, world!", s1); //会报错，禁止使用无效引用
```
+ `let a=b` 
    + 称为变量绑定
    + 值发生了move
+ 函数传入传出堆引用，会转移所有权

## 字面量赋值
+ 字面量
    + 不在堆中没有所有权
    + 存储在二进制可执行文件中
```rust
fn main() {
    let x: &str = "hello, world";
    let y = x;
    println!("{},{}",x,y); //x,y指向同一个引用
}
```

## 深拷贝
+ rust不会自动深拷贝，对性能影响小
```rust
let s1 = String::from("hello");
let s2 = s1.clone();

println!("s1 = {}, s2 = {}", s1, s2);
```

## 浅拷贝
+ 值拷贝
    + 栈上的数据
+ 有Copy特征的类型(栈上的数据，基本类型)
    + u32
    + bool
    + char
    + (i32,i32)
    + &T 不可变引用
        + 可变引用`&mut T`不可以copy



## 所有权转移
<!-- vector -->
+ 不能转移向量中元素的所有权
    + 会破坏vector结构
```rust
let args: Vec<String> = std::env::args().collect();
let title = args[1]; //会有编译错误
```

## tips
+ 引用的作用域 s 从创建开始，一直持续到它最后一次使用的地方，这个跟变量的作用域有所不同，变量的作用域从创建持续到某一个花括号 }
    + Non-Lexical Lifetimes(NLL)
+ 变量离开作用域时自动释放内存