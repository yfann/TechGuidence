# xargs

+ `|` 可以把标准输出转换为标准输入,给接收标准输入的命令使用
    + `cat /etc/passwd | grep root`
        +  `grep root /etc/passwd`

+ `xargs` 将标准输入转为命令行参数，给不支持接收标准输入的命令
    + `echo "hello world" | xargs echo`
    + `echo "one two three" | xargs mkdir` 同 `mkdir one two three`


+ `xargs`同 `xargs echo`

+ `xargs`
    + stdin,|,文件的输出 转为命令的参数
        + somecommand |xargs <-item>  command
    + `echo "nameXnameXnameXname" | xargs -dX`
    + `cat test.txt | xargs -n3`

## cmd
+ `xargs find -name` 输入要查找的文件名，ctrl+d

+ `find /path -type f -print0 | xargs -0 rm` null为分隔符，而不是空格(文件名可能包含空格)
    + `-print0` 输出的文件列表以null分隔
    + `-0` 用null作为分隔符号

## tips

+ `xargs [-options] [command]`



+ `-d` 设置分割符
    + `echo -e "a\tb\tc" | xargs -d "\t" echo`
    + 默认将换行符和空格作为分隔符，把标准输入分解成一个个命令行参数
        + ` echo "one two three" | xargs mkdir`

+ `-p` 打印要执行的命令，询问是否执行
    + `echo 'one two three' | xargs -p touch`

+ `-t` 打印命令直接执行
    + `echo 'one two three' | xargs -t rm`


+ `-L` 标准输入如果有多行，指定多少行作为一个命令参数
    + `echo -e "a\nb\nc" | xargs -L 1 echo` 每一行执行一次echo

+ `-n` 每次将多少项，作为命令行参数
    + `echo {0..9} | xargs -n 2 echo`

+ `-I` 命令行参数的替代字符串
    + `cat foo.txt | xargs -I file sh -c 'echo file; mkdir file'`
        + file指代参数

+ `--max-procs` 默认只用一个进程执行命令
    + `docker ps -q | xargs -n 1 --max-procs 0 docker kill`
    + `--max-procs 0 ` 不限制进程的数量

## ref

+ [xargs 命令教程](https://www.ruanyifeng.com/blog/2019/08/xargs-tutorial.html)