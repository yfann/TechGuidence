# anyhow
+ 简化错误处理
+ `anyhow::Result<T>`替代Result<T, std::io::Error>
+ `std::io::Error`会自动转换为`anyhow::Error`
+ `context`附加错误信息
```rust
use anyhow::{Context, Result};
use std::fs::File;

fn read_file() -> Result<()> {
    let _file = File::open("non_existent_file.txt")
        .with_context(|| "Failed to open the file")?; // 提供额外的上下文信息
    Ok(())
}

fn main() -> Result<()> {
    read_file()?;
    Ok(())
}


```

+ `anyhow!("error message")`创建错误
```rust
 return Err(anyhow!("This is an error with a simple message"));
```

+ `RUST_BACKTRACE=1 cargo run`
    + 打印回溯错误