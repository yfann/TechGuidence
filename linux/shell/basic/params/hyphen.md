
# dash

+ `-`  一般表示stdin输入作为文件内容，一般由命令工具自身实现
    + `echo "asb" | cat -`
        + `man cat`
            + If file is a single dash (`-') or absent, cat reads from the standard input.


+ `cd -` 返回上级目录


## `--` vs `-`

+ `command -[option][option]...`
    + 有的option可以带arguments

+ `--` 代表option的结束,`--`后面为arguments
    + `grep -- -v file`
        + `-v` 作为查询字符串而不是option

+ An argument of - is equivalent to --