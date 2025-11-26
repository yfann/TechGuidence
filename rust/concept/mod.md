# mod
+ mod（module，模块）
    + 命名空间
    + 分割作用域
    + 代码拆分
    + 允许feature控制模块加载
    + 编译期机构，不是运行时，不能动态加载

+ `mod <name>;`
    + 声明模块，但不导出给外部
    + 并从外部文件加载其内容
        + 加载位置
            + <name>.rs
            + <name>/mod.rs
    + 后面的代码可以调用模块中的方法`<name>::...`

+ `pub mod <name>;`
    + 声明并导出模块（crate 外也能访问）
        + 用户可以访问`<crate_name>::<name>`

## 同文件中使用mod
```rust
mod math {
    //函数需要pub 才能在mod外部调用
    pub fn add(a: i32, b: i32) -> i32 {
        a + b
    }
}

fn main() {
    println!("{}", math::add(1, 2));
}
```

## 不同文件中使用mod
+ math.rs(模块名和文件名相同)
```rust
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

+ lib.rs
```rust
mod math;

math::add(...)
```

## mod在文件夹中
+ src/main.rs
```rust
mod math;
```

+ src/math/mod.rs
```rust
pub mod add;
```

+ src/math/add.rs
```rust
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

## 嵌套mod
```rust
mod a {
    pub mod b {
        pub fn hello() {
            println!("hello");
        }
    }
}

fn main() {
    a::b::hello();
}
```


## use
```rust
use a::b::c::hello;

fn main() {
    hello();
}
```

## 条件模块

```rust
// 只有在启用 fs feature 时才编译这个模块
// 模块按条件加载
#[cfg(feature = "fs")]
mod disk_env;
```

```toml
# Cargo.toml
features=["fs"]
```


## tips
+ super
    + 上一次模块

+ crate
    + 当前create根

+ 对lib crate来说
    + `src/lib.rs` 是入口文件