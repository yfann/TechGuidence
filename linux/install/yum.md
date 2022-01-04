# yum

+ RPM(Red Hat Package Manager)

+ Fedora,RedHat,CentOS

## cmd

+ `yum list` 列出所有可安装的包
    + `yum list | grep ..`


+ `yum search <keyword>`
    + 搜索包名，描述

+ `yum install/update/remove <pkg>`
    + `yum -y install <pkg>`
        + 自动yes
    + `yum install <package name>-<version info>`

+ `yum clean packages/headers/oldheaders`

+ `yum provides <file_name>`
    + 查询文件在哪个包中

+ `yum repolist`
    + `yum repolist all`

+ `yum deplist <pkg>`
    + 查看依赖

## yum源

+ 备份`/etc/yum.repos.d/CentOS-Base.repo`
    + `mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup`

+ `wget http://mirrors.163.com/.help/CentOS7-Base-163.repo`
    + `mv CentOS6-Base-163.repo CentOS-Base.repo`
+ `yum clean all`
+ `yum makecache`

## rpm install offline

<!-- 下载依赖 -->
+ `yum -y install yum-utils`
    + `repotrack <pkg>`
        + `repotrack -a x86_64 -p /repos/Packages [packages]`
    <!-- + `yumdownloader –resolve --destdir=/tmp <pkg>`
        + 下载依赖包 -->

<!-- 安装依赖 -->
+ `rpm -Uvh --force --nodeps *.rpm`

<!-- 安装目标包 -->
+ `rpm -i xxx.rpm`
     `sudo yum localinstall xxx.rpm`

## yum.conf
+ `/etc/yum.conf`
+ `/etc/yum.repo.d `

## ref

+ [Linux yum 命令](https://www.runoob.com/linux/linux-yum.html)

<!-- tips -->
+ [yum.conf *.repo](https://blog.csdn.net/liufuchun111/article/details/81459947)
+ [yum更新软件包时卡死，无法ctrl+c停止](https://blog.csdn.net/czh8706/article/details/106017064)
+ [yum 下载全量依赖 rpm 包及离线安装（终极解决方案](https://www.cnblogs.com/dyh004/p/13975275.html)
