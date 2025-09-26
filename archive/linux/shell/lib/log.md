
## tail
+ `tail -n 10 test.log` 查看尾部10行
+ `tail  -fn 100  test.log` 实时查看后100行
    + `tail -fn 100 test.log | grep 'xx'`
## head

## sed
+ `sed -n '5,10p' filename` 行号

+ `sed -n '/2014-12-17 16:17:20/,/2014-12-17 16:17:36/p'  test.log` 时间段

## ref
+ [Linux 6种日志查看方法](https://cloud.tencent.com/developer/article/1579977)