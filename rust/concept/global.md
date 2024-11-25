## rust global

## 编译器初始化
+ 无法函数调用赋值
+ 静态常量
    + 一般大小
    + 类型不能省略
    + 编译时编译器会尽可能将其内联到代码中
```rust
const MAX_ID: usize =  usize::MAX / 2;
```

+ 静态变量
    + 必须用unsafe访问和修改static变量
        + 非线程安全
    + 静态变量只有一个实例，所有的引用都会指向同一个地址
    + 存储在静态变量中的值必须要实现 Sync trait
```rust
static mut REQUEST_RECV: usize = 0;
fn main() {
   unsafe {
        REQUEST_RECV += 1;
        assert_eq!(REQUEST_RECV, 1);
   }
}
```

+ 原子类型
    + 线程安全
        + 可以全局计数
```rust
use std::sync::atomic::{AtomicUsize, Ordering};
static REQUEST_RECV: AtomicUsize  = AtomicUsize::new(0);
fn main() {
    for _ in 0..100 {
        REQUEST_RECV.fetch_add(1, Ordering::Relaxed);
    }

    println!("当前用户请求数{:?}",REQUEST_RECV);
}
```

## 运行期初始化
+ lazy_static
    + 允许运行时初始化静态变量
    + 允许函数赋值
    + lazy_static直到运行到main中的第一行代码时，才进行初始化，
```rust
use std::sync::Mutex;
use lazy_static::lazy_static;
lazy_static! {
    static ref NAMES: Mutex<String> = Mutex::new(String::from("Sunface, Jack, Allen"));
}

fn main() {
    let mut v = NAMES.lock().unwrap();
    v.push_str(", Myth");
    println!("{}",v);
}
```

+ Box::leak
    + 将一个变量从内存中泄漏，然后将其变为'static生命周期
    + 可以函数返回全局变量
```rust
#[derive(Debug)]
struct Config {
    a: String,
    b: String
}
static mut CONFIG: Option<&mut Config> = None;

fn main() {
    let c = Box::new(Config {
        a: "A".to_string(),
        b: "B".to_string(),
    });

    unsafe {
        // 将`c`从内存中泄漏，变成`'static`生命周期
        CONFIG = Some(Box::leak(c));
        println!("{:?}", CONFIG);
    }
}
```

+ OnceCell(单线程)，SyncOnceCell(多线程)
    + 最多赋值一次
    + 实现多线程log功能