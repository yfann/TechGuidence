## cmd
+ `cat /etc/shells` 查看有多少种shell
+ `chmod +x <./test.sh>`赋权限
+ `./test.sh` 执行脚本，不加`./`会在PATH中找，只有`/bin`,`/sbin`,`/usr/bin`,`/usr/sbin`在PATH中
+ `/bin/sh tset.sh`指定解释器运行脚本
+ `source ~/.bashrc`使配置立马生效

## tips

+ shell function 加到`.zshrc`中,可在窗口中直接调用

## ref
+ [Mac下Shell脚本使用](https://www.jianshu.com/p/780cdac4e9a7)
+ [shell教程](https://www.runoob.com/linux/linux-shell-func.html)