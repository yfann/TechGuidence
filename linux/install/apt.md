# apt-get

+ ubuntu,Debian

## cmd

+ `apt list`
    + `apt list --installed`

+ `apt search <key>`

+ `sudo apt install <pkg>`
+ `sudo apt remove <pkg>`

## proxy
<!-- 添加代理 -->
<!-- 代理必须添加 http://或https:// -->
```sh
# /etc/apt/apt.conf
Acquire::http::proxy "http://127.0.0.1:8087/";
Acquire::https::proxy "http://127.0.0.1:8087/";
```

<!-- 或者 -->
+ `sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8000/" update`
+ `sudo apt-get -o Acquire::https::proxy="http://127.0.0.1:8000/" update`

+ `apt list --installed`
+ `sudo apt install golang-go`
+ `apt-get --purge remove golang-go`


## ref

+ [Linux apt 命令](https://www.runoob.com/linux/linux-comm-apt.html)