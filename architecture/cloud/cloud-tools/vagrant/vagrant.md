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


## cmd

+ `vagrant init <box>`
    + `hashicorp/precise64`  hyperv
    + `ubuntu/focal64` vbox
        + windows下需要打开virtualBox,开启vm,才能使用`vagrant ssh`
    + `generic/centos7`
+ `vagrant up`
    + ` --provider hyperv`
    + run as admin
+ `vagrant destroy -f`
+ `vagrant reload`

<!-- ssh -->
+ `vagrant ssh`
    + `ssh vagrant@127.0.0.1 -p 2222 -i <private key path>`
        + `vagrant ssh-config`
    + `logout`
+ `vagrant ssh-config`

+ `vagrant status`
    + `vagrant global-status`

<!-- box -->
+ `vagrant box list`

<!-- debug -->
+ `set VAGRANT_LOG=info`
+ `vagrant up`

+ `vagrant up --debug &> vagrant.log`


<!-- plugins -->
+ `vagrant plugin install vagrant-scp`
    + `vagrant scp abc.txt :destFile.txt`
        + from host to Guest
    + `vagrant scp :abc.txt destFile.txt`
        + from guest to host
    + `vagrant scp [vm1]:abc.txt destFile.txt`

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

## ref

+ [vagrant](https://www.vagrantup.com/docs/providers/hyperv)

+ [熟练使用vagrant](https://www.junmajinlong.com/virtual/index/#vagrant)

+ [boxes](https://app.vagrantup.com/boxes/search)

<!-- tips -->
+ [Using scp and vagrant-scp in VirtualBox to copy from Guest VM to Host OS and vice-versa](https://medium.com/@smartsplash/using-scp-and-vagrant-scp-in-virtualbox-to-copy-from-guest-vm-to-host-os-and-vice-versa-9d2c828b6197)