
# shell script

+ `#!/bin/sh/` `#!/bin/bash`在shell脚本第一行指定解释器,Shebang
    + 有shebang行，可以直接运行脚本`./script.sh`
        + 如果没有则`/bin/sh ./script.sh`

+ `chmod +x ./test.sh`使脚本有执行权限
    + `chmod 755 script.sh` 拥有者有所有权限，其他人有读取执行权限

+ `export PATH=$PATH:~/bin` 脚本放入bin中，任何目录中都可以执行脚本

+ `env -i /bin/sh` 启动一个不带环境变量的shell

+ run shell
    + `./test.sh`打开子shell执行脚本
        - `test.sh` 系统会去PATH中查找`test.sh`，一般只有`/bin`,`/sbin`,`/usr/sbin`在PATH中
    + `/bin/sh <file>`打开一个子shell执行,指定解释器
    + `source <file>`当前shell下执行file中的命令
    + `bash script.sh`
        + 开启新的shell环境执行
    + 脚本失败:返回值非0

+ `source ~/.bashrc`使配置立马生效

+ `cat /etc/shells` 系统安装的所有shell

+ `echo $SHELL` 当前shell

+ `type [cmd]` 查看命令类型

+ `exit 1` 退出



##  tips

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

+ `nohup` no hang up
    + 退出终端不会影响程序运行
        + 输出nohup.out or $HOME/nohup.out 
    + `nohup Command [ Arg … ] [　& ]`
        + `nohup /root/runoob.sh &`
            + `&` 让命令在后台执行，终端退出后命令仍旧执行。
            + stop exe
                + `ps -aux | grep "runoob.sh" ` find pid and kill
        + 重定向
            + `nohup /root/runoob.sh > runoob.log 2>&1 &`
                + 将标准错误 2 重定向到标准输出 &1 ，标准输出 &1 再被重定向输入到 runoob.log 文件中
        


## conf

+ `. /path/to/some.config` 导入键值对配置文件

## ref

+ [Bash 脚本入门](https://wangdoc.com/bash/script.html)
+ [Linux nohup 命令](https://www.runoob.com/linux/linux-comm-nohup.html)
+ [Execute remote commands, completely detaching from the ssh connection](https://unix.stackexchange.com/questions/30400/execute-remote-commands-completely-detaching-from-the-ssh-connection)
