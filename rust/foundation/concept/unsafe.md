# rust unsafe

+ 绕过编译器
    + 编译器可能误报

+ rust是系统编程，可能一些底层操作是不安全的

+ 和c交互(FFI)

+ 缩小unsafe语句块的边界

## 解引用裸指针
+ raw pointer(裸指针)
    + `*const T`
    + `*mut T`
    + 可以绕过rust的借用规则
    + 可以是null
    + 内存不一定合法
    + 不能自动回收

+ 创建裸指针
```rust
let mut num = 5;
//创建裸指针是安全的
let r1 = &num as *const i32;
let r2 = &mut num as *mut i32;

//直接根据地质创建，危险!
let address = 0x012345usize;
let r = address as *const i32;

//根据智能指针创建裸指针
let a: Box<i32> = Box::new(10);
// 需要先解引用a
let b: *const i32 = &*a;
// 使用 into_raw 来创建
let c: *const i32 = Box::into_raw(a);

```

+ `*`解引用裸指针时要用unsafe
```rust
let a = 1;
let b: *const i32 = &a as *const i32;
let c: *const i32 = &a;
unsafe {
    println!("{}", *c);
}
```

## 调用一个 unsafe 或外部的函数

+  unsafe 函数体中使用 unsafe 语句块是多余的行为
```rust
unsafe fn dangerous() {}

unsafe {
    dangerous();
}

```
+ 安全抽象包裹unsafe代码
```rust
use std::slice;

fn split_at_mut(slice: &mut [i32], mid: usize) -> (&mut [i32], &mut [i32]) {
    let len = slice.len();
    let ptr = slice.as_mut_ptr();

    assert!(mid <= len);

    unsafe {
        (
            slice::from_raw_parts_mut(ptr, mid),
            slice::from_raw_parts_mut(ptr.add(mid), len - mid),
        )
    }
}

fn main() {
    let mut v = vec![1, 2, 3, 4, 5, 6];

    let r = &mut v[..];

    let (a, b) = split_at_mut(r, 3);

    assert_eq!(a, &mut [1, 2, 3]);
    assert_eq!(b, &mut [4, 5, 6]);
}
```
+ FFI（Foreign Function Interface）
    + 调用外部函数
```rust
extern "C" {
    fn abs(input: i32) -> i32; //ABI (Application Binary Interface)
}

fn main() {
    unsafe {
        println!("Absolute value of -3 according to C: {}", abs(-3));
    }
}
//c可以调用rust的call_from_c函数
#[no_mangle]
pub extern "C" fn call_from_c() {
    println!("Just called a Rust function from C!");
}
```

## 访问或修改一个可变的静态变量
## 实现一个 unsafe 特征
+ Send 特征标记为 unsafe 是因为 Rust 无法验证我们的类型是否能在线程间安全的传递，因此就需要通过 unsafe 来告诉编译器
    + 需要自己保证安全性

## 访问 union 中的字段
+ union主要和c交互
    + 所有字段都共享同一个存储空间
```rust
#[repr(C)]
union MyUnion {
    f1: u32,
    f2: f32,
}

```

## tips
+ rust-bindgen 
    + rust->C

+ cbindgen
    + c->rust

+ cxx
    + 和c++交互

+ Miri
    + Rust 代码首先会被编译为 MIR ，然后再提交给 LLVM 进行处理