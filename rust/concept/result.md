
## result

```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

## 处理error
```rust
use std::fs::File;

fn main() {
    let f = File::open("hello.txt");

    let f = match f {
        Ok(file) => file,
        Err(error) => match error.kind() {
            ErrorKind::NotFound => match File::create("hello.txt") {
                Ok(fc) => fc,
                Err(e) => panic!("Problem creating the file: {:?}", e),
            },
            other_error => panic!("Problem opening the file: {:?}", other_error),
        },
    };
}
```

## error直接panic
+ unwrap()
+ expect()
+ 快速写原型时使用

```rust
//error时直接panic
let f = File::open("hello.txt").unwrap();
//panic时带上自定义信息
let f = File::open("hello.txt").expect("Failed to open hello.txt");
```

## error传播

+ 普通处理
```rust
match f.read_to_string(&mut s) {
    // 读取成功，返回Ok封装的字符串
    Ok(_) => Ok(s),
    // 将错误向上传播
    Err(e) => Err(e),
}
```

+ `?`宏
    + 可以自动调用from做错误类型转换
```rust
use std::fs::File;
use std::io;
use std::io::Read;

fn read_username_from_file() -> Result<String, io::Error> {
    let mut f = File::open("hello.txt")?;
    let mut s = String::new();
    f.read_to_string(&mut s)?;
    Ok(s)
}

//?相当于
let mut f = match f {
    // 打开文件成功，将file句柄赋值给f
    Ok(file) => file,
    // 打开文件失败，将错误返回(向上传播)
    Err(e) => return Err(e),
};

```

+ `?`支持链式调用
```rust
use std::fs::File;
use std::io;
use std::io::Read;
fn read_username_from_file() -> Result<String, io::Error> {
    let mut s = String::new();

    File::open("hello.txt")?.read_to_string(&mut s)?;

    Ok(s)
}


use std::fs;
use std::io;

fn read_username_from_file() -> Result<String, io::Error> {
    // read_to_string是定义在std::io中的方法，因此需要在上面进行引用
    fs::read_to_string("hello.txt")
}

```

+ `?`可以作用于option
```rust
fn first(arr: &[i32]) -> Option<&i32> {
    //如果是None则直接返回
   let v = arr.get(0)?;
   Some(v)
}

fn last_char_of_first_line(text: &str) -> Option<char> {
    text.lines().next()?.chars().last()
}
```