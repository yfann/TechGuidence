# rpm

+ Red-Hat Package Manager
+ 只能本地安装rpm
+ rpm一般都是预先编译好的文件，它可能已经绑定到某种CPU或者发行版上面了

## cmd

+ `rpm -q <pkg>` 查询安装的rpm
    + `rpm -qi <pkg>` 详细信息
    + `rpm -ql <pkg>` 列出安装路径,可以找到配置文件

+ `rpm -e <pkg>` 卸载

+ `rpm -qa |grep <key>`

##  install rpm

<!-- 下载依赖 -->
<!-- + `yum -y install yum-utils` -->
+ `repotrack <pkg>`
    + `repotrack -a x86_64 -p /repos/Packages [packages]`
    <!-- + `yumdownloader –resolve --destdir=/tmp <pkg>`
        + 下载依赖包 -->

<!-- 安装依赖 -->
+ `rpm -Uvh --force --nodeps *.rpm`

<!-- 安装目标包 -->
+ `rpm -i xxx.rpm`
     `sudo yum localinstall xxx.rpm`

## ref

+ [rpm命令 – RPM软件包管理器](https://www.linuxcool.com/rpm)
+ [rpm和yum区别和联系以及apt-get](https://zhuanlan.zhihu.com/p/27724520)