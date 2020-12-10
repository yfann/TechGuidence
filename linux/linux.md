<!-- windows WSL -->

## set http proxy
+ `ls -a`
+ `~/.bashrc` 当前用户
+ `/etc/.bashrc` 所有用户
+ `source ~/.bashrc`


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