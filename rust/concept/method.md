

## 为结构添加方法
```rust
struct Circle {
    x: f64,
    y: f64,
    radius: f64,
}

impl Circle {
    // new是Circle的关联函数，因为它的第一个参数不是self，且new并不是关键字
    // 这种方法往往用于初始化当前结构体的实例
    //类方法
    fn new(x: f64, y: f64, radius: f64) -> Circle {
        Circle {
            x: x,
            y: y,
            radius: radius,
        }
    }

    // Circle的方法，&self表示借用当前的Circle结构体
    //类似对象方法
    fn area(&self) -> f64 {
        std::f64::consts::PI * (self.radius * self.radius)
    }
}

```

## 关联函数
+ 是函数不是方法
```rust
impl Rectangle {
    fn new(w: u32, h: u32) -> Rectangle {
        Rectangle { width: w, height: h }
    }
}

let sq = Rectangle::new(3, 3);

```

## 为枚举添加方法
```rust
#![allow(unused)]
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

impl Message {
    fn call(&self) {
        // 在这里定义方法体
    }
}

fn main() {
    let m = Message::Write(String::from("hello"));
    m.call();
}
```


## tips
+ self 表示 所有权转移到该方法中，这种形式用的较少
```rust
impl<T> Pair<T> {
    fn new(x: T, y: T) -> Self {
        Self {
            x,
            y,
        }
    }
}
```
+ &self 表示该方法对实例的不可变借用
    + `self: &Self`的简写

+ &mut self 表示可变借用

+ Self
    + 指代当前类型，通常用于方法的返回类型或 impl 块内用于表示类型本身。
    + new一般返回Self
    + 可以指 struct, enum, trait

+ 自动引用和解引用
```rust
// rust中以下是等价的
p1.distance(&p2);
(&p1).distance(&p2);
```