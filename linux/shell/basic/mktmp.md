
# mktemp

+ 安全创建临时文件

## cmd

+ `TMPFILE=$(mktemp)` 创建临时文件
    + `TMPFILE=$(mktemp) || exit 1`

+ `mktemp` 
    + `-d` 创建临时文件夹
    + `-p` 可以指定临时文件所在的目录
        + 默认$TMPDIR所指定的目录或`/tmp`
        + `mktemp -p /home/fan/`
    + `-t` 指定临时文件的文件名模板
        + `mktemp -t mytemp.XXXXXXX` 六个随机

+ `trap 'rm -f "$TMPFILE"' EXIT` 脚本遇到 EXIT信号时执行 `rm -f`
    + 加在脚本开头

## ref

+ [Bash 脚本如何创建临时文件：mktemp 命令和 trap 命令教程](https://www.ruanyifeng.com/blog/2019/12/mktemp.html)