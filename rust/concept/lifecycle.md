
# lifecycle

+ 引用的作用范围
+ 编译器自动推导

## 悬垂指针


```rust
{
    let r;

    {
        let x = 5;
        r = &x;
    }

    println!("r: {}", r);
}

```

## 标注生命周期
+ 


## tips
+ Borrow checker