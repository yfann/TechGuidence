
## statement, expression
+ 表达式
    + 有返回值
    + 不以分号结尾
    + 函数调用也是表达式
    + 表达式不返回值，会隐式的返回`()`
```rust
fn add_with_extra(x: i32, y: i32) -> i32 {
    let x = x + 1; // 语句
    let y = y + 5; // 语句
    x + y // 表达式
}

fn ret_unit_type() {
    let x = 1;
    // if 语句块也是一个表达式，因此可以用于赋值，也可以直接返回
    // 类似三元运算符，在Rust里我们可以这样写
    let y = if x % 2 == 1 {
        "odd"
    } else {
        "even"
    };
    // 或者写成一行
    let z = if x % 2 == 1 { "odd" } else { "even" };
}
```


## fn
```rust
fn add(i: i32, j: i32) -> i32 {
   i + j
 }

fn plus_or_minus(x:i32) -> i32 {
    if x > 5 {
        return x - 5
    }

    x + 5
}

```

## diverge function
+ 函数永不返回
```rust
fn forever() -> ! {
  loop {
    //...
  };
}
```
## tips
+ 蛇形命名
+ rust是静态语言，参数要标出类型
+ 无返回值的函数，会返回`()`