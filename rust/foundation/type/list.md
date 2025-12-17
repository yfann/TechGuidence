
## array
+ 存在栈上
```rust
let a = [1, 2, 3, 4, 5];
let a: [i32; 5] = [1, 2, 3, 4, 5];
let a = [3; 5]; //3出现5次
let array: [String; 8] = std::array::from_fn(|_i| String::from("rust is good!")); //String出现8次

let first = a[0]; // 获取a数组第一个元素
```
+ slice
    + `&[i32]`

```rust
let slice: &[i32] = &a[1..3];
assert_eq!(slice, &[2, 3]);
```

## Vector
+ 动态长度
+ 存在堆上