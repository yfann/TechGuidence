# Vagrant

+ 虚拟环境的管理工具
    + 不同机器间迁移虚拟环境
<!-- prerequisite -->
+ VirtualBox
    + vagrant 要与VirtualBox版本一致
        + `vagrant --version`
<!-- or -->
+ VMware
<!-- or -->
+ hyper-V(windows)

## install

+ `brew install vagrant`
+ `brew upgrade vagrant`
+ `vagrant plugin update`

## cmd

+ `vagrant -h`
    + `vagrant <sub cmd> -h`

+ `vagrant global-status`

<!-- 管理box，box相当于镜像 -->
+ `vagrant box add <box> --provider virtualbox`  从vagrant官方仓库搜索
    + `vagrant box add <box> <url>` url远程或本地
+ `vagrant box list` 列出已经安装的box(add)
    + 存放于$HOME/.vagrant.d/或$VAGRANT_HOME/.vagrant.d/

<!-- 安装vm -->
+ `vagrant init <box>` <box> 官方名称可以直接使用。先本地（$HOME/.vagrant.d/）查找镜像，找不到从官方下载
    + `hashicorp/precise64`  hyperv
    + `ubuntu/focal64` vbox
        + windows下需要打开virtualBox,开启vm,才能使用`vagrant ssh`
    + `generic/centos7`
+ `vagrant init` 选择目录,创建vagrantfile

+ `vagrant up  [name|id]` 根据vagrantfile创建机器,启动机器
    + ` --provider hyperv`
    + run as admin

<!-- operation -->
<!-- 目录下运行 -->
+ `vagrant suspend`
    + `vagrant resume`
+ `vagrant halt [name|id]` shut down

+ `vagrant reload` 使修改过的vagrantfile生效,先halt再up
    + `vagrant reload --provision ` Force the provisioners to run

+ `vagrant destroy -f <name>|<id>` 删除vm
    +  `-f` force
+ `vagrant status` 


<!-- ssh, 进入镜像 -->
+ `vagrant ssh` 目录执行
    + `ssh vagrant@127.0.0.1 -p 2222 -i <private key path>`
        + `vagrant ssh-config`
    + `logout`

+ `vagrant ssh <name>`

+ `vagrant ssh-config`

<!-- debug -->
+ `set VAGRANT_LOG=info`
    + `vagrant up`

+ `vagrant up --debug &> vagrant.log`






<!-- 网络 -->
+ `vagrant port [name]`

## plugins
<!-- copy file -->
+ `vagrant plugin install vagrant-scp`
    + `vagrant scp abc.txt :destFile.txt`
        + from host to Guest(VM)
    + `vagrant scp :abc.txt destFile.txt`
        + from guest to host
    + `vagrant scp [vm1]:abc.txt destFile.txt`

<!-- proxy -->
+ `vagrant plugin install vagrant-proxyconf`
```conf
; Vagrantfile
config.proxy.http     = "http://yourproxy:8080"
config.proxy.https    = "http://yourproxy:8080"
config.proxy.no_proxy = "localhost,127.0.0.1"
```






## network
+ `t.vm.network "private_network"`
    + `config.vm.network "private_network", ip: "192.168.0.17"`
    + `config.vm.network "private_network", type: "dhcp"`
    + virtualbox: host-only模式
+ `t.vm.network "public_network"`
    + `config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"` 指定网卡
    + virutalbox: bridge模式
+ vagrant总会设置第一个网卡(eth0/ens0等)并将其加入virtualbox的NAT模式

+ VM中`ip route show` 找到连接host的IP

## provision

+ 可以把相关工具打包到box中

+ provision
    + 可以运行shell,ansible,docker,podman,file
    + provision的时机
        + 第一次vagrant up时会provision
        + `vagrant up --provision`
        + `vagrant reload --provision`
        + `vagrant provision`
        + config.vm.provision:run:always

```ini
config.vm.provision "shell", inline: "echo Hello, World"
config.vm.provision "shell", path: "script.sh"
; Vagrantfile 同级目录
```


## proxy
+ cmd line proxy
    + 拉取镜像时需要代理
    + 连接虚拟机时关闭代理





## tips

+ vSwitch(virtual switch)
    + 虚拟交换机
    + 二层
    + 软件方式实现物理交换机的网络功能
    + IaaS

+ vagrant/vagrant
    + 默认账号

+ `/vagrant`
    + `f.vm.synced_folder ".","/vagrant"`
        + "." 宿主机目录，相对于vagrantfile的位置。也可以绝对路径
    + 目录同步

+ VAGRANT_HOME
    + 设置镜像存储位置

+ `auto_config: false`
    + 指定ip是设置

## ref

+ [vagrant](https://www.vagrantup.com/docs/providers/hyperv)

+ [熟练使用vagrant](https://www.junmajinlong.com/virtual/index/#vagrant)

+ [boxes](https://app.vagrantup.com/boxes/search)

<!-- tips -->
+ [Using scp and vagrant-scp in VirtualBox to copy from Guest VM to Host OS and vice-versa](https://medium.com/@smartsplash/using-scp-and-vagrant-scp-in-virtualbox-to-copy-from-guest-vm-to-host-os-and-vice-versa-9d2c828b6197)

<!-- details -->
+ [Provisioning](https://www.vagrantup.com/docs/provisioning)

<!-- 网络 -->
+ [熟练使用vagrant(11)：vagrant配置虚拟机网络](https://www.junmajinlong.com/virtual/vagrant/vagrant_network/)
+ [Public Networks](https://www.vagrantup.com/docs/networking/public_network)
+ [Vagrant (三) - 网络配置](https://www.jianshu.com/p/a1bc23bc7892)

<!-- pulgins -->
+ [vagrant-scp](https://github.com/invernizzi/vagrant-scp)