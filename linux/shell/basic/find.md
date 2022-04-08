
+ `find . -name "*.c"` 当前目录下查找所有扩展名为c的文件

+ `find . -name "logs" -type d` 查找目录

+ `find . -type f` 列出所有文件

+ `find . -ctime -20` 列出20天内更新过的文件

+ `find / -type f -size 0 -exec ls -l {} \;` 列出大小为0的文件并显示路径

+ `find ./ ! -regex  '.*\(deb\|vmdk\)$'`