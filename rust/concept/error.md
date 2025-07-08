# rust error handling
+ rust没有try catch,用result进行错误传播和处理

## Result
```rust
enum Result<T, E> {
    Ok(T),      // 操作成功时, 返回结果 T
    Err(E),     // 操作失败时, 返回错误类型 E
}
```

## `?`
+ 错误传播
    + 使用 ? 的函数必须返回 Result 或 Option 类型。
        + 如果尝试在不返回这些类型的函数中使用 ?，会导致编译错误。
    + 遇到Err直接返回

+ 解包Result,如果是Ok取其中值，如果是Err,将错误返回给调用者
```rust
fn read_file(path: &str) -> std::io::Result<String> {
    let content = std::fs::read_to_string(path)?; // 如果读取成功，返回内容
    Ok(content)
}
// 同
fn read_file(path: &str) -> std::io::Result<String> {
    let content = match std::fs::read_to_string(path) {
        Ok(content) => content,
        Err(err) => return Err(err), // 如果出错，直接返回
    };
    Ok(content)
}

```

+ 解包Option,解包 Some，而当值是 None 时，会提前返回一个 None
```rust
fn get_value(map: &std::collections::HashMap<String, String>, key: &str) -> Option<String> {
    let value = map.get(key)?.clone(); // 如果键存在，返回对应值
    Some(value)
}

```

+ 当处理 Result 时，? 操作符会自动将错误转换为调用函数的返回错误类型。这是通过 From 特性实现的，确保不同错误类型之间可以兼容。
```rust
use std::io::{self, Read};

fn read_file_and_process(path: &str) -> Result<String, Box<dyn std::error::Error>> {
    let mut file = std::fs::File::open(path)?; // std::io::Error 会自动转换为 Box<dyn std::error::Error>
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

```

+ `or()`
    + 若任何一个表达式的结果是 Some 或 Ok，则该值会立刻返回

+ `and()`

+ `or_else()`
+ `and_then()`

## unwrap
+ 从Result<T,E>中获取值
    + 如果 Result 是 Ok(T), 则返回 T;
    + 如果 Result 是 Err(E), 则程序会崩溃并打印错误信息。

## expect
+ 与unwrap类似，但会返回自定义的错误
```rust
let data = serde_json::to_string(todos).expect("序列化失败");


```

## match处理Result
```rust
pub fn save_todo_list(save_file: &str, todos: &Vec<TodoItem>) {
  match serde_json::to_string(todos) {
    Ok(data) => match fs::write(save_file, data) {
      Err(msg) => {
        println!("save file error: {}", msg);
      }
      Ok(_) => {
        println!("save file success");
      }
    },
    Err(msg) => {
      println!("save file error: {}", msg);
    }
  }
}
```