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

<!-- 读取文件 -->
```sh

while read p; do
  echo "$p"
done <peptides.txt
```

+ `if [ ! -z "$line" ]` 判断非空行

+ `grep -n "\[all\]" tmp_k3s_inventory.ini` 查询行号
    + `grep -n "xxx" str.txt | head -1` 获取第一个匹配的

+ `sed -n -e '/\[all\]/=' tmp_k3s_inventory.ini`



+ `if [ ! -d "$path" ]; then ` 文件夹不存在

+ `if [ -f "$FILE" ]; then` 文件存在


## copy files from a pod

+ `kubectl cp <default/POD_NAME:bin/FILE_NAME> </Users/username/FILE_NAME>`
    + `kb cp keycloak-0:opt/bitnami/keycloak/themes .`


## tips
+ ` basename /Users/fan/china-op/tmp.sh` 取文件名
+ ` dirname /Users/fan/china-op/tmp.sh` 取路径

## ref

+ [Linux下各种查找命令（find, grep, which, whereis, locate）](https://blog.csdn.net/wzzfeitian/article/details/40985549)

+ [linux shell 查找某字符串 在文件的行数](https://blog.csdn.net/whatday/article/details/105066031)
+ [Linux shell 获得字符串所在行数及位置](https://segmentfault.com/a/1190000020110249)
+ [Check if a directory exists in Linux or Unix shell](https://www.cyberciti.biz/faq/check-if-a-directory-exists-in-linux-or-unix-shell/)