# rust closure
+ 闭包是匿名函数
    + 可以赋给变量
    + 可以当参数
    + 会捕获调用者作用域中的值
        + 开辟额外内存来存储
    + 闭包并不会作为 API 对外提供，因此它可以享受编译器的类型推导能力，无需标注参数和返回值的类型。
         + 当编译器推导出一种类型后，它就会一直使用该类型 
+ 定义
```rust
|param1, param2,...| {
    语句1;
    语句2;
    返回表达式
}

|param1| 返回表达式
```

+ example
```rust
fn main() {
   let x = 1;
   let sum = |y| x + y; //y是入参，x是调用者作用域中的值

    let action = || {
        println!("muuuu.....");
        thread::sleep(Duration::from_secs(2));
        intensity
    };

    let sum = |x: i32, y: i32| -> i32 {
        x + y
    }
    // let sum = |x, y| x + y
}
```

## struct中的闭包
```rust
struct Cacher<T>
where
    T: Fn(u32) -> u32,
{
    query: T,
    value: Option<u32>,
}


impl<T> Cacher<T>
where
    T: Fn(u32) -> u32,
{
    fn new(query: T) -> Cacher<T> {
        Cacher {
            query,
            value: None,
        }
    }

    // 先查询缓存值 `self.value`，若不存在，则调用 `query` 加载
    fn value(&mut self, arg: u32) -> u32 {
        match self.value {
            Some(v) => v,
            None => {
                let v = (self.query)(arg);
                self.value = Some(v);
                v
            }
        }
    }
}


```

## 闭包调用 trait
+ Fn ⊆ FnMut ⊆ FnOnce
+ FnOnce
    + move
    + 只能调用一次
    + 会消耗被捕获的变量，比如转移所有权。  Q
```rust
let s = String::from("hello");
let f = move || {
    println!("{}", s); // 这里闭包拿走了 s 的所有权
};
f(); // ✅ 第一次调用 OK
// f(); ❌ 第二次调用错误：s 已经被 move 了
```

+ FnMute
    + &mut
    + 可多次调用
    + 可以修改被捕获的变量，但不转移所有权。
```rust
let mut x = 0;
let mut f = || {
    x += 1; // 需要可变借用
    println!("{}", x);
};
f(); // ✅ 调用 1
f(); // ✅ 调用 2
```

+ Fn
    + &
    + 可多次调用
    + 只能读取被捕获的变量，不能修改也不转移所有权。

```rust
let x = 1;
let f = || {
    println!("{}", x); // 只读访问
};
f(); // ✅ 调用 1
f(); // ✅ 调用 2

```

## 闭包作为函数返回值
```rust
fn factory(x:i32) -> Box<dyn Fn(i32) -> i32> {
    let num = 5;

    if x > 1{
        Box::new(move |x| x + num)
    } else {
        Box::new(move |x| x - num)
    }
}

```

## tips
+ `move`强制转移所有权到闭包
```rust
use std::thread;
let v = vec![1, 2, 3];
let handle = thread::spawn(move || {
    println!("Here's a vector: {:?}", v);
});
handle.join().unwrap();

```

+ 个闭包实现了哪种 Fn 特征取决于该闭包如何使用被捕获的变量，而不是取决于闭包如何捕获它们
+ 所有的闭包都自动实现了 FnOnce 特征，因此任何一个闭包都至少可以被调用一次
+ 没有移出所捕获变量的所有权的闭包自动实现了 FnMut 特征
+ 不需要对捕获变量进行改变的闭包自动实现了 Fn 特征
+ 就算签名一样的闭包，类型也是不同的