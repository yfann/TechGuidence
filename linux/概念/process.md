


## tips

+ process
    + pid
    + uid
    + gid

+ pid
    + 关联权限
    + 运行时生成

+ 父子程序
    + ppid(parent pid)
        + `ps -l`

+ fork and exec
    + fork复制process

+ pidfile
    + 防止进程启动多个副本。 只有获得pid文件(固定路径固定文件名)写入权限(F_WRLCK)的进程才能正常启动并把自身的PID写入该文件中

+ `ls` 执行完后Pid很快就终止

+ /etc/crontab 
    + crond每分钟都会扫描配置

+ systemd是系统改的第一只程序，是所以程序的父程序

## ref
+ [16.3 程序管理](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/141.html)
+ [LINUX PID 1和SYSTEMD 专题](https://www.huaweicloud.com/articles/81c6c4ba2cf1a055d117ad2a4f5460ce.html)

+ [job](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/140.html)