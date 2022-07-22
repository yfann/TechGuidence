# Rust

## Rust赋值

### value copy
+ copy
    + 拥有copy特征的类型
        + 基本类型，栈中分配，预先知道内存大小
        + 任何基本类型的组合可以 Copy ，不需要分配内存或某种形式资源的类型是可以 Copy
        + u32,bool,f64,char,包含基本类型的元组`(i32,i32)`,不可变引用`&T`
```rust
let a = 5;
let b = a;
// x,y都等于5   
```


### value borrowing
+ 字面量引用
```rust
let x: &str = "hello, world";
let y = x;
// x,y都引用同一个字面量
```
+ 不可变引用(不能通过引用修改原值)
```rust
let x=5;
let y=&x;
// *y  取值
// y是x的引用
```

+ 可变引用
    + 同一作用域，特定数据只能有一个可变引用
    + 可变引用，不可变引用不能同时存在
    + 同一时刻，你只能拥有要么一个可变引用, 要么任意多个不可变引用
```rust
let mut s = String::from("hello");
let r1 = &mut s;
let r2 = &mut s;
// 可变引用只能存在一个
// r2会报错
{
    let r3 = &mut s;
}
// 不同作用域可以引用
```

+ 悬垂引用(Dangling References)
    + 指针指向某个值后，这个值被释放掉了，而指针仍然存在，其指向的内存可能不存在任何值或已被其它变量重新使用
```rust
fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String {
    let s = String::from("hello");

    &s
}
// 报错
```

### value move
```rust
let s1 = String::from("hello");
let s2 = s1;
// s1移交所有权给s2
// s1不能再访问字符串

let s1 = String::from("hello");
let s2 = s1.clone();
// 深拷贝后s1,s2都可用
```


## string
+ &str
    + 字面量
    + `let x: &str = "hello, world";`
+ String
    + 字符串对象，堆中分配内存
    + `let s = String::from("hello");`

## tips

+  Non-Lexical Lifetimes(NLL)