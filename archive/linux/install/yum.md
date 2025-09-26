# yum

+ RPM(Red Hat Package Manager)

+ Fedora,RedHat,CentOS

## cmd


+ `yum info <pkg>`

+ `yum list` 列出所有可安装的包
    + `yum list | grep ...`
    + `yum list installed | grep ...`
    + `yum list available | grep ...`

+ `yum --showduplicates list <pkg>`
    + list available version



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

## path
+ `/etc/yum.conf`
+ `/etc/yum.repo.d`


## proxy for yum

+ 给`/etc/yum.repos.d/`所有仓库添加代理
    + `sudo vi /etc/yum.conf`
        + 结尾加 `proxy=http://<ip>:<port>`

+ 只给base加代理
    + `sudo vi /etc/yum.repos.d/CentOS-Base.repo`
```ini
[base]
name=CentOS-$releasever - Base
baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
proxy=http://ip:port
....
```

## ref

+ [Linux yum 命令](https://www.runoob.com/linux/linux-yum.html)
+ [yum cmd](https://access.redhat.com/sites/default/files/attachments/rh_yum_cheatsheet_1214_jcs_print-1.pdf)
<!-- tips -->
+ [yum.conf *.repo](https://blog.csdn.net/liufuchun111/article/details/81459947)
+ [yum更新软件包时卡死，无法ctrl+c停止](https://blog.csdn.net/czh8706/article/details/106017064)
+ [yum 下载全量依赖 rpm 包及离线安装（终极解决方案](https://www.cnblogs.com/dyh004/p/13975275.html)
+ [How can I instruct yum to install a specific version of package X?](https://unix.stackexchange.com/questions/151689/how-can-i-instruct-yum-to-install-a-specific-version-of-package-x)

<!-- repo -->
+ [可供 CentOS 使用的软件库](https://wiki.centos.org/zh/AdditionalResources/Repositories)
+ [How to Set Up and Use Yum Repositories on CentOS 7](https://linuxhostsupport.com/blog/how-to-set-up-and-use-yum-repositories-on-centos-7/)
+ [epel](https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages)
+ [CentOS7解决yum中软件版本过低问题](https://www.iizyx.com/54/)
<!-- proxy -->
+ [为yum源配置代理](https://pshizhsysu.gitbook.io/linux/yum/wei-yum-yuan-pei-zhi-dai-li)


<!-- repo -->
+ [](https://centos.pkgs.org/8/centos-baseos-x86_64/iptables-1.8.4-20.el8.x86_64.rpm.html)