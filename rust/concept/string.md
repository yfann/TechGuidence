
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

## slice
+ 类型： `&str`
```rust
let s = String::from("hello world");

let hello = &s[0..5];
let world = &s[6..11];

let slice = &s[..2];
let slice = &s[4..];
```

+ 字符串字面量是切片 `&str`

## String和&str互转
+ &str to String
```rust
String::from("hello,world")
"hello,world".to_string()
```

+ String to &str
    + deref 隐式强制转换
```rust

let s = String::from("hello,world!");
//转&str
say_hello(&s);
say_hello(&s[..]);
say_hello(s.as_str());


fn say_hello(s: &str) {
    println!("{}",s);
}
```

## push
+ 在原字符串上修改必须有`mut`
```rust
fn main() {
    let mut s = String::from("Hello ");

    s.push_str("rust");
    println!("追加字符串 push_str() -> {}", s);

    s.push('!');
    println!("追加字符 push() -> {}", s);
}
```

## insert
```rust
fn main() {
    let mut s = String::from("Hello rust!");
    s.insert(5, ',');
    println!("插入字符 insert() -> {}", s);
    s.insert_str(6, " I like");
    println!("插入字符串 insert_str() -> {}", s);
}
```

## replace
+ 产生新的字符串 
```rust
fn main() {
    let string_replace = String::from("I like rust. Learning rust is my favorite!");
    let new_string_replace = string_replace.replace("rust", "RUST");
    // let new_string_replace = string_replace.replacen("rust", "RUST",1);
    // string_replace_range.replace_range(7..8, "R");
    dbg!(new_string_replace);
}
```

## delete
+ 修改自身需要mut
+ pop
+ remove
+ truncate
+ clear

## concatenate
+ 要求右边是`&str`,相当于调用add(),产生新字符串，左侧的字符串所有权发生move
```rust
fn main() {
    let string_append = String::from("hello ");
    let string_rust = String::from("rust");
    // &string_rust会自动解引用为&str
    let result = string_append + &string_rust;
    let mut result = result + "!"; // `result + "!"` 中的 `result` 是不可变的
    result += "!!!";

    println!("连接字符串 + -> {}", result);
}
```

## format
+ `let s = format!("{} {}!", s1, s2);`

## 字符串转义
+ `"\u{211D}"`
+ `\x52\x75\x73\x74`
+ `let raw_str = r"Escapes don't work here: \x3F \u{211D}";` 不转
+ `let quotes = r#"And then I said: "There is no escape!""#;` 字符串中有双引号
+ ` let longer_delimiter = r###"A string with "# in it. And even "##!"###;`字符串中有#号

## utf8的处理
+ 遍历UTF8
```rust

for c in "中国人".chars() {
    println!("{}", c);
}

for b in "中国人".bytes() {
    println!("{}", b);
}


```

+ 取子串
    + utf8_slice

## tips
+ 字符串的底层的数据存储格式实际上是[ u8 ]
+ string无法用索引去取字符，可能取出半个字符
    + 对应中文字符，切片操作比较危险