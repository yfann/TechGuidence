# borrowing

## borrowing(借用，引用)
+ 同一时间 只能有一个可变引用，或者 多个不可变引用，不能同时混用。

```rust
fn main() {
    let x = 5;
    let y = &x;

    assert_eq!(5, x);
    assert_eq!(5, *y);
}
```

+ 符号
    + `&T` 	不可变引用
    + `&mut T` 可变引用
    + `&x` 对x的引用
    + `*x` 解引用，访问引用背后的值




### 不可变引用(borrowing)
+ 所有权不发生转移
+ 不能修改值
```rust
fn main() {
    let s1 = String::from("hello");

    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
```

### 可变引用(borrowing)
+ 同一作用域，特定数据只能有一个可变引用
    + 避免数据竞争
```rust
fn main() {
    let mut s = String::from("hello");

    change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}

let mut s = String::from("hello");

let r1 = &mut s;
let r2 = &mut s;//报错，只能有一个可变引用
```
+ 可变不可变引用不能同时存在
```rust
let mut s = String::from("hello");

let r1 = &s; // 没问题
let r2 = &s; // 没问题
let r3 = &mut s; // 大问题

println!("{}, {}, and {}", r1, r2, r3);

```


## 悬垂引用(Dangling References)
+ 悬垂引用也叫做悬垂指针，意思为指针指向某个值后，这个值被释放掉了，而指针仍然存在，其指向的内存可能不存在任何值或已被其它变量重新使用
+ rust编译器会阻止这种情况发生
```rust
fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String {
    let s = String::from("hello");

    &s
}
```

## auto-borrowing
+ 当你调用方法或传参时，参数期望的是 &T，而你传的是 T，Rust 会自动加上 &。
```rust
let s = String::from("hello");
println!("{}", s); //会自动变成&s, &String->&str
```


## 转换
+ `to_owned()`
    + 引用转所有
    + 总是创建新的
    + 例如：
        + `&str -> String`
        + `&[T] -> Vec<T>`
        + `&Path -> PathBuf`
+ AsRef traint
    + 借用转换（返回引用），零成本，不消耗所有权
    + &self → &T
```rust
impl AsRef<Path> for String {
    fn as_ref(&self) -> &Path {
        Path::new(&self)
    }
}

fn foo<P: AsRef<Path>>(p: P) {
    let path: &Path = p.as_ref();
}
// String 可以转为 &Path
```
+ Into traint
    + 拥有转换（返回新值），可能分配，消耗所有权。
    + self → T
```rust
pub trait Into<T> {
    fn into(self) -> T;
}


let pb: PathBuf = "abc.txt".into();

```


## tips
+ Rust 只有在方法调用、函数参数、宏传参等场景会自动加 & 或 *