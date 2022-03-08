# trap

+ `trap` 脚本中捕捉系统信号,例如`ctrl + c`

+ `trap -l` 列出所有信号

+ `trap [动作] [信号]`
    + `trap 'rm -f "$TMPFILE"' EXIT` 脚本遇到 EXIT信号时执行 `rm -f`
        + 必须放在脚本开头

## ref
+ [https://www.ruanyifeng.com/blog/2019/12/mktemp.html](https://www.ruanyifeng.com/blog/2019/12/mktemp.html)