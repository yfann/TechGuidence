# Rust Iterator

+ Iterator特征
```rust
pub trait Iterator {
    type Item;

    fn next(&mut self) -> Option<Self::Item>;

    // 省略其余有默认实现的方法
}

impl<I: Iterator> IntoIterator for I {
    type Item = I::Item;
    type IntoIter = I;

    #[inline]
    fn into_iter(self) -> I {
        self
    }
}

```
<!-- 实现 -->
```rust
fn main() {
    let arr = [1, 2, 3];
    let mut arr_iter = arr.into_iter();

    assert_eq!(arr_iter.next(), Some(1));
    assert_eq!(arr_iter.next(), Some(2));
    assert_eq!(arr_iter.next(), Some(3));
    assert_eq!(arr_iter.next(), None);
}
```

## 迭代器
+ 是惰性的
+ 种类
    + into_iter 会夺走所有权
    + iter 是借用
    + iter_mut 是可变借用
+ `enumerate`

## 消费者适配器
+ 消费者是迭代器上的方法，它会消费掉迭代器中的元素，然后返回其类型的值
    + 内部会调用next
+ `sum`
+ `collect`
    + 将一个迭代器中的元素收集到指定类型中

## 迭代器适配器
+ 返回一个新的迭代器
+ 迭代器适配器是惰性的，意味着你需要一个消费者适配器来收尾，最终将迭代器转换成一个具体的值
+ 闭包作为参数
+ `v.iter().map().filter()`
    + `let v2: Vec<_> = v1.iter().map(|x| x + 1).collect();`
+ `zip`
    + 将两个元素组成tuple
+ `filter`