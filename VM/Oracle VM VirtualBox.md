# VM VirtualBox


## 安装Centos7.9
<!-- 配置 -->
+ General->Advanced->Bidirectional
+ Storage->Controller:IDE->Centos.iso
+ network->Adapter2->host-only
    + 访问host网络
    
<!-- 网络配置 -->
+ enable
    + Ethernet enp0s3
    + Ethernet enp0s8
        + configure
            + IPv4 Settings
                + Manual
                + Add 
                    + IP:...
                    + Gateway: 192.168.56.1
                        + defualt host only adapter for VBox

<!-- yum proxy -->
+ `vi /etc/yum.conf`
    + `proxy=http://...`

<!-- 安装桌面 -->
+ `yum -y update`
+ `yum groupinstall -y "GNOME Desktop""Graphical Administration Tools"`
+ `systemctl set-default graphical.target` 图形界面
    + `systemctl set-default multi-user.target` 命令行界面
+ `reboot`