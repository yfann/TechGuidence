

## cmd
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



## tree

+ `tree -L 2`
+ `tree`(sudo apt install tree)

## java
+ `jps` 查看java进程的pid
+ `cd /proc/<pid>/fd` 查看进程日志
+ `nohup java -jar -Dspring.profiles.active=prod xxx.jar &`
    + 运行jar



## 命令组合

+ `xargs`
    + stdin,|,文件的输出 转为命令的参数
        + somecommand |xargs <-item>  command
    + `echo "nameXnameXnameXname" | xargs -dX`
    + `cat test.txt | xargs -n3`


## others

+ `jq`


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
+ [test](https://www.runoob.com/linux/linux-shell-test.html)

+ [Linux wget 命令用法详解](https://www.jianshu.com/p/59bb131bc2ab)

<!-- fun -->
+ [cfonts](https://github.com/dominikwilkowski/cfonts)