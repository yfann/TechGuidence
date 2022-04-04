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


## 目录
+ /bin        二进制文件，系统常规命令
+ /boot       系统启动分区，系统启动时读取的文件
+ /dev        设备文件
+ /etc        大多数配置文件
+ /home       普通用户的家目录
+ /lib        32位函数库
+ /lib64      64位库
+ /media      手动临时挂载点
+ /mnt        手动临时挂载点
+ /opt        第三方软件安装位置
+ /proc       进程信息及硬件信息
+ /root       临时设备的默认挂载点
+ /sbin       系统管理命令
+ /srv        数据
+ /var        数据
+ /sys        内核相关信息
+ /tmp        临时文件
+ /usr        用户相关设定



## ref
+ [UNIX Tutorial for Beginners](http://www.ee.surrey.ac.uk/Teaching/Unix/)

<!-- 概念 -->
+ [Linux 环境隔离机制 -- Linux Namespace](https://zhuanlan.zhihu.com/p/47571649)
+ [linux基础与shell编程](https://www.kancloud.cn/digest/linux-world/145297)
+ [Linux 系统目录结构](https://www.runoob.com/linux/linux-system-contents.html)

<!-- others -->
+ [Linux版本知多少](https://zhuanlan.zhihu.com/p/151849085)
+ [Linux编译、分发工具演化](https://zhuanlan.zhihu.com/p/65209070)
+ [Linux测试工具](https://cloud.tencent.com/developer/article/1390611?from=15425)
+ [【CPU】关于x86、x86_64/x64、amd64和arm64/aarch64](https://blog.csdn.net/michaelwoshi/article/details/105105421)

<!-- 教程 -->
+ [鸟哥的Linux私房菜：基础学习篇 第四版](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/148.html)
+ [玩转Linux内核](https://www.zhihu.com/people/gang-hao-xin-dong-23)
