## 变量绑定
+ `let a = "hello world"`
    + 变量对内存声明所有权
    + 默认不可变

+ `let mut a=""`
    + 可变

+ `let a:i32=1`

+ `let _x = 5;`
    + 创建未使用的变量

+ `const MAX_POINTS: u32 = 100_000;`
    + 常量

## 变量解构
+ `let (a, mut b): (bool,bool) = (true, false);` 
+ `(a, b) = (1, 2);`
+ `[c, .., d, _] = [1, 2, 3, 4, 5];`

## 变量遮蔽(shadowing)
+ 产生内存再分配
    + 可以类型不同
```rust
fn main() {
    let x = 5;
    // 在main函数的作用域内对之前的x进行遮蔽
    let x = x + 1;

    {
        // 在当前的花括号作用域内，对之前的x进行遮蔽
        let x = x * 2;
        println!("The value of x in the inner scope is: {}", x);
    }

    println!("The value of x is: {}", x);
}
```

## as
+ 转型

## 单元类型
+ `（）`
    + 站位，不占内存
    + `fn main()`返回单元类型

## string
+ String
    + 堆中存储
```rust
let mut s = String::from("hello");
s.push_str(", world!"); // push_str() 在字符串后追加字面值
println!("{}", s); // 将打印 `hello, world!`
```

+ 字面量
    + 硬编码进程序里的字符串值
```rust
let s = "hello" //类型 &str
```

## tips
+ char是Unicode类型
    + 4字节
+ string是UTF-8
    + 每个字符（1-4）字节