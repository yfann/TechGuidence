
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

+ `Esc + :wq`保存文件

## shell
+ `#!/bin/sh`第一行,指定bash解释器,ubuntu中用的是dash
+ 保存脚本.sh，shell脚本
+ `bash XXX.sh`
+ `chmod +x XXX.sh`开启文件的可执行权限，拖入终端+回车执行


## keyword
+ ruby?
+ curl
+ wget

## ref
<!-- bash  -->
+ [Mac OS X Terminal 101：终端使用初级教程](https://www.renfei.org/blog/mac-os-x-terminal-101.html)
+ [每天一个linux命令目录](https://www.cnblogs.com/peida/archive/2012/12/05/2803591.html)
+ [Vim命令合集](https://www.jianshu.com/p/117253829581)
+ [Linux vi/vim](http://www.runoob.com/linux/linux-vim.html)
+ [linux下.bashrc文件修改和生效](https://blog.csdn.net/eleanoryss/article/details/70207767)
+ [Shell 教程](http://www.runoob.com/linux/linux-shell.html)
+ [脚本语言语法规则](https://blog.csdn.net/oqqhutu12345678/article/details/71319006)
<!-- terminal 配置 -->
+ [terminal 代理](https://blog.csdn.net/u011537073/article/details/71125571)
+ [利用 Privoxy 让命令行下的 wget 和 curl 等命令实现自动代理](https://fengqi.me/unix/328.html)
+ [mac－改造你的terminal](https://www.jianshu.com/p/bb1c97269b11)
+ [设置快捷键打开terminal](https://jingyan.baidu.com/article/20b68a88832140796cec623d.html)
+ [Terminal shortcut](https://support.apple.com/zh-cn/guide/terminal/trmlshtcts/mac)
<!-- 实例 -->
+ [Mac OS X巧用AppleScript 制作网络位置切换自动化脚本（自动配置PAC 文件）](https://devework.com/automatic-proxy-configuration-pac-applescript.html)
+ [如何优雅地一键实现macOS网络代理切换](https://zhuanlan.zhihu.com/p/23910924)