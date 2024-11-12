

## if else
+ ifelse是表达式可以赋值
```rust
fn main() {
    let condition = true;
    let number = if condition {
        5
    } else {
        6
    };

    println!("The value of number is: {}", number);
}
```

## 循环
+ for
    + `for item in IntoIterator::into_iter(collection)` 转移所有权
        + for item in collection
    + `for item in collection.iter()` 不可变借用
        + for item in &collection
    + `for item in collection.iter_mut()` 可变借用
        + for item in &mut collection

```rust
    for i in 1..=5 {
        println!("{}", i);
    }

    for item in &container {
        // ...
    }

    for item in &mut collection {
  // ...
}

for _ in 0..10 {
  // ...
}

```

## while
```rust
fn main() {
    let mut n = 0;

    while n <= 5  {
        println!("{}!", n);

        n = n + 1;
    }

    println!("我出来了！");
}

```

## loop
+ 无条件循环
+ 是个表达式
```rust
    loop {
        if n > 5 {
            break
        }
        println!("{}", n);
        n+=1;
    }

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };
```

## tips
+ break可以返回一个值