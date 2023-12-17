


## tips

<!-- 打印结构体 -->
```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}
....
println!("rect1 is {:?}", rect1);
```