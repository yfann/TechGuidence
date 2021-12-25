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


## cmd

+ `vagrant init <box>`
    + `hashicorp/precise64`  hyperv
    + `ubuntu/focal64` vbox
        + windows下需要打开virtualBox,开启vm,才能使用`vagrant ssh`
+ `vagrant up`
    + ` --provider hyperv`
    + run as admin

<!-- ssh -->
+ `vagrant ssh`
    + `ssh vagrant@127.0.0.1 -p 2222 -i <private key path>`
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


## ref

+ [vagrant](https://www.vagrantup.com/docs/providers/hyperv)

+ [boxes](https://app.vagrantup.com/boxes/search)