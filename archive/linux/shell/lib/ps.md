## process
<!-- install on debian -->
+ `apt-get install procps`

<!-- process   -->
+ `ps aux|grep <name>` 所有进程
    + `a`  与terminal不相干的process
    + `u`  effective user相关的process
    + `x`  和a一起用，完整信息
    + `l` 详细信息
    
+ `ps -A` 所有进程

+ `ps -l` 只与自己的bash相关的process

+ `ps axjf` 状态树

+ `ps aux | grep <name> | grep -v grep | awk '{print $2}'`
    + 得到进程Pid

+ `kill <pid>` 杀死进程
    + `kill -KILL <pid>` 强制杀死
    + `kill -9 <pid>` 彻底杀死
    + `kill $(</var/run/haproxy-checks.pid)`

+ ` killall <name>`
    + `killall -0 ...` 检查<name>是否存在
        + -0 不执行操作，但会有错误检查
            + process不存在时:<name> not found

+ `killall -1 rsyslogd`


+ `pstree -Aup` 进程树，同时显示pid,user

<!-- 运行状态             -->
+ `top -d 2` 每2秒更新一次，默认5s
+ `top -b -n 2 > /tmp/top.txt` 
+ `top -p <pid>`


<!-- 控制程序 signal -->
+ `kill -l` 显示signal
+ `kill -<signal> PID`

<!-- practice -->
+ `ps aux | grep 'rsyslogd' | grep -v 'grep'| awk '{print $2}'`
    + 获取pid

+ `kill -SIGHUP $（ps aux | grep 'rsyslogd' | grep -v 'grep'| awk '{print $2}'）`
    + 重启 rsyslogd process

## ref

+ [Linux ps 命令](https://www.runoob.com/linux/linux-comm-ps.html)
+ [Linux-ps命令学习](https://www.jianshu.com/p/943b90150c10)
+ [16.3 程序管理](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/141.html)