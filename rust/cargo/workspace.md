
# cargo workspace

+ 一个workspace下管理多个crate项目
    + 每个crate项目有独立cargo.toml
    + crate项目可能会引用其他crate项目，有依赖关系

+ 复杂项目可以拆分成多个crate，通过workspace统一管理

## principle
+ 由多个package(项目)组成
+ 共享同一个cargo.lock文件和输出目录（workspace root/target）
+ 只有workspace root/Cargo.toml才能包含[patch],[replace]和[profile.*]

## root package

+ cargo.toml同时包含了：
    + [package]
    + [workspace]

## virtual manifest
+ Cargo.toml中只有[workspace]

## sample
```rust
[workspace]
members = ["member1", "path/to/member2", "crates/*"]
exclude = ["crates/foo", "path/to/other"]
```