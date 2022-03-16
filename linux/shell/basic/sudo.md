## sudo

+ `sudo`
    + 为非root user授予root权限
+ `visudo`
    + 编辑`/etc/sudoers`,sudo的配置文件



## user

+ `sudo adduser <user name>` 创建用户
+ `sudo passwd <user name>` 设置密码
+ `visudo <user name> ALL=(ALL) ALL`
    + first ALL: 允许使用sudo的主机
    + second ALL: 使用sudo的身份
    + third ALL: sudo允许执行的命令
    + `test ALL =(root)/usr/sbin/useradd`
        + test任意主机登录，以root身份执行useradd命令
+ `su <user name>` 切换用户

+ `sudo su` 切换到root


## 脚本权限
+ `ls -l xxx.sh`
    - `-rw-r--r--` owner group world/other
+ `chmod +x xxx.sh` add executable permission
+ `sudo ./xxx.sh`
+ `env | grep ^PATH`
+ `sudo env | grep ^PATH` sudo的path和普通用户的不一样


## sudo环境变量
+ sudo 的环境变量和默认环境不一样
    + `sudo -E xxx` 保留当前环境变量？？？？
    + `sudo env "PATH=$PATH" env "http_proxy=..." <cmd>`
        + `alias sp='sudo env "https_proxy=...."env "PATH=$PATH"'`
        
+ `sudo vim /etc/sudoers`
    + Defaults env_reset 

## chmod
+ `chmod -R 777 <folder>`

## su
+ `su -`超级用户
    + `-`切换环境变量
    + `exit`
+ `chmod u+w /etc/sudoers`
+ ``

## ref
+ [Command not found when using sudo](https://stackoverflow.com/questions/12996397/command-not-found-when-using-sudo)
+ [如何解决sudo命令找不到环境变量的问题](http://ghoulich.xninja.org/2017/05/09/how-to-find-env-variables-when-exec-sudo-commands/)
+ [Ubuntu下创建非root用户但赋予sudo权限](https://www.jianshu.com/p/99118b7da846)
+ [sudo与visudo的超细用法说明](https://blog.51cto.com/chenfage/1830424)