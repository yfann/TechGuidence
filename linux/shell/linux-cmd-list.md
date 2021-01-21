
## 查找

+ `ls -a`
+ `which <cmd>`
    + PATH指定的路径中搜索<cmd>的位置，返回第一个结果
+ `whereis <cmd>`
    + 程序名搜索
    + -b  只搜索二进制
    + -m  man说明文件
    + -s  源代码文件
    
## temp

+ `mktemp`  建立暂存文件
    + `-q` 错误时不显示信息
    + `-u` mktemp结束前删除

+ `$(variable)` 返回变量值
+ `$(command)` 运行命令并返回值
    + `$(echo foo)`

<!-- 目录切换 -->
+ `cd -`回到之前目录
    + `cd $OLDPWD`
+ `dirs` 目录栈，栈顶当前目录
    + `-p` 每行一条
    + `-v` 显示index
    + `-c` 清空目录栈
+ `pushd <path>` 入栈,栈顶变化,当前目录变化
    + `pushd` 栈顶，次顶交行
    + `pushd +n` 栈中第n个元素到栈顶
+ `popd` 

+ `wc` 字数
    + `wc -l` 计算行数

+ `sed` 修改文件，字符串
    + `sed -in "s/[ #]*proxy/proxy/g" filename`替换
        + -i 直接修改文件否则是返回替换内容
        + -n 不打印修改结果

+ `tree`(sudo apt install tree)

+ `nslookup`
    + `nslookup <domain name> <DNS IP>`


+ chmod
    + man chmod
    + info chmod

## help
+ `man <cmd>`
+ `info <cmd>`


## ref
+ [超全的 Linux Shell 文本处理工具集锦](https://zhuanlan.zhihu.com/p/265869157)
+ [bash 教程](https://wangdoc.com/bash/intro.html)

<!-- detail -->
+ [mktemp](https://www.runoob.com/linux/linux-comm-mktemp.html)
+ [pushd popd](https://blog.csdn.net/xia7139/article/details/50726971)
+ [wc](https://www.runoob.com/linux/linux-comm-wc.html)
+ [tar](https://www.runoob.com/linux/linux-comm-tar.html)
+ [awk](https://zhuanlan.zhihu.com/p/261886766)
+ [sed](https://zhuanlan.zhihu.com/p/145661854)
+ [chmod](http://www.gnu.org/software/coreutils/manual/html_node/chmod-invocation.html)
+ [Linux wget 命令用法详解](https://www.jianshu.com/p/59bb131bc2ab)