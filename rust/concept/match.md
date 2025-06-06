# 模式匹配
+ 从复杂的数据结构中提取值、进行条件分支、结构解构等
+ let、if let、while let、match
+ 模式是用来匹配值的结构和内容的

## match
```rust
match target {
    模式1 => 表达式1,
    模式2 => {
        语句1;
        语句2;
        表达式2
    },
    _ => 表达式3
}
```

+ match的每个分支必须是表达式
+ match匹配必须列出所有情况
+ `_`类似于default
+ match,if let都会产生新代码块，会发生变量遮蔽

```rust
enum Direction {
    East,
    West,
    North,
    South,
}

fn main() {
    let dire = Direction::South;
    match dire {
        Direction::East => println!("East"),
        Direction::North | Direction::South => {
            println!("South or North");
        },
        _ => println!("West"),
    };
}
```

+ match是表达式
```rust
    let ip1 = IpAddr::Ipv6;
    let ip_str = match ip1 {
        IpAddr::Ipv4 => "127.0.0.1",
        _ => "::1",
    };
```


+ 模式绑定
    + 从模式中取出绑定的值
```rust
enum Action {
    Say(String),
    MoveTo(i32, i32),
    ChangeColorRGB(u16, u16, u16),
}

fn main() {
    let actions = [
        Action::Say("Hello Rust".to_string()),
        Action::MoveTo(1,2),
        Action::ChangeColorRGB(255,255,0),
    ];
    for action in actions {
        match action {
            Action::Say(s) => {
                println!("{}", s);
            },
            Action::MoveTo(x, y) => {
                println!("point from (0, 0) move to ({}, {})", x, y);
            },
            Action::ChangeColorRGB(r, g, _) => {
                println!("change color into '(r:{}, g:{}, b:0)', 'b' has been ignored",
                    r, g,
                );
            }
        }
    }
}
```


## if let

+ 允许值匹配一种模式，不用全列出来

```rust
if let PATTERN = SOME_VALUE {

}


if let Some(3) = v {
    println!("three");
}

fn main() {
   let age = Some(30);
   println!("在匹配前，age是{:?}",age);
   if let Some(age) = age {
       println!("匹配出来的age是{}",age);
   }

   println!("在匹配后，age是{:?}",age);
}

```

## while let
```rust
let mut stack = Vec::new();
//....
//stack.pop返回Some,stack为空时返回None
while let Some(top) = stack.pop() {
    println!("{}", top);
}


for (index, value) in v.iter().enumerate() {
    println!("{} is at index {}", value, index);
}
```


## let也是一种模式匹配
```rust
let PATTERN = EXPRESSION;

//匹配的值绑定到变量 x 上
let x = 5;

//类型要相同
let (x, y, z) = (1, 2, 3);

//else处理模式的其他情况，必须用发散代码处理(break、return、panic)
let (Some(count_str), Some(item)) = (it.next(), it.next()) else {
    panic!("Can't segment count item pair: '{s}'");
};
```

## 参数也是模式
```rust
fn print_coordinates(&(x, y): &(i32, i32)) {
    println!("Current location: ({}, {})", x, y);
}

fn main() {
    let point = (3, 5);
    print_coordinates(&point);
}
```


## matches!宏

+ ，它可以将一个表达式跟模式进行匹配，然后返回匹配的结果 true or false
```rust
let foo = 'f';
assert!(matches!(foo, 'A'..='Z' | 'a'..='z'));

let bar = Some(4);
assert!(matches!(bar, Some(x) if x > 2));

```


## 解构
+ 解构结构体
```rust
struct Point {
    x: i32,
    y: i32,
}

fn main() {
    let p = Point { x: 0, y: 7 };

    let Point { x, y } = p;
    assert_eq!(0, x);
    assert_eq!(7, y);
}
```
+ 解构枚举
```rust
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

fn main() {
    let msg = Message::ChangeColor(0, 160, 255);

    match msg {
        Message::Quit => {
            println!("The Quit variant has no data to destructure.")
        }
        Message::Move { x, y } => {
            println!(
                "Move in the x direction {} and in the y direction {}",
                x,
                y
            );
        }
        Message::Write(text) => println!("Text message: {}", text),
        Message::ChangeColor(r, g, b) => {
            println!(
                "Change the color to red {}, green {}, and blue {}",
                r,
                g,
                b
            )
        }
    }
}
```

+ 解构嵌套体
```rust
enum Color {
   Rgb(i32, i32, i32),
   Hsv(i32, i32, i32),
}

enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(Color),
}

fn main() {
    let msg = Message::ChangeColor(Color::Hsv(0, 160, 255));

    match msg {
        Message::ChangeColor(Color::Rgb(r, g, b)) => {
            println!(
                "Change the color to red {}, green {}, and blue {}",
                r,
                g,
                b
            )
        }
        Message::ChangeColor(Color::Hsv(h, s, v)) => {
            println!(
                "Change the color to hue {}, saturation {}, and value {}",
                h,
                s,
                v
            )
        }
        _ => ()
    }
}
```

+ 解构复杂类型
```rust
//解构元组
let ((feet, inches), Point {x, y}) = ((3, 10), Point { x: 3, y: -10 });
//解构数组
let [x, y] = arr;
//解构slice
let arr: &[u16] = &[114, 514];
if let [x, ..] = arr {
    assert_eq!(x, &114);
}
```


## 忽略值
+ `_`
    +  完全不会绑定值
```rust
let mut setting_value = Some(5);
let new_setting_value = Some(10);

match (setting_value, new_setting_value) {
    (Some(_), Some(_)) => {
        println!("Can't overwrite an existing customized value");
    }
    _ => {
        setting_value = new_setting_value;
    }
}

println!("setting is {:?}", setting_value);

//不会发生所有权转移
if let Some(_) = s {
    println!("found a string");
}
```

+ 忽略未使用的变量
    + 仍会将值绑定到变量
```rust
let _x = 5;
```

+ `..`忽略剩余值
```rust
    let numbers = (2, 4, 8, 16, 32);

    match numbers {
        (first, .., last) => {
            println!("Some numbers: {}, {}", first, last);
        },
    }
```

##  match guard
+ 更进一步匹配
```rust
let num = Some(4);

match num {
    Some(x) if x < 5 => println!("less than five: {}", x),
    Some(x) => println!("{}", x),
    None => (),
}

```

## @绑定

```rust
enum Message {
    Hello { id: i32 },
}

let msg = Message::Hello { id: 5 };

match msg {
    Message::Hello { id: id_variable @ 3..=7 } => {
        println!("Found an id in range: {}", id_variable)
    },
    Message::Hello { id: 10..=12 } => {
        println!("Found an id in another range")
    },
    Message::Hello { id } => {
        println!("Found some other id: {}", id)
    },
}


let p @ Point {x: px, y: py } = Point {x: 10, y: 23};
// px,py结构赋值
// p @ ...@ 操作符让你同时绑定整个值到变量 p，也就是说，p 将会绑定到 Point { x: 10, y: 23 } 这个结构体本身。

match 1 {
    num @ 1 | 2 => {
        println!("{}", num);
    }
    _ => {}
}
```
