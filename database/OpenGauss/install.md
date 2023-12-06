# install openGauss


## 安装环境
+ CentOS 7.9
+ Python 3.6.8
    + `yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel`
    + `yum install gcc -y`
    + `wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz`
    + `my Python-3.6.8.tgz /usr/local/`
    + `mkdir /usr/local/python3`
    + `cd /usr/local/`
    + `tar -xvf Python-3.6.8.tgz`
    + `cd /usr/local/Python-3.6.8`
    + `./configure --prefix=/usr/local/python3`
    + `make`
    + `make install`
    + `ln -s /usr/local/python3/bin/python3  /usr/bin/python3`
    + `python3`

## ref
+ [install openGauss](https://blog.csdn.net/qq_26960887/article/details/130278482)
+ [CentOS 快速安装Python3和pip3](https://cloud.tencent.com/developer/article/1693084)