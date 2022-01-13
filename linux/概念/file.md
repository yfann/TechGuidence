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
+ `mv`
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

## tips
+ i-node

+ rwx
    + `x`可以判断文件是否可执行,能否进入目录

+ `-` 前一个工作目录


## ref

+ [理解linux中的file descriptor(文件描述符)](https://wiyi.org/linux-file-descriptor.html)
+ [Linux 文件权限概念](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/43.html)