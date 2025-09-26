# awk

+ 文本处理(逐行处理）
    + 适合日志，CSV这种每行格式相同的文本文件

## cmd
+ `awk '条件 动作' <file>`

+ ` awk '{print $0}' <file>` 打印每行
    + `echo 'this is a test' | awk '{print $0}'`

+ `awk -F ':' '{ print $1 }' <file>`
    + 指定`:`为分隔符

+ `awk -F ':' '{ print toupper($1) }' <file>`
    + 大写输出
    + `length()`
    + `rand()`

<!-- 条件输出 -->
+ `awk  '/usr/ {print $1}' <file>` 只输出包含usr的行
    + `/usr/` 正则
+ `awk -F ':' 'NR >3 {print $1}' demo.txt` 输出第三行以后的行
+ `awk '$1 == "root" {print $1}' ...`

+ `awk -F ':' '{if ($1 > "m") print $1; else print "---"}' ...`


## practice
<!-- awk中使用变量 -->
+ `awk -F ':' -v a="$a" '$1==a { print $2 }' ./china-op/raw/nexus-mapping`

## 内置变量

+ `$0` 当前行
+ `$1`,`$2` 第几个字段(根据空格制表符分割)
+ `NF` 字段个数
    + `$NF` 最后一个字段
    + `$(NF-1)` 倒数第二个字段
+ `NR` awk开始处理时读取的行数
+ `FNR` 读取的文件的行数（读第二个文件时,FNR重0开始，NR一直累计）
+ `FILENAME`
+ `FS` 字段分隔符
+ `RS` 行分隔符
+ `OFS` 输出的字段分隔符
+ `ORS` 输出的行分隔符
+ `OFMT` 数字输出格式

## 内置函数
+ `length()`
+ ` awk -F ':' '{ print toupper($1) }' demo.txt`
+ `substr()`

## tips

+ `NR==FNR` 用于在读取两个或两个以上的文件时，判断是不是在读取第一个文件
    + true: 第一个文件
    + false: 当前处理第二个文件
```sh
awk 'NR==FNR { print NR,$0 }' file1 file2
```

## ref

+ [awk 入门教程](https://www.ruanyifeng.com/blog/2018/11/awk.html)
+ [awk functions](https://www.gnu.org/software/gawk/manual/html_node/Built_002din.html#Built_002din)

<!-- details -->
+ [next](https://www.gnu.org/software/gawk/manual/html_node/Next-Statement.html)

<!-- samples -->
+ [Why you should learn just a little Awk](https://gregable.com/2010/09/why-you-should-know-just-little-awk.html)
+ [30 Examples for Awk Command in Text Processing](https://likegeeks.com/awk-command/)
+ [利用awk自身变量NR和FNR来处理多个文件](https://blog.51cto.com/521cto/945683)