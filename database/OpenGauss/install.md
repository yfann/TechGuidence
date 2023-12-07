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
    + `vim /usr/local/Python-3.6.8/Modules/Setup`
        + 去掉注释`#zlib zlibmodule.c -I$(prefix)/include -L$(exec_prefix)/lib -lz`
    + `./configure --prefix=/usr/local/python3 --enable-shared`
    + `make`
    + `make install`
    + `ln -s /usr/local/python3/bin/python3  /usr/bin/python3`
        + `ln -s /usr/local/python3/bin/python3.6 /usr/bin/python3`
        + `ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3`
        + `ln -s /usr/local/python3/lib/libpython3.6m.so.1.0 /usr/lib64/`
        + `export LD_LIBRARY_PATH=/usr/local/python3/lib:$LD_LIBRARY_PATH`
    + `python3`


## issues
+ Failed to obtain local instance information. It is not a host name node1 .

## ref
+ [install openGauss](https://blog.csdn.net/qq_26960887/article/details/130278482)
+ [CentOS 快速安装Python3和pip3](https://cloud.tencent.com/developer/article/1693084)


+ [错误码参考](https://docs-opengauss.osinfra.cn/zh/docs/5.0.0/docs/DatabaseReference/GAUSS-52200----GAUSS-52299.html)