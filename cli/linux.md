
## cat
+ `cat <file1> <file2>`

## awk

## sed

## grep


## sort

+ `sort <file>`
+ `sort -r <file>`
    + reverse order
+ `sort -n <file>`
    + 按数字排序
    + `-M`
        + 按月份排
    + `-f`
        + 忽略大小写
    + `-d`
        + 按字典顺序
+ `sort -nr <file>`
    + sort numerically and reverse order
+ `sort -k <column number> <file>`
    + `sort -t',' -k2 data.txt`
        + 指定分隔符
    + sort a particular column
+ `sort -u <file>`
    + eliminate the duplicate entries
+ `sort -c <file>`
    + 返回第一条不在顺序的记录
+ `sort <file1> -n <file2>`
+ `sort <file> > <output>`
    + `sort -o <output> <file>`
    + 输出结果到文件
## uniq


## xargs

## head


## ref
+ [Command-line Tools can be 235x Faster than your Hadoop Cluster](https://adamdrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html)