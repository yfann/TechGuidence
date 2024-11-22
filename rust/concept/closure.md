# rust closure

```rust
fn main() {
   let x = 1;
   let sum = |y| x + y; //y是入参，x是调用者作用域中的值

    assert_eq!(3, sum(2));
}
```