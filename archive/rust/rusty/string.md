# Rust string


+ Rust中char是Unicode类型,每个char占4字节
+ 字符串是UTF-8编码，字符串中的每个字符占的字节(1-4)

## slice
```rust
let s = String::from("hello world");

let hello = &s[0..5];
let world = &s[6..11];
let slice = &s[4..];


 let s = "中国人";
 let a = &s[0..3];
 println!("{}",a);
//  中
// 中文在UTF-8中占三个字节，取不完整会崩溃
```


## `str` vs `String`

+ $str(字符串字面量) 不等于 String
+ str无法修改，&str是UTF-8
+ String可增长，可改，具有所有权的UTF-8字符串
    + 底层存储是个数组
        + `[ u8 ]` 一个字节一个元素

+ &str to String
    + `String::from("hello,world")`
    + `"hello,world".to_string()`

+ String to $str
```rust
let s = String::from("hello,world!");
say_hello(&s);

fn say_hello(s: &str) {
    println!("{}",s);
}
```

+ String 不允许索引
```rust
let s1 = String::from("hello");
let h = s1[0];
```


## ref
+ [rust string](https://course.rs/basic/compound-type/string-slice.html)