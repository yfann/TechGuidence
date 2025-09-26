

+ `ls temp/*.gz`
    + 列出文件的完整路径
+ `ls temp`
    + 列出文件名

+ `ls -a`
    + `ls -lh`
        + 大小权限等信息
        + `-h` human可读

+ for ls
```sh
# 遍历/etc下的文件
for file in `ls /etc`  
# 或
for file in $(ls /etc)
```