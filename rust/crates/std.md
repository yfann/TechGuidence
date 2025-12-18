
## std::borrow::Cow
+ 只在需要时拷贝，否则引用原数据。
    + Copy-on-write
    + 只读时避免copy,修改数据时创建copy
    + 用于:数据变换函数、解析器、处理只读字符串/切片等场景。
```rust
use std::borrow::Cow;

fn modify_data(input: &str) -> Cow<str> {
    if input.contains(' ') {
        // 如果有空格，则生成一个拷贝并替换空格
        Cow::Owned(input.replace(' ', "_"))
    } else {
        // 否则，直接借用原始数据，避免内存开销
        Cow::Borrowed(input)
    }
}

fn main() {
    let s1 = "hello world";
    let s2 = "helloworld";

    let result1 = modify_data(s1);
    let result2 = modify_data(s2);

    println!("Result1: {}", result1); // hello_world (Owned)
    println!("Result2: {}", result2); // helloworld (Borrowed)
}

```

## std::collections::BTreeSet
+ 有序set
    + 它的底层实现基于B-树，所以插入和查找是对数复杂度 𝑂(𝑙𝑜𝑔𝑛)。
+ 用法
    + 需要去重和排序时，使用 BTreeSet，因为它是有序的集合。
    + 需要对数据集做范围查询（如 range 方法）时。
    + 需要小而稳定的内存开销（比 HashSet 的内存开销更可控）。
```rust
use std::collections::BTreeSet;

fn main() {
    let mut set = BTreeSet::new();

    set.insert(3);
    set.insert(1);
    set.insert(2);
    set.insert(2); // 重复元素不会被添加

    for value in set.iter() {
        println!("{}", value); // 输出：1 2 3 (有序)
    }

    // 通过范围查询元素
    let range: Vec<_> = set.range(2..).collect();
    println!("Range from 2: {:?}", range); // 输出：Range from 2: [2, 3]
}

```

## std::ffi::OsString
+ OsString 是一种表示操作系统级字符串的类型，它可以与操作系统的本地编码兼容。
+ 在Windows、Linux 和 macOS 平台上，文件名、环境变量等都可能使用特定的字符编码（如 UTF-16 或其他本地编码）。
+ OsString 提供了一种与操作系统无关的字符串类型，适用于跨平台操作。
+ 它的配套类型是 OsStr（不可变引用，类似于 &str）
+ 用途
    + 跨平台的文件路径和环境变量。
    + 处理命令行参数（std::env::args_os()）。
    + 在不确定字符串是否为有效 UTF-8时，使用 OsString
```rust
use std::ffi::OsString;

fn main() {
    // 1️⃣ 创建 OsString
    let os_str = OsString::from("Hello, world!");

    // 2️⃣ 转换为普通的 String（如果它是有效的 UTF-8 字符串）
    if let Ok(utf8_str) = os_str.clone().into_string() {
        println!("This is a valid UTF-8 string: {}", utf8_str);
    } else {
        println!("This is not a valid UTF-8 string");
    }

    // 3️⃣ 使用 OsString 处理系统命令行参数
    use std::env;

    for arg in env::args_os() {
        println!("Command-line argument: {:?}", arg);
    }
}


```


## std::mem::replace
+ 安全原地交换
    + 取出字段值 + 写回新值
```rust
let mut x = 1;
let old = std::mem::replace(&mut x, 2);

assert_eq!(x, 2);
assert_eq!(old, 1);
```