# rust cli

## std::process

+ exit
```rust
// success
std::process::exit(0);
// fail
std::process::abort();
```


+ cmd
```rust
use std::process::Command;
let mut cmd = Command::new("ls");
let res = cmd.output();

```


## std::env

```rust
println!("{:?}",std::env::args());
```

## libs
+ clap
    + command line args parser


## ref
+ [args](https://doc.rust-lang.org/stable/std/env/struct.Args.html)