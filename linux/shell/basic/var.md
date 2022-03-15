# Bash变量

+ 区分大小写

## 环境变量
<!-- 查看环境变量 -->
+ `env` 
+ `printenv`
+ `printenv PATH`
+ `echo $PATH`

## 自定义变量
+ `set` 显示所有变量(环境变量和自定义变量)
<!-- 声明变量 -->
+ variable=value
    + `foo=1;bar=2`
    + 不能有空格
        + `myvar="hello world"`
    + 类型都为字符串
    + 可以转义
        + `d="\t\ta string\n" `
        + `echo The total is \$100.00`
    + 表达式 
        + `e=$(ls -l foo.txt)`
        + `f=$((5 * 7))`
<!-- 读取变量 -->
+ `echo $foo` 
    + `echo ${a}_file`
    + 变量不存在，会输出空字符
    + ` myvar=USER;echo ${!myvar}`

 <!-- 删除变量 -->
+ `unset NAME`
+ `foo=''`
    + `foo=`

<!-- 导出变量 -->
+ `export NAME=value`
    + 变量NAME赋值并导出
    + 用户创建的变量只能在当前shell，子shell无法访问
        + 变量需要export使子shell可以访问，导出的变量对子shell来说是环境变量
            + 子 Shell 如果修改继承的变量，不会影响父 Shell
+ `bash` 新建子shell
    + `exit` 退出子shell

## 特殊变量

+ `$?` 上一个命令的退出码，0为成功

+ `$$` 当前shell的pid

+ `$_`上个命令的最后一个参数

+ `$!` 最近一个后台执行的异步命令的pid

+ `$0` 当前shell名称

+ `$-` 当前shell的启动参数

+ `$#` 脚本参数数量

+ `$@` 脚本参数

## default value

+ `${count:-0}` 如果count不存在(或为空)则返回0

+ `${count:=0}` 如果count不存在(或为空)则执行`count=0`并返回0

+ `${count:+1}` 如果count存在(不为空)则返回1，否则返回空

+ `${count:?"undefined!"}` 变量count未定义时就中断执行，抛出错误，返回给定的报错信息undefined!
    + `filename=${1:?"filename missing."}`

## declare
+ `declare`
    + 同`set`

+ `declare OPTION VARIABLE=value`
    + 可以声明特殊类型变量

+ declare命令如果用在函数中，声明的变量只在函数内部有效，等同于local命令。

## readonly

+ `readonly foo=1`
    + 同`declare -r foo`

+ `-f` 变量为函数名
+ `-p` 打印所有只读变量
+ `-a` 变量为数组

## let
+ 声明变量时算数运算

+ `let foo=1+2`

+ `let "foo = 1 + 2"` 带空格时

+ `let "v1 = 1" "v2 = v1++"` 多变量赋值
    + `echo $v1,$v2`



## tips

+ local
    + 函数中定义只在函数范围内可见

## ref
+ [Bash 变量](https://wangdoc.com/bash/variable.html)