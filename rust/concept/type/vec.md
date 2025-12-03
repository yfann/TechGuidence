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

## set vec
```rust
let mut v = vec![1, 2, 3];
v.push(4);      // 加
v.pop();        // 删最后一个
v[0] = 10;      // 改

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