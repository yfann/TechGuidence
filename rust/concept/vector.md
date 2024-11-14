# Vector

```rust
//显示声明类型
let v: Vec<i32> = Vec::new();
//通过加入值可以推导类型
let mut v = Vec::new();
v.push(1);
//宏vec! 把数组转成vec
let v = vec![1, 2, 3];
```

+ `Vec::with_capacity(capacity)` 预先定义长度

+ `v.get()`返回option
```rust
let v = vec![1, 2, 3, 4, 5];
//直接访问，可能越界
let third: &i32 = &v[2];

match v.get(2) {
    Some(third) => println!("第三个元素是 {third}"),
    None => println!("去你的第三个元素，根本没有！"),
}

```

## 同时借用多个vec元素
```rust
let mut v = vec![1, 2, 3, 4, 5];

let first = &v[0];

v.push(6);

println!("The first element is: {first}"); //修改vec后，读取之前的借用会报错
// 数组的大小是可变的，当旧数组的大小不够用时，Rust 会重新分配一块更大的内存空间，然后把旧数组拷贝过来。这种情况下，之前的引用显然会指向一块无效的内存，这非常 rusty —— 对用户进行严格的教育。
```

## 遍历vec

```rust
let v = vec![1, 2, 3];
for i in &v {
    println!("{i}");
}


let mut v = vec![1, 2, 3];
for i in &mut v {
    *i += 10
}
```

## vec存储不同类型
+ 同一枚举不同值
```rust
#[derive(Debug)]
enum IpAddr {
    V4(String),
    V6(String)
}
fn main() {
    let v = vec![
        IpAddr::V4("127.0.0.1".to_string()),
        IpAddr::V6("::1".to_string())
    ];

    for ip in v {
        show_addr(ip)
    }
}

fn show_addr(ip: IpAddr) {
    println!("{:?}",ip);
}
```

+ 实现了同一trait的不同对象
```rust
trait IpAddr {
    fn display(&self);
}

struct V4(String);
impl IpAddr for V4 {
    fn display(&self) {
        println!("ipv4: {:?}",self.0)
    }
}
struct V6(String);
impl IpAddr for V6 {
    fn display(&self) {
        println!("ipv6: {:?}",self.0)
    }
}

fn main() {
    let v: Vec<Box<dyn IpAddr>> = vec![
        Box::new(V4("127.0.0.1".to_string())),
        Box::new(V6("::1".to_string())),
    ];

    for ip in v {
        ip.display();
    }
}
```

## vec常用方法
```rust
fn main() {
    let mut v = Vec::with_capacity(10);
    v.extend([1, 2, 3]);    // 附加数据到 v
    println!("Vector 长度是: {}, 容量是: {}", v.len(), v.capacity());

    v.reserve(100);        // 调整 v 的容量，至少要有 100 的容量
    println!("Vector（reserve） 长度是: {}, 容量是: {}", v.len(), v.capacity());

    v.shrink_to_fit();     // 释放剩余的容量，一般情况下，不会主动去释放容量
    println!("Vector（shrink_to_fit） 长度是: {}, 容量是: {}", v.len(), v.capacity());

    assert!(!v.is_empty()); 

    v.insert(2, 3); 
    v.clear();
    v.pop();

}
```

## vec排序
+ 排序需要实现特性Ord、Eq、PartialEq、PartialOrd 
```rust


#[derive(Debug, Ord, Eq, PartialEq, PartialOrd)]
struct Person {
    name: String,
    age: u32,
}
//根据属性的顺序依次比较
v.sort();
v.sort_unstable();  
v.sort_unstable_by(|a, b| b.age.cmp(&a.age));

```