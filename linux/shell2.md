
## cmd
+ `cat /etc/shells` 查看有多少种shell
+ `chmod +x <./test.sh>`赋权限
+ `./test.sh` 执行脚本，不加`./`会在PATH中找，只有`/bin`,`/sbin`,`/usr/bin`,`/usr/sbin`在PATH中
+ `/bin/sh tset.sh`指定解释器运行脚本
+ `source ~/.bashrc`使配置立马生效

## zsh、bash
+ `cat`
    - `cat <file>`显示整个文件
    - `cat > <file>`创建文件
    - `cat <file1> <file2> > <file>` 几个文件合并成一个文件
+ `set` 显示所有环节变量
    - `set -u`变量不存在时报错
    - `set -x`用来在运行结果之前，先输出执行的那一行命令。
    - `set -e`脚本有错就停止
        + `set +e`关闭这个功能，可以跳过某些命令
        + `set -e`再次开启此功能
+ 环境变量
    - `export <key>=<value>`设置临时环境变量
    - `.bash_profile`可添加永久环境变量
    - `echo $PATH`可查看环境变量
    - `env` 显示当前用户变量，用户变量和shell无关
    - `set` 显示当前shell变量（包括用户变量),`set <key>=<val>`设置shell变量
    - `export` 显示导出成用户变量的shell变量, `export <key>=<val>`把shell变量导成用户变量
    - `unset <var>`删除环境变量
+ `>` redirect output(overwrite file)
+ `>>` append to a file(create file if not exists)
+ `|` 管道，进程间通信，一个进程的stdout是另一个进程的 stdin

## tips

+ shell function 加到`.zshrc`中,可在窗口中直接调用

## bash scripts

+ `bash script.sh`
```sh
#!/usr/bin/env bash
echo $a
echo bar
```
+ bash 脚本出错时会继续执行
    - `command || exit 1` command有非0返回值时(一般是出错)，脚本停止执行
        + `command || { echo "command failed"; exit 1; }` 脚本出错退出
        + `if ! command; then echo "command failed"; exit 1; fi`脚本出错退出
        + 脚本出错退出
        ```sh
        command
        if [ "$?" -ne 0 ]; then echo "command failed"; exit 1; fi
        ```
    - `command1 && command2` command1成功时 command2执行
    - 出错继续执行
    ```sh
    #!/bin/bash
    set -e

    foo || true
    echo bar

    #!/usr/bin/env bash
    set -e

    foo | echo a
    echo bar
    ```

## ref
+ [Mac下Shell脚本使用](https://www.jianshu.com/p/780cdac4e9a7)
+ [shell教程](https://www.runoob.com/linux/linux-shell-func.html)
+ [Bash Reference Manual](https://www.gnu.org/software/bash/manual/html_node/index.html#SEC_Contents)
+ [bash set](http://www.ruanyifeng.com/blog/2017/11/bash-set.html)