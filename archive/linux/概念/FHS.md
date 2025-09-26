# FHS(Filesystem Hierarchy Standard)

+ /
    + root
+ /bin
    + 操作命令
+ /dev
    + /dev/null
    + 周边设备
+ /usr
    + Unix Software Resource
    + 可分享，不可变动（shareable, static）
    + 系统默认软件的位置
    + /usr/bin/ 链接 /bin
+ /etc
    + 配置文件
+ /var
    + 可变，与系统运行过程相关
    + /var/log
    
+ /mnt
    + 挂载

+ virtual filesystem
    + 数据都在内存中，不占磁盘空间
    + /proc
    + /sys

## ref
+ [Linux目录配置](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/44.html)