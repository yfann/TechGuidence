# rust type


## 数值类型转换

+ `as`
    + `as_mut_ptr()`
```rust
  let a: i32 = 10;
  let b: u16 = 100;

  if a < (b as i32) {...}
```

+ `try_into()`

```rust
let b: i16 = 1500;
let b_: u8 = match b.try_into() {
    Ok(b1) => b1,
    Err(e) => {
        println!("{:?}", e.to_string());
        0
    }
};
```