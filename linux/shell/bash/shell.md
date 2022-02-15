# shell

+ `#!` shebang

+ `sh` bourne shell
    + `sh -c <cmd>`  
        + shell form
        + command is run in a shell
        + 加载sh,sh编译并执行<cmd>部分
    + `-c` string If  the  -c  option  is  present, then commands are read from
          string.  If there are arguments after the  string,  they  are
          assigned to the positional parameters, starting with $0.

+ `cmd1 && cmd2`
    + cmd1退出时 cmd2才执行
    + `cmd1; cmd2` 按顺序执行不管cmd1是否退出

+ `type -a <cmd>` 查看命令位置
    + `type <cmd>` 查看是否为内部命令

+ `man bash` 帮助

## shotcut

+ `k`+[tab]+[tab]
    + 列出k开头的命令

+ `ctrl + u/k` 删除光标前后内容

+ `ctrl + a/e` 光标前后移动


## globbing(glob pattern)

+ `~`
    + `echo ~`

+ `?` 一个字符
    + `ls ?.txt`

+ `*`

+ `.*` 匹配隐藏文件
    + `echo .*`

+ `ls [ab].txt`
<!-- 变量 -->
+ `echo $SHELL`
    + `echo ${SHELL}`
+ `echo ${!S*}` S开头的变量名
<!-- 命令 -->
+ `echo $(date)`
    + echo `date` 反引号写法
+ `$(ls $(pwd))`
+ `echo $((2 + 2))`

## `--` vs `-`

+ `command -[option][option]...`
    + 有的option可以带arguments

+ `--` 代表option的结束,`--`后面为arguments
    + `grep -- -v file`
        + `-v` 作为查询字符串而不是option

+ An argument of - is equivalent to --


## ref
+ [Shell 教程](https://www.runoob.com/linux/linux-shell.html)
+ [bash 教程](https://wangdoc.com/bash/intro.html)
+ [online shell](https://www.runoob.com/try/runcode.php?filename=helloworld&type=bash)
+ [编写Shell 脚本编程最佳实践](https://zhuanlan.zhihu.com/p/264120455)

<!-- 参数 -->
+ [Shell 传递参数](https://www.runoob.com/linux/linux-shell-passing-arguments.html)

<!-- issues -->
+ [解决shell脚本“syntax error near unexpected token `fi'”的问题。](https://blog.csdn.net/jsqfengbao/article/details/95597260)