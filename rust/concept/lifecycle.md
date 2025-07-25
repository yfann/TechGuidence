
# rust lifecycle(生命周期)
+ 编译期概念, 用于检查引用是否合法, 避免悬垂指针等问题
    + 通常情况下, 我们不需要手动标注生命周期, 编译器会自动推导。 只有当编译器无法确定时, 才需要手动标注。

+ 引用的有效作用域
    + 每个引用类型都有生命周期



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
+ 语法类似于泛型
+ 相当于为编译器写注释，好顺利通过编译
```rust
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

```
+ 函数的返回值如果是一个引用类型，那么它的生命周期只会来源于：
    + 函数参数的生命周期
    + 函数体中某个新建引用的生命周期


## 结构体生命周期
+ 为结构体中的引用字段标记生命周期
    + 字段的生命周期要大于等于结构体
```rust
struct ImportantExcerpt<'a> {
    part: &'a str,
}

fn main() {
    let novel = String::from("Call me Ishmael. Some years ago...");
    let first_sentence = novel.split('.').next().expect("Could not find a '.'");
    let i = ImportantExcerpt {
        part: first_sentence,
    };
}
```

## 方法中的生命周期
```rust
//'a: 'b，是生命周期约束语法，跟泛型约束非常相似，用于说明 'a 必须比 'b 活得久
impl<'a: 'b, 'b> ImportantExcerpt<'a> {
    fn announce_and_return_part(&'a self, announcement: &'b str) -> &'b str {
        println!("Attention please: {}", announcement);
        self.part
    }
}

```

## 静态生命周期
+ `'static`，拥有该生命周期的引用可以和整个程序活得一样久
+ 字面量和特征都有'static 生命周期
+ 实在遇到解决不了的生命周期标注问题，可以尝试 T: 'static

## tips
+ Borrow checker
+ 参数的生命周期被称为 输入生命周期，返回值的生命周期被称为 输出生命周期
+ 不需要标注生命周期的情况,编译器自动标注生命周期
    + 每一个引用参数都会获得独自的生命周期
        + `fn foo<'a, 'b>(x: &'a i32, y: &'b i32)`
    + 若只有一个输入生命周期（函数参数中只有一个引用类型），那么该生命周期会被赋给所有的输出生命周期
        + `fn foo(x: &i32) -> &i32`
            + `fn foo<'a>(x: &'a i32) -> &'a i32`
    + 若存在多个输入生命周期，且其中一个是 &self 或 &mut self，则 &self 的生命周期被赋给所有的输出生命周期
