## process
  <!-- process   -->
+ `ps aux|grep <name>` 所有进程
    + 需要`apt-get install procps`
    + `a` 所有进程
    + `u` 用户为主格式
    + `x` 不易终端机区别

+ `ps -A` 所有进程

+ `ps aux | grep <name> | grep -v grep | awk '{print $2}'`
    + 得到进程Pid

+ `kill <pid>` 杀死进程
    + `kill -KILL <pid>` 强制杀死
    + `kill -9 <pid>` 彻底杀死
    + `kill $(</var/run/haproxy-checks.pid)`
    + `kill -0 ...` <pid>是否存在

+ ` killall <name>`
    + `killall -0 ...` 检查<name>是否存在
        + -0 不执行操作，但会有错误检查
            + process不存在时:<name> not found
            
## ref

+ [Linux ps 命令](https://www.runoob.com/linux/linux-comm-ps.html)
+ [Linux-ps命令学习](https://www.jianshu.com/p/943b90150c10)