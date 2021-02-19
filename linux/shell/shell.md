# shell

+ `sh` bourne shell
    + `sh -c <cmd>`  
        + 加载sh,sh编译并执行<cmd>部分
    + `-c` string If  the  -c  option  is  present, then commands are read from
          string.  If there are arguments after the  string,  they  are
          assigned to the positional parameters, starting with $0.

+ cmd1 && cmd2
    + cmd1退出时 cmd2才执行
    + cmd1; cmd2 按顺序执行不管cmd1是否退出

+ `--` `-`
    + A -- signals the end of options and disables further option processing. Any arguments after the -- are treated as filenames and arguments. An argument of - is equivalent to --


## ref
+ [Shell 教程](https://www.runoob.com/linux/linux-shell.html)
+ [bash 教程](https://wangdoc.com/bash/intro.html)

+ [online shell](https://www.runoob.com/try/runcode.php?filename=helloworld&type=bash)
+ [编写Shell 脚本编程最佳实践](https://zhuanlan.zhihu.com/p/264120455)
