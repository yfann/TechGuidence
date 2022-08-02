# rust method

+ 可以为struct,enum添加方法

## option


+ 只有Option<T>可以为空，T没有空值
+ Option<i8> 与 i8是不同的类型
    + Option<i8>可以为None
```rust
enum Option<T> {
    Some(T),
    None,
}

// 包含在prelude中，可以直接使用Some,None,无需Option::前缀
let some_string = Some("a string");
let absent_number: Option<i32> = None;

// match语句中使用option
fn plus_one(x: Option<i32>) -> Option<i32> {
    match x {
        None => None,
        Some(i) => Some(i + 1),
    }
}


//报错，some_option_value可能为None
let Some(x) = some_option_value;

```