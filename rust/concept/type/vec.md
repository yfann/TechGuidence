# Vec
+ 连续内存
+ 自动扩容（倍增）
+ 三个字段：指针 + 长度 + 容量
+ 和 String 共用底层（都是基于 Vec<u8>）

## init vec
```rust
let v=vec![1,2,3];

let mut v = Vec::new();
v.push(10);
v.push(20);


let mut v = Vec::with_capacity(100);
```

## get vec
```rust
let v = vec![1, 2, 3];
println!("{}", v[0]);


if let Some(x) = v.get(1) {
    println!("{}", x);
}
```

## update vec
```rust
let mut v = vec![1, 2, 3];
v.push(4);      // 加
v.pop();        // 删最后一个
v[0] = 10;      // 改
v.extend(&[2, 3]);
```

## 遍历vec
```rust
let v = vec![10, 20, 30];

// 不可变遍历
for x in &v {
    println!("{}", x);
}

// 可变遍历
for x in &mut v {
    *x *= 2;
}
```

## Vec<u8>
+ 内存缓存区(可增长的字节数组)
+ write_all
    + 实现Write trait
    + 写入原始字节
    + 底层循环调用write直到数据都写入或出错
```rust
use std::io::{self, Write};

fn main() -> io::Result<()> {
    let mut buf = Vec::new();
    let data = [1, 2, 3, 4];

    // write 可能写不全（Vec 一般写全，网络流可能写半）
    let n = buf.write(&data)?;
    println!("write 写入了 {} 个字节", n);

    // write_all 保证写满
    buf.write_all(&data)?;
    println!("write_all 写入成功，长度 {}", buf.len());

    Ok(())
}
```