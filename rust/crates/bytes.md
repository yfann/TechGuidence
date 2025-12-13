## bytes crate
+ `use bytes::{Bytes, BytesMut};`
+ 高效
    + zero-copy
        + Bytes::clone() 不拷贝底层内存，只增加引用计数
        + Bytes::split() 不复制底层数组,只移动指针
    + 适合网络协议,异步IO(Tokio)


## Bytes
+ immutable buffer
    + 不可变、零拷贝、共享底层内存
    + 类似`Arc<[u8]>`
+ example
```rust
use bytes::Bytes;

let b = Bytes::from("hello");
let b2 = b.clone();  // 零拷贝

```

+ zero-copy
    + 底层数据存在 Arc（引用计数）中
        + 多个 Bytes 共享同一份底层内存，clone 不会复制内存，只会增加引用计数。
        + 每个 Bytes 只是“视图”，不存数据
            + ptr: 指向底层缓冲区 + 偏移量
            + len: 当前视图长度
            + arc: 底层共享的引用计数指针
        

## BytesMut
+ 可变byte buffer
    + 可变、可增长、效率高、可转为 Bytes
    + 类似`Vec<u8>`
```rust
use bytes::BytesMut;

let mut buf = BytesMut::with_capacity(64);
buf.extend_from_slice(b"hello ");
buf.extend_from_slice(b"world");

let bytes = buf.freeze();  // 转成 Bytes（只发生一次拷贝）

```

## BytesMut vs Vec<u8>
+ Vec<u8>
    + 独占内存（有所有权）
    + clone()是深拷贝
+ BytesMut
    + 为 网络编程/异步 IO 专门优化
    + 内部结构为 可增长的 ring buffer / sliding buffer
    + 可以高效 split / split_off，不复制数据