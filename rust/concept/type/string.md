# String vs &str


## 比较
| 类型           | 所有权 | 存储位置            | 可变性 | 长度   | 常见用途                                       |
| ------------ | --- | --------------- | --- | ---- | ------------------------------------------ |
| **`String`** | 有   | 堆（heap）         | 可变  | 动态可变 | 需要可变的、拥有所有权的字符串                            |
| **`&String`**| 无
| **`str`**    | 无   | 任意（一般在程序的常量区或堆） | 不可变 | 固定   | 原始的 UTF-8 字符串切片类型（几乎不用直接写 `str`，多用 `&str`） |
| **`&str`**   | 无   | 任意（常量区/堆/栈）     | 不可变 | 固定   | 借用字符串（不可变引用）                               |


+ String
    + 是堆分配的、可变的、拥有所有权的 UTF-8 字符串。   
    + 实际上是一个结构体，内部包含：
        + 指针（指向堆上的数据）
        + 长度（已使用的字节数）
        + 容量（堆上分配的空间大小）

+ str
    + 是原始字符串切片类型，本质上就是 UTF-8 字节序列。
    + 它的长度是固定的（编译期或运行期已知）。
    + 不能单独存在（因为需要长度信息），所以我们常用 &str（带引用和长度信息）。

+ &str
    + 是一个不可变借用，包含：
        + 指针（指向字符串数据的起始位置）
        + 长度（字节数）
    + 不拥有数据，只是对现有字符串的一段切片的引用。
    + 来自 String 或字面量

    
```rust
fn main() {
    // String：堆上分配，拥有所有权
    let mut s: String = String::from("Hello");
    s.push_str(", world"); // 可变
    println!("{}", s);

    // &str：不可变引用，可以来自 String 或字面量
    let s_literal: &str = "Hello"; // 存在于程序的只读内存中
    let s_slice: &str = &s[0..5]; // 从 String 切片
    println!("{} / {}", s_literal, s_slice);

    // str（很少直接用）
    // fn my_func(s: &str) { ... }  // 接口多用 &str
}

```
## 转换
+ &str → String
```rust
let s1: &str = "Hello";
let s2: String = s1.to_string(); // 或 String::from(s1)
```

+ String → &str
```rust
let s: String = String::from("Hello");
let slice: &str = &s; // 自动解引用
```

## 使用场景
+ 用 &str → 函数参数，传入任何字符串切片（包括字面量和 String 的切片）
+ 用 String → 需要可变、可增长的字符串并拥有所有权
+ 用 str → 很少直接用，多用于类型签名中的 &str


## &str vs &String
+ &str
    + 更通用：能引用字符串字面量（"abc"）、String 的切片、甚至部分字符串（&s[0..3]）。
    + 适合做函数参数：

+ &String
    + 只能引用一个完整的 String 对象，不能直接指向字面量
    + &String 会自动解引用成 &str,反之不行
```rust
let s = String::from("Hello");
let slice: &str = &s; 
// 栈：  s   ->  [ ptr | len=5 | capacity=5 ]  ---> 堆："Hello"
// 栈： &s -> 指向 s（结构体）的引用
// &str
// 栈： slice -> [ ptr | len=5 ]
// 它指向的是字符串数据（"Hello"）本身，而不是 String 结构体。

```