
## 关联函数
+ impl中没有self的函数
    + 因为没有`self`,所以不能以`f.read()`的形式调用
    + 是个函数不是方法
    + new为构造器的名称
```rust
impl Rectangle {
    fn new(w: u32, h: u32) -> Rectangle {
        Rectangle { width: w, height: h }
    }
}
```

+ `String::from`

## tips

+ 方法调用
```rust
p1.distance(&p2);
// 相当于
(&p1).distance(&p2);
// 通过method的self判断
// &self
// &mut self
// self
```