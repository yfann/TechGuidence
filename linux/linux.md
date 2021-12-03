# linux
+ `cat /proc/version` 查看内核


## setting
+ `ls -a`



## export
+ `export -p`
+ `export -n <name>`删除环境变量


## apt
<!-- 添加代理 -->
<!-- 代理必须添加 http://或https:// -->
+ /etc/apt/apt.conf
    + Acquire::http::proxy "http://127.0.0.1:8087/";
    + Acquire::https::proxy "https://127.0.0.1:8087/";
<!-- 或者 -->
+ `sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8000/" update`
    + `sudo apt-get -o Acquire::https::proxy="http://127.0.0.1:8000/" update`

+ `apt list --installed`
+ `sudo apt install golang-go`
+ `apt-get --purge remove golang-go`



## install manually
+ `wget <url>`
+ `sudo tar -C /usr/local -xzf /home/nikhita/Downloads/go1.8.1.linux-amd64.tar.gz`
+ `export PATH=$PATH:/usr/local/go/bin`
+ `echo $PATH | grep "/usr/local/go/bin"`


## tips
+ --pid-path=/var/run/nginx.pid 
    + 程序成功运行
    + kill <pid> 提供方便

+ --lock-path=/var/lock/nginx.lock 
    + 并发运行的instance通过检查lock文件是否存在来判断当前资源是否有其他Instance在使用


## ref
+ [UNIX Tutorial for Beginners](http://www.ee.surrey.ac.uk/Teaching/Unix/)

<!-- 概念 -->
+ [Linux 环境隔离机制 -- Linux Namespace](https://zhuanlan.zhihu.com/p/47571649)

+ [linux基础与shell编程](https://www.kancloud.cn/digest/linux-world/145297)

