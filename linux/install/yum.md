# yum

+ RPM(Red Hat Package Manager)

+ Fedora,RedHat,CentOS

## cmd

+ `yum install/remove <pkg>`

+ `yum info <pkg>`

+ `yum list` 列出所有可安装的包
    + `yum list | grep ...`
    + `yum list installed | grep ...`

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

## yum.conf
+ `/etc/yum.conf`
+ `/etc/yum.repo.d `

## ref

+ [Linux yum 命令](https://www.runoob.com/linux/linux-yum.html)
+ [yum cmd](https://access.redhat.com/sites/default/files/attachments/rh_yum_cheatsheet_1214_jcs_print-1.pdf)
<!-- tips -->
+ [yum.conf *.repo](https://blog.csdn.net/liufuchun111/article/details/81459947)
+ [yum更新软件包时卡死，无法ctrl+c停止](https://blog.csdn.net/czh8706/article/details/106017064)
+ [yum 下载全量依赖 rpm 包及离线安装（终极解决方案](https://www.cnblogs.com/dyh004/p/13975275.html)


<!-- repo -->
+ [可供 CentOS 使用的软件库](https://wiki.centos.org/zh/AdditionalResources/Repositories)
+ [How to Set Up and Use Yum Repositories on CentOS 7](https://linuxhostsupport.com/blog/how-to-set-up-and-use-yum-repositories-on-centos-7/)
+ [epel](https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages)
+ [CentOS7解决yum中软件版本过低问题](https://www.iizyx.com/54/)
