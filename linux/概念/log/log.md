# linux log


## cmd 

+ `tail -f [-n 5] /var/log/syslog`
+ `dmesg`
    + `dmesg | less`
    + kernel ring buffer

## tail
 <!-- 1、监控文件尾部内容，会不断刷新，默认是十行，可添加参数 -->
+ `tail -f filename`  //显示文件尾部十行日志，不断刷新。
+ `tail -100f filename` //显示文件尾部100行日志，不断刷新

<!-- 2、显示文件最后n行 -->
+ `tail -n 100 filename`   //显示日志最后100行

<!-- 3、我们还可以结合grep管道，来对关键词做筛选 -->
+ `tail -100f filename | grep "关键词"` //查询最后一百行 含有“关键词” 的日志

## less
+ `less -p` 关键词 //搜索关键词
+ `tail -f filename | less -N`
    + 显示行号

## 启动java,记录控制台日志
+ `nohup java -jar xx.jar>nohup.out 2>&1 &`
    + 控制台日志输出到nohup.out文件中
+ `nohup java -jar xx.jar>/dev/null 2>&1 &`
    + 不保存控制台日志
+ `tail -10f nohup.out` 查看日志

## tips
+ logs for
    + system
    + kernel

+ `/var/log` system log
    + syslog




## ref
+ [Viewing Linux Logs from the Command Line](https://www.linux.com/topic/desktop/viewing-linux-logs-command-line/)
