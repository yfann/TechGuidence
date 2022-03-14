
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

## declare

+ `declare -f` 查看定义的函数

+ `declare -f <func>`

+ `declare -F` 输出定义的函数名


## script parameters

+ `$0` 脚本

+ `$1`~`$9`

+ `$#` 参数总数

+ `$@` 所有参数，空格分隔

+ `$*` 所有参数,`$IFS`值的第一个字符分隔

## 变量
+ `your_name="runoob.com"` 定义变量
    - `readonly your_name`使变量只读
    - `unset your_name` 删除变量
    - `echo $your_name` 使用变量
    - `echo "I am good at ${your_name}Script"`

+ 局部变量、环境变量、shell变量
```sh
# 遍历/etc下的文件
for file in `ls /etc`  
# 或
for file in $(ls /etc)
```
+ 字符串
    - 单引号任何字符原样输出
    - 双引号(可转义，可显示变量)
        + `str="Hello, I know you are \"$your_name\"! \n"`
```sh
your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
# 使用单引号拼接
greeting_2='hello, '$your_name' !'
```

+ `echo ${#your_name}` 输出字符串长度

+ 获取子串
```sh
string="runoob is a great site"
echo ${string:1:4} # 输出 unoo
```

+ 查找字符串
```sh
string="runoob is a great site"
echo `expr index "$string" io`  # 输出 4
```


##  scripts

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

## conf

+ `. /path/to/some.config` 导入键值对配置文件

## ref

+ [Bash 脚本入门](https://wangdoc.com/bash/script.html)
