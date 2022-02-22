


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
## 数组
+ `array_name=(value0 value1 value2 value3)`
    - `array_name[0]=value0`
    - `valuen=${array_name[n]}`
    - `echo ${array_name[@]}`获取数组所有元素
    - `length=${#array_name[@]}` 获取数组长度
## cat
+ `cat <<EOF xxx.txt` 
之间内容输入到文件
`EOF`


## tips
+ `#!/bin/sh/#!/bin/bash`在shell脚本第一行指定解释器
+ `chmod +x ./test.sh`使脚本有执行权限
+ 运行脚本
    + `./test.sh`打开子shell执行脚本
        - `test.sh` 系统会去PATH中查找`test.sh`，一般只有`/bin`,`/sbin`,`/usr/sbin`在PATH中
    + `/bin/sh <file>`打开一个子shell执行
    + `source <file>`当前shell下执行file中的命令
+ stdin
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

<!-- issue -->

