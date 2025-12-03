# rust enum


## Result<T, E>
+ Ok(T) / Err(E)
+ 可能成功或失败
+ Rust 的编译器要求 必须处理 Result，否则报错
    + `result.unwrap()`
        + 返回Ok内容或panic

## Option<T>
+ Some(T) / None
+ 可能有空值

## Some(value)
+ 代表有值

### Some取值
+ `unwrap`
```rust
let x = Some(3);
println!("{}", x.unwrap()); // 输出 3
```

+ 模式匹配取值
```rust
let maybe_name = Some("Alice");

if let Some(name) = maybe_name {
    println!("Hello, {}", name);
}
```