# input output redirection
+ 文件描述符
    + 0 STDIN
        + 读取数据
    + 1 STDOUT
        + 输出数据
    + 2 STDERR
        + 写入错误

## cmd
+ `cmd > file` 
    + 输出到file
    + stdout 重定向到file

+ `cmd > /dev/null`
    + 屏幕不显示输出(丢弃输出)

+ `cmd < file` 
    + 从file输入
    + stdin 重定向到file

+ `cmd 2>file`
    + stderr 重定向file

+ `cmd >> file` 输出追加到file

+ `cmd < infile > outfile`
    + cmd infile读取内容 输出到outfile中

+ `n > file` 文件描述符到file
    + 0,1,2
+ `n >> file` 

+ `n >& m` 输出文件m,n合并
    + `cmd > file 2>&1`
        + stdout,stderr合并后到file

+ `n <& m` 输入文件m,n合并

+ `<<tag`开始tag和结束tag之间内容作为输入
```sh
cmd << delimiter
    ...
delimiter
```

+ `[cmd]   2>&1 | tee k3s.log` output 屏幕打印同时输出文件



## example
+ `echo "test" > users`


## tips

+ `/dev/null`
    + 丢弃写入其中的数据,返回成功
    + 比特桶（bit bucket）
    + 读取时返回EOF

+ `/dev/zero`
    + 读取时返回无限的NULL
        + 可以用来生成一个特定大小的空文件

+ EOF(End of file)
    + stream和file的结尾
    + 可以是stdin

## ref
+ [EOF是什么？](http://www.ruanyifeng.com/blog/2011/11/eof.html)
+ [10.5 数据流重导向](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/91.html)
