
## install
+ `docker run -it -v ~/Documents/docker/:/datas centos`


## 目录管理
+ `ls`
    - `ls -a`包括隐藏文件
    - `ls -d`仅目录
    - `ls -l`详细
    - `ls -al`组合使用
    - `ls -ld /var/mail`
+ `cd ~` /root
+ `pwd`
    - `-P`显示真实路径 非连接
+ `mkdir`
    - `-m` 配置
    - `-p` 递归创建
    - `mkdir -p test1/test2/test3/test4`
    - `mkdir -m 711 test2`
+ `rmdir`删除空目录
    - `rmdir -p test1/test2/test3/test4`
+ `cp`复制
    - `-a` 等于`-pdr`
    - `-d` 复制连结档
    - `-f` 强制，删除目标重试
    - `-i` 覆盖时会先询问
    - `-l` hard link 创建
    - `-p` 复制属性
    - `-r` 递归复制
    - `-s` 符号连结档
    - `-u` destination旧才会复制
    - `cp -i ~/.bashrc /tmp/bashrc`
+ `rm`
    - `-f` force删除，忽略不存在的文件
    - `-i` 删除前询问
    - `-r` 递归
    - `rm -i bashrc`
+ `mv` 移动或改名
    - `-fiu` -u source比较新才会更新
    - `mv bashrc mvtest`
## 文件查看
+ `cat` 第一行开始显示
    - `-A`  相当于`-vET`
    - `-b` 非空白行显示行号
    - `-E` 断行显示$
    - `-n` 行号
    - `-T` 显示tab键 `^|`
    - `-v` 显示特殊字符
+ `tac` 最后一行开始显示和`cat`相反
+ `nl` 显示输出行号
    - `-b a` 同`cat -n`
    - `-b t` 同`cat -b`
    - `-n ln` 左方显示行号
    - `-n rn` 右方显示不加0
    - `-n rz` 右侧显示加0
    - `-w` 行号站位数
+ `more` 翻页
    - `more /etc/man_db.config`
    - `空格键` 下翻一页
    - `Enter` 下翻一行
    - `/<str>` 向下搜`<str>`
    - `:f` 显示文档名和行数
    - `q` 退出
    - `b` 上翻页
+ `less` 翻页
    - 空格 下翻
    - `pagedown/pageup`
    - `/<str>` 向下搜
    - `?<str>` 向上搜
    - `n`重复前一个搜索
    - `N`反向重复前一个搜索
    - `q`退出
+ `head` 默认显示前10行
    - `head -n 20 /etc/man.config` 
+ `tail`
    - `-n 数字`
    - `-f` 持续侦测   `ctrl-c`断开
## yum
+ `yum install <pkg>`
+ `yum update <pkg>`
+ `yum list`
+ `yum remove <pkg>`
+ `yum search <pkg>`
+ `yum check-update`列出所有可更新软件
+ `yum update` 更新所有
+ `yum clean`清除缓存
    - `yum clean packages` 
    - `yum clean headers/odheaders`
+ 更换repo
    - `mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup` backup
    - `wget http://mirrors.163.com/.help/CentOS6-Base-163.repo`下载国内repo
    - `mv CentOS6-Base-163.repo CentOS-Base.repo`
    - `yum clean all`
    - `yum makecache`
## tips
+ linux链接
    - Hard Link（多个文件名称指向同一个文件(inode)，删除其中一个不影响另一个）
        + `ln f1 f2`创建f1的硬链接f2
    - Symbolic Link(A是B的软链接,A指向的文件存放的B的路径信息,删除B,A指向无效信息)
        + `ln -s f1 f2`创建符号连接
+ `mount /dev/cdrom /media/`挂载光盘到media
+ 安装时缺失库
    - `yum provides libstdc++.so.6` 查到缺失库路径再`yu install`
## ref
+ [mac中使用docker搭建linux开发服](https://www.jianshu.com/p/d26140d20cc0)
+ [【CentOS7快速上手】1、基础命令/常用命令](https://ken.io/note/centos-quickstart-basiccommand)
+ [Linux 教程](https://www.runoob.com/linux/linux-tutorial.html)
+ [Linux链接](https://www.runoob.com/linux/linux-file-content-manage.html)