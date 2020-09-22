## sudo
+ sudo 的环境变量和默认环境不一样
    + `sudo -E xxx` 保留当前环境变量

## 脚本权限
+ `ls -l xxx.sh`
    - `-rw-r--r--` owner group world/other
+ `chmod +x xxx.sh` add executable permission
+ `sudo ./xxx.sh`
+ `env | grep ^PATH`
+ `sudo env | grep ^PATH` sudo的path和普通用户的不一样



## ref
+ [Command not found when using sudo](https://stackoverflow.com/questions/12996397/command-not-found-when-using-sudo)
+ [如何解决sudo命令找不到环境变量的问题](http://ghoulich.xninja.org/2017/05/09/how-to-find-env-variables-when-exec-sudo-commands/)