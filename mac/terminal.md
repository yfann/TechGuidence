
## config
+ `export http_proxy=XXX` `export https_proxy=XXX`
+ 安装XCode或安装Command Line Tools for Xcode`xcode-select --install`
+ shell配置文件.bashrc或.zshrc,bash每次启动时都会加载，`source ~/.bashrc`立即生效

## cmd

+ `man <cmd>` help
+ `pwd`查看路径
+ `ls -la -R`显示隐藏文件，`l`表示格式化, `-R`递归执行，显示子文件夹
+ `cat <a.txt> >> <b.txt>`查看文件，或拼接文件
+ `less <a.txt>`打开文件，可以查找
+ `which <cmd>`找到命令位置
+ `file <file>`显示文件类型
+ `find <keyword>`搜索
+ `mdfind <keyword>`使用Soptlight搜索
+ `mkdir -p`可以按照路径创建层级文件夹
+ `cp` `mv` `rm` `rm -R`可以删除文件夹及其包含的文件 `vi`可视化文本编辑器 `echo` `clear`
+ `su`切换用户
+ `who -m`当前是什么用户
+ `sudo <cmd>`管理员权限执行命令
+ `open /`根目录  `open ~`home路径 '/Users/yfann'
+ `history`查看历史

## tips

+ 输入路径时首字母+`tab`可以补全文件名
+ `priject/git\ hub/my`路径有空格时加反斜杠
+ `cmd up/down` 选择命令
+ `cmd + N` terminal 得到焦点后执行此命令打开新的terminal
+ `ctrl + c`终止执行
+ `ctrl + L` clear

## 文本编辑
+ `touch <file>`创建文件
+ `Esc + :wq`保存退出
+ `:q`退出
+ `sudo vim <txt file>`编辑文件
+ `i`插入模式
+ `:!q`不保存退出
+ `nl <file>` 添加行号

### sed


## shell文件
+ `#!/bin/sh`第一行,指定bash解释器,ubuntu中用的是dash
+ 保存脚本.sh，shell脚本
<!-- 执行脚本 -->
+ `bash <XXX.sh>` 
+ `./<XXX.sh>`执行脚本，当前路径在PATH时可以直接运行`XXX.sh`
+ `/bin/sh <XXX.sh>` 解释器直接运行脚本
+ `chmod +x <XXX.sh>`开启文件的可执行权限，拖入终端+回车执行

## 基础语法

+ `your_name="xxx"`=两侧不能有空格
+ `echo ${your_name}`使用变量
+ 只读变量
```sh
your_name="xxxx"
readonly your_name
```
+ `unset your_name`删除变量
+ 拼接字符串
```sh
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
```
+ `${#your_name}`获取字串长度
+ `${your_name:1:4}`第二个字符开始截取4个字符
+ echo `expr index "$your_name" io`查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)
+ 数组
    - `array_name=(value0 value1 value2 value3)`
    + `array_name[0]=value0`
    + `valuen=${array_name[n]}`
    + `length=${#array_name[*]}`
+ 参数
    - `test.sh 1 2 3`
    - `$0`脚本名 `$1`第一个参数 `$2`第二个参数
+ val=`expr $a + $b`
+ `$a -eq $b`
+ `read name`读取输入到变量name
+ `echo -e ok \n` -e开启转义`\c`不换行
    - echo `date`
+ `test` 代替if中的方括号
```sh
if test "asd" = "asd"
then
    echo 'equal'
else
    echo 'not equal'
fi
```
<!-- 控制语句 -->
+ `f [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi`
```sh
#保留空格
if [ $a == $b ]
then
    ...
fi
```
+ `for var in item1 item2 ... itemN; do command1; command2… done;`
```sh
for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done

int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
```
+ function 
```sh
demoFun(){
    echo "这是我的第一个 shell 函数!"
     return $(($aNum+$anotherNum))
}

demoFun
echo "输入的两个数字之和为 $? !"
# 返回值通过$?获取

```

+ `. ./test1.sh`引用文件
+ `cmd | cmd`左侧标准输出，右侧标准输入

## 重定向(右侧只能是文件)

- `cmd > file`输出到文件
- `cmd >> file`输出追加到文件
- `cmd < file`文件输入
+ `n >& m` n m 合并到m
- `<< tag` 	将开始标记 tag 和结束标记 tag 之间的内容作为输入
    ```sh
    $ wc -l << EOF
        sss
        xxx
        ttt
    EOF
    #输出结果，查看行数
    3
    ```
- `command > /dev/null`啥都不输出


## keyword
+ curl
+ wget

## ref
<!-- shell bash  -->
+ [Mac OS X Terminal 101：终端使用初级教程](https://www.renfei.org/blog/mac-os-x-terminal-101.html)
+ [每天一个linux命令目录](https://www.cnblogs.com/peida/archive/2012/12/05/2803591.html)
+ [Vim命令合集](https://www.jianshu.com/p/117253829581)
+ [Linux vi/vim](http://www.runoob.com/linux/linux-vim.html)
+ [linux下.bashrc文件修改和生效](https://blog.csdn.net/eleanoryss/article/details/70207767)
+ [Shell 教程](http://www.runoob.com/linux/linux-shell.html)
+ [脚本语言语法规则](https://blog.csdn.net/oqqhutu12345678/article/details/71319006)
+ [shell 脚本编程](https://wiki.jikexueyuan.com/project/shell-learning/sed-search-and-replace.html)
+ [Linux 命令大全](http://www.runoob.com/linux/linux-command-manual.html)
+ [search linux command](http://man.linuxde.net/)
<!-- terminal 配置 -->
+ [terminal 代理](https://blog.csdn.net/u011537073/article/details/71125571)
+ [利用 Privoxy 让命令行下的 wget 和 curl 等命令实现自动代理](https://fengqi.me/unix/328.html)
+ [mac－改造你的terminal](https://www.jianshu.com/p/bb1c97269b11)
+ [设置快捷键打开terminal](https://jingyan.baidu.com/article/20b68a88832140796cec623d.html)
+ [Terminal shortcut](https://support.apple.com/zh-cn/guide/terminal/trmlshtcts/mac)
<!-- 实例 -->
+ [Mac OS X巧用AppleScript 制作网络位置切换自动化脚本（自动配置PAC 文件）](https://devework.com/automatic-proxy-configuration-pac-applescript.html)
+ [如何优雅地一键实现macOS网络代理切换](https://zhuanlan.zhihu.com/p/23910924)