

## method
+ 第一个参数为self,&self, &mut self
+ self
    + 对象的所有权会被move到方法中
```rust
impl Point {
    fn into_tuple(self) -> (i32, i32) {
        (self.x, self.y)
    }
}

let p = Point { x: 1, y: 2 };
let t = p.into_tuple(); // p 被 move 了
// println!("{:?}", p); // ❌ 编译错误
```
+ &self
    + 不能修改对象
```rust
impl Point {
    fn show(&self) {
        println!("({}, {})", self.x, self.y);
    }
}
```

+ &mut self
    + 可以修改对象
```rust
impl Point {
    fn move_to(&mut self, x: i32, y: i32) {
        self.x = x;
        self.y = y;
    }
}
```

## 关联函数
+ 第一个参数不需要self
+ 调用形式`Type::func()`
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

+ &self 表示该方法对实例的不可变借用
    + `self: &Self`的简写

+ &mut self 表示可变借用

+ Self
    + 指代当前类型，通常用于方法的返回类型或 impl 块内用于表示类型本身。
    + new一般返回Self
    + 可以指 struct, enum, trait
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

+ 自动引用和解引用
```rust
// rust中以下是等价的
p1.distance(&p2);
(&p1).distance(&p2);
```