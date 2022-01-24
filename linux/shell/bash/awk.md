# awk

+ 文本处理(逐行处理）
    + 适合CSV这种每行格式相同的文本文件

## cmd
+ formate:`awk '条件 动作' 文件名`

+ ` awk '{print $0}' <file>` 打印每行
    + `echo 'this is a test' | awk '{print $0}'`

+ `awk -F ':' '{ print $1 }' <file>`
    + 指定`:`为分隔符

+ `awk -F ':' '{ print toupper($1) }' <file>`
    + 大写输出
    + `length()`
    + `rand()`
<!-- 条件输出 -->
+ `awk  '/usr/ {print $1}' <file>`
    + `/usr/` 正则
    + 只输出包含usr的行
+ `awk '$1 == "root" {print $1}' ...`
+ `awk -F ':' '{if ($1 > "m") print $1; else print "---"}' ...`


## tips

+ `$0` 当前行
+ `$1`,`$2` 第几个字段(根据空格制表符分割)
+ `$NF` 最后一个字段
+ `$(NF-1)` 倒数第二个字段

## ref

+ [awk 入门教程](https://www.ruanyifeng.com/blog/2018/11/awk.html)