

+ 读取文件
```sh

while read p; do
  echo "$p"
done <peptides.txt
```

+ `if [ ! -z "$line" ]` 判断非空行

+ `grep -n "\[all\]" tmp_k3s_inventory.ini` 查询行号
    + `grep -n "xxx" str.txt | head -1` 获取第一个匹配的

+ `sed -n -e '/\[all\]/=' tmp_k3s_inventory.ini`



## ref

+ [linux shell 查找某字符串 在文件的行数](https://blog.csdn.net/whatday/article/details/105066031)
+ [Linux shell 获得字符串所在行数及位置](https://segmentfault.com/a/1190000020110249)