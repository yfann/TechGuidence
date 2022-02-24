## cmd
<!-- file auth -->
+ `su -`
    + `exit`
+ `ls -al`查看文件权限
+ `chgrp` 改变文件所属群组
    + `chgrp <group> <file>`
    + `-R` for folder
+ `chown` 改变文件所有者
+ `chmod` 改变文件的权限
    + > r:4 > w:2 > x:1
        + rwx:7
        + r-x:5
    + `chmod 777 <file>`
        + -rwxrwxrwx

<!-- file -->
+ `cd ~tmp`
+ `mkdir -p test1/test2/test3/test4`
+ `cp -r /etc/ /tmp`
    + `cp -r /home/packageA/* /home/cp/packageB/`
    + `-r` copy文件夹
+ `mv`
    + `mv aa bb` 改名

+ `rm -rf <dir>`
    + `rm xxx*`

+ `more`/`less`
    + `q` 退出
    + `b` 上翻页
    + `空格` 下翻页

+ `head`/`tail`
    + `-n <num>`
    + `-f <file>` 持续侦测

<!-- PATH -->
+ `echo $PATH`
+ `PATH="${PATH}:/root"`

<!-- 查询 -->
+ `which <cmd>`
+ `whereis <file>/<folder>`
+ `find`
    + `find . -name "*xxx*"` 当前目录及子目录查找，文件名包含`xxx`的文件

<!-- disk -->
+ `du -h  <your_dest_dir>`
    + 查看目录大小
+ `df -h` 查看目前文件系统的可用空间
+ `tee`
    + 读取标准输出到文件
    + `date | tee >test.txt`

## copy files from a pod

+ `kubectl cp <default/POD_NAME:bin/FILE_NAME> </Users/username/FILE_NAME>`
    + `kb cp keycloak-0:opt/bitnami/keycloak/themes .`


## ref

+ [Linux下各种查找命令（find, grep, which, whereis, locate）](https://blog.csdn.net/wzzfeitian/article/details/40985549)