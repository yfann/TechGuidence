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
## ref
+ [Shell 教程](https://www.runoob.com/linux/linux-shell.html)
+ [online shell](https://www.runoob.com/try/runcode.php?filename=helloworld&type=bash)
+ [bash 教程](https://wangdoc.com/bash/intro.html)
