# Rust string

+ $str(字符串字面量) 不等于 String

## slice
```rust
let s = String::from("hello world");

let hello = &s[0..5];
let world = &s[6..11];
```

## ref
+ [rust string](https://course.rs/basic/compound-type/string-slice.html)