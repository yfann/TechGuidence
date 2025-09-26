
# wget

+ 指定url下载文件

## cmd

+ `wget <url>`

+ `wget -O <name> <url>`
    + 重命名下载文件

+ `wget -c <url>`
    + 断点续传

+ `wget -t n <url>`
    + 尝试n次
    + n为0，则一直尝试
    + 404 不会重试

+ `wget -i <file>`
    + 文件保存多个下载链接

+ `wget -b <url>`
    + 后台执行
    + `tail -f wget-log` 查看进度

+ `wget --spider -timeout=1 <service name>`
    + `--spider` 不下载任何文件

+ `wget --http-user <username> --http-password <pwd> <url>`
    + 网络下载

## tips
+ `--limit-rate=300k`
+ `--ftp-user`
    + `--ftp-password=PASS`
+ `--http-user=USER`
    + `--http-password=PASS`
+ `--timeout`
    + sec


## ref
+ [wget命令](https://man.linuxde.net/wget)
+ [Linux wget 命令用法详解](https://www.jianshu.com/p/59bb131bc2ab)