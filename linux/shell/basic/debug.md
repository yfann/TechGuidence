
## check
+ `echo rm *` 显示要删除的内容

+ `bash -x script.sh` 显示执行的命令
    + `#! /bin/bash -x` 可以写在script头部

+ `$LINENO` 行号

+ `${FUNCNAME[0]}` 函数栈，0 当前函数， 1 当前函数的调用者

+ `${BASH_SOURCE[0]}` 脚本调用栈

## log

+ `x=1;while true; do echo $x;x=$(($x+1));sleep 1;done 2>&1 | tee debug.log`

## ref

+ [脚本除错](https://wangdoc.com/bash/debug.html)