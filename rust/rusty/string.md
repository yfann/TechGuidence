# Rust string

+ $str(字符串字面量) 不等于 String
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

## ref
+ [rust string](https://course.rs/basic/compound-type/string-slice.html)