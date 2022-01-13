# linux
+ 查看内核
    + `cat /proc/version` 
    + `uname -a`
+ `lsb_release -a` linux版本
+ `cat /etc/redhat-release` 查看Redhat版本

+ 发行版
    + Red Hat
        + Centos
        + Fedora
    + Debian
        + Ubuntu

## cmd

+ `ls -a`
+ `whoami`
+ `which <cmd>`
+ `whereis <cmd>`
<!-- help -->
+ `<cmd> --help`
+ `man <cmd>`
+ `info <cmd>`

## export
+ `export -p`
+ `export -n <name>`删除环境变量



## install manually
+ `wget <url>`
+ `sudo tar -C /usr/local -xzf /home/nikhita/Downloads/go1.8.1.linux-amd64.tar.gz`
+ `export PATH=$PATH:/usr/local/go/bin`
+ `echo $PATH | grep "/usr/local/go/bin"`


## tips
+ --pid-path=/var/run/nginx.pid 
    + 程序成功运行
    + kill <pid> 提供方便

+ --lock-path=/var/lock/nginx.lock 
    + 并发运行的instance通过检查lock文件是否存在来判断当前资源是否有其他Instance在使用


## ref
+ [UNIX Tutorial for Beginners](http://www.ee.surrey.ac.uk/Teaching/Unix/)

<!-- 概念 -->
+ [Linux 环境隔离机制 -- Linux Namespace](https://zhuanlan.zhihu.com/p/47571649)
+ [linux基础与shell编程](https://www.kancloud.cn/digest/linux-world/145297)
+ [Systemd 入门教程：命令篇](https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html)


<!-- others -->
+ [Linux版本知多少](https://zhuanlan.zhihu.com/p/151849085)
+ [Linux编译、分发工具演化](https://zhuanlan.zhihu.com/p/65209070)
+ [Linux测试工具](https://cloud.tencent.com/developer/article/1390611?from=15425)

<!-- 教程 -->
+ [鸟哥的Linux私房菜：基础学习篇 第四版](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/148.html)
