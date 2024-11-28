## cli practice

+ bash控制台正确返回0，错误返回1
```bash
false
echo $? 
# 1
```

+ `--`
    + 之后的内容都可以当做参数，而不是命令的一部分
```rust
cargo run -- -n Hello world
```

+ `-h` -后面一般是缩写
    + `--help` --后面一般是全称


+ flag
    + 例如:`-n`,`-h` 不会接受参数
    + 作为开关

+ positional arguments
    + 参数的意义和位置有关