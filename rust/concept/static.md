# rust static
+ 一般在编译器初始化
    + 不能函数赋值

+ 对static变量的read,write需要unsafe
    + 多线程不安全
        + 可以使用原子类型
    
+ `lazy_static`
    + 运行在运行期初始化
        + 可以用函数赋值

```rust
use lazy_static::lazy_static;
lazy_static! {
    static ref NAMES: Mutex<String> = Mutex::new(String::from("Sunface, Jack, Allen"));
}
```

## Box::leak
+ `static生命周期
+ 可以给全局变量赋值
    + 局部变量不能给全局变量赋值
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

## tips
+ OnceCell
+ LazyCell
+ OnceLock
+ LazyLock