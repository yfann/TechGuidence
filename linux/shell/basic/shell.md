# shell(operation)

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

+ `cd -` 返回上一次目录

+ `history`
    + 

## 转义换行(escape)

+ `echo -e "aa\nbb"` -e识别转义
+ `printf "aasdf\nbb\n"` 结尾不会自动加换行

## eval

```sh
a=master
eval ${a}=123
echo ${master}
```

## 括号

<!-- command substitution -->
+ "\`" 反引号和`$()` 相同，执行其中的命令，输出结果
    + 反引号嵌套时要转义 "\`"
    + 反引号中转义特殊字符要两个反斜杠，`$()`要一个反斜杠
```sh
echo date
echo `date`
echo $(date)

# command1 `command2 \`command3\``
# command1 $(command2 $(command3))

var1 = `echo \\$HOME`
var2 = $(echo \$HOME)
var3 = `echo $HOME`
echo $var1
echo $var2
echo $var3

# output:
# $HOME
# $HOME
# /home/fan
```

<!-- 变量替换 -->
+ `${}`
    + `$var`与`${var}`没区别，但后者可以界定变量范围
    + `${:}`与`${::}` 字符串提取
    + `${/}`第一个匹配的字符串替换,`${//}`全部替换
    + `${var//c/d}` replace c to d
```sh
a=123
echo ${a}b

# output:
# 123b
```

<!-- 条件 -->
+ `test expression`
+ `[expression]`
+ `[[expression]]` 支持正则
+ `((3 > 2))` 算数表达式

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


## Bang(!)命令

+ `!!` ：执行上一条命令。

+ `^foo^bar` ：把上一条命令里的foo替换为bar，并执行。

+ `!wget` ：执行最近的以wget开头的命令。

+ `!wget:p` ：仅打印最近的以wget开头的命令，不执行。

+ `!$` ：上一条命令的最后一个参数， 与 Alt - . 和 $_ 相同。

+ `!*` ：上一条命令的所有参数

+ `!*:p` ：打印上一条命令是所有参数，也即 !*的内容。

+ `^abc` ：删除上一条命令中的abc。

+ `!-n` ：执行前n条命令，执行上一条命令： !-1， 执行前5条命令的格式是： !-5



## shotcut

<!-- common -->
+ `k`+[tab]+[tab]
    + 列出k开头的命令
+ `ctrl + u/k` 删除光标前后内容
+ `ctrl + a/e` 光标前后移动

<!-- edit -->
+ `ctrl + U/K` 剪切光标前/后内容
    - `ctrl + Y`粘贴
+ `ctrl + w`删除光标前的单词
    - `alt + D`删除光标后的单词
+ `ctrl + H/D`删除光标左/右字符
+ `Ctrl + /`撤销
+ 删整行
    - `Ctrl + A + K`
    - `Ctrl + E + U`
    - `Ctrl + K + U`

<!-- history -->
+ `Ctrl + R` 搜索历史命令，随着输入会显示历史命令中的一条匹配命令，Enter键执行匹配命令；ESC键在命令行显示而不执行匹配命令。
    - `Ctrl + G`从历史搜索模式（Ctrl + R）退出。

<!-- control -->
+ `ctrl + L` clear
+ `ctrl + C` 终止
+ `Ctrl + S/Q`阻止/允许屏幕输出
+ `Ctrl + O` 执行当前命令

## ref
+ [Shell 教程](https://www.runoob.com/linux/linux-shell.html)
+ [bash 教程](wangdoc.com/bash/intro.html)
+ [online shell](https://www.runoob.com/try/runcode.php?filename=helloworld&type=bash)
+ [编写Shell 脚本编程最佳实践](https://zhuanlan.zhihu.com/p/264120455)
+ [Bash Reference Manual](https://www.gnu.org/software/bash/manual/html_node/index.html#SEC_Contents)

<!-- 参数 -->
+ [Shell 传递参数](https://www.runoob.com/linux/linux-shell-passing-arguments.html)

<!-- issues -->
+ [解决shell脚本“syntax error near unexpected token `fi'”的问题。](https://blog.csdn.net/jsqfengbao/article/details/95597260)

<!-- details -->
+ [Shell 反引号、$() 和 ${} 的区别](https://blog.csdn.net/K346K346/article/details/86748499)
+ [shell 中各种括号的作用()、(())、[]、[[]]、{}](https://www.runoob.com/w3cnote/linux-shell-brackets-features.html)
+ [eval 动态变量名](https://blog.csdn.net/feifei3851/article/details/90035606?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1.pc_relevant_default&utm_relevant_index=1)
