# trait

+ 特征定义了一个可以被共享的行为，只要实现了特征，你就能使用该行为
+ 类似接口
+ 特征中可以定义具有默认实现的方法

## code

<!-- 基本使用 -->
```rust
pub trait Summary {
    fn summarize(&self) -> String;
}
pub struct Post {
    pub title: String, // 标题
    pub author: String, // 作者
    pub content: String, // 内容
}

impl Summary for Post {
    fn summarize(&self) -> String {
        format!("文章{}, 作者是{}", self.title, self.author)
    }
}
```

<!-- 默认实现 -->
```rust
pub trait Summary {
    fn summarize_author(&self) -> String;

    fn summarize(&self) -> String {
        format!("(Read more from {}...)", self.summarize_author())
    }
}

impl Summary for Weibo {
    fn summarize_author(&self) -> String {
        format!("@{}", self.username)
    }
}
println!("1 new weibo: {}", weibo.summarize());
```



<!-- 特征作为参数 -->
```rust
pub fn notify(item: &impl Summary) {
    println!("Breaking news! {}", item.summarize());
}

pub fn notify(item: &(impl Summary + Display)) {}

fn some_function<T, U>(t: &T, u: &U) -> i32
    where T: Display + Clone,
          U: Clone + Debug
{}

// 特征约束(trait bound)

pub fn notify<T: Summary>(item: &T) {
    println!("Breaking news! {}", item.summarize());
}
```


<!-- 特征对象 -->
```rust
trait Draw {
    fn draw(&self) -> String;
}

impl Draw for u8 {
    fn draw(&self) -> String {
        format!("u8: {}", *self)
    }
}

fn draw1(x: Box<dyn Draw>) {
    // 由于实现了 Deref 特征，Box 智能指针会自动解引用为它所包裹的值，然后调用该值对应的类型上定义的 `draw` 方法
    x.draw();
}

fn draw2(x: &dyn Draw) {
    x.draw();
}

let x = 1.1f64;
let y = 8u8;
draw1(Box::new(x));
draw1(Box::new(y));
```

## 特征对象

+ 特征对象大小不固定
    + 实现特征的对象可以不同

+ 总是使用特征对象的引用方式
    + `&dyn Draw`,`Box<dyn Draw>`
    + 特征对象的引用
        + `ptr`
            + 指向实现了特征的具体类型的实例
                + Button 或类型 SelectBox 的实例对
        + `vptr`
            + 指向虚表`vtable`
                + 保存了类型 Button 或类型 SelectBox 的实例对于可以调用的实现于特征 Draw 的方法

## self vs Self

+ self
    + 当前实例
    + button.draw() 中的 button 实例

+ Self
    + 指代特征或者方法类型的别名
    + 指代Button类型

```rust
trait Draw {
    fn draw(&self) -> Self;
}

#[derive(Clone)]
struct Button;
impl Draw for Button {
    fn draw(&self) -> Self {
        return self.clone()
    }
}

fn main() {
    let button = Button;
    let newb = button.draw();
}

```

## 对象安全的特征
+ 才能拥有特征对象（因为一旦有了特征对象，就不再需要知道实现该特征的具体类型是什么了）
    + 方法的返回类型不能是 Self
    + 方法没有任何泛型参数

```rust
// 不符合对象安全
pub trait Clone {
    fn clone(&self) -> Self;
}
// 报错
pub struct Screen {
    pub components: Vec<Box<dyn Clone>>,
}
```

## tips

+ `dyn`只用在特征对象的类型声明上
+ 鸭子类型
    + `Box::new` 把实现了Draw特征的对象包装成`Box<dyn Draw>`

## ref
+ [特征 Trait](https://course.rs/basic/trait/trait.html)