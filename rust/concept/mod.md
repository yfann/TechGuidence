# mod
+ mod（module，模块）
    + 命名空间
    + 分割作用域
    + 代码拆分
    + 允许feature控制模块加载
    + 编译期机构，不是运行时，不能动态加载

+ 文件即mod


+ `mod <name>;`
    + 是加载和编译模块
    + mod是私有的，只能在crate内使用
    + 并从外部文件加载其内容
        + 加载位置
            + <name>.rs
            + <name>/mod.rs
    + 后面的代码可以调用模块中的方法`<name>::...`

+ `pub mod <name>;`
    + 声明并导出模块（crate 外也能访问）
        + 是加载 + 对外公开模块
    + `use <crate_name>::<name>`

## create vs module
+ crate
    +  一个独立的编译单元 
    +  一个包
    + 一个 binary（含 main.rs）或一个 library（含 lib.rs）
    + 整个项目编译成一个 crate
+ module
    + crate内部命名空间

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

## 文件mod
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

## 文件夹mod

+ mod.rs
    + 旧版rust表示目录模块
    + `mod math` 会自动加载math/mod.rs
```rust
// src/math/mod.rs
pub mod add;

// src/math/add.rs
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}

// src/main.rs
mod math;
```



+ 新版结构
```rust
src/
 ├── main.rs
 ├── math.rs    <-- 取代 math/mod.rs
 └── math/
      └── add.rs
// math.rs
pub mod add;
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


+ `src/lib.rs` 
    + 是lib类型的crate入口文件
        + 外部引入此crate时的入口文件
    + 也是crate内部所有代码的根模块
        + 内部模块也必须在 lib.rs 声明，否则根本不会被编译。
        + `mod xxx;` 就是在“告诉编译器把这个模块包含进项目”
    + 作用
        + 定义 crate 的模块结构
        + 声明所有子模块（无论是否对外）
        + 暴露对外 API（pub）
        + 组织内部代码（private）