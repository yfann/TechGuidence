
## Crate(包)
+ 对于 Rust 而言，包是一个独立的可编译单元，它编译后会生成一个可执行文件或者一个库。

## Package(项目)
+ 包含Cargo.toml
+ cargo创建Package时也会创建一个同名包
    + `cargo new <project name>`
        + `cargo run`
    + `cargo new <lib name> --lib`

## Module
+ `mod`
    + 可以嵌套
```rust
// 餐厅前厅，用于吃饭
mod front_of_house {
    mod hosting {
        fn add_to_waitlist() {}

        fn seat_at_table() {}
    }

    mod serving {
        fn take_order() {}

        fn serve_order() {}

        fn take_payment() {}
    }
}

```
+ 绝对路径
    + 从包根开始，路径名以包名或者 crate 作为开头
    + `crate::front_of_house::hosting::add_to_waitlist();`
+ 相对路径
    + 从当前模块开始，以 self，super 或当前模块的标识符作为开头
        + `front_of_house::hosting::add_to_waitlist();`
        + `super::serve_order();`
        + `self::back_of_house::cook_order()`

+ 文件夹作为模块
    + 子模块名与文件名相同(hoting)
    + front_of_house.rs中列出子模块
        + `pub mod hosting;`
```rust
src
├── front_of_house
│   └── hosting.rs
├── front_of_house.rs
└── lib.rs

```

## 可见性
+ 默认所有类型都是私有的（包括mod）
+ 同模块之间可见
+ 父模块不能访问子模块私有项，反之可以   
+ `pub`
    + struct设为pub,其成员任然私有
    + enum设为pub,其成员都可见
```rust
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

```
+ 限制
    + `pub(crate)`
        + 当前包内可见
    + `pub(self)`
        + 当前模块可见
    + ` pub(in crate::a)`
        + 包内某个模块可见
        + pub(in <path>) path必须是父模块或祖先模块
    + `pub(super)`
        + 父模块可见

## using
+ 引入绝对路径
```rust
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
}

```

+ 引入相对路径
```rust
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

use front_of_house::hosting::add_to_waitlist;

pub fn eat_at_restaurant() {
    add_to_waitlist();
    add_to_waitlist();
    add_to_waitlist();
}

```

+ 起别名
```rust
use std::io::Result as IoResult;
```

+ 引入项再导出
    + 当外部模块被引入到当前模块时，它会自动变为私有
    + `pub use ...`
```rust
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

pub use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
}

```
+ {}引入
    + `use std::collections::{HashMap,BTreeMap,HashSet};`
    + `use std::io::{self, Write};`
        + self指当前mod
+ *引入
    + `use std::collections::*;`
        + 引入模块下的所有pub项

+ use可以在funcion中声明

## tips
+ 包是模块树 

+ 创建模块
    + 代码块中`mod`定义
    + 单个rust文件定义
        + 单个文件是一个模块
        + 可以导入其他文件模块
    + 文件夹定义
        + `mod.rs`
            + 文件夹可以包含多个rust文件，每个rust文件是一个单独的模块
            + 需要暴露的模块都可以导出到`mod.rs`中
        

## ref
+ [prelude](https://doc.rust-lang.org/std/prelude/index.html)
+ [](lib.rs)
+ [](crates.io)