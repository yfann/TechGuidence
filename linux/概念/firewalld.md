# firewalld

+ 包过滤防火墙(网络层防火墙)
    + firewalld（用户态）
        + 默认拒绝
        + 管理netfilter（内核中实现包过滤防火墙的内部结构）
    + iptables
        + 默认允许
    + ebtables

## cmd

+ `systemctl start|restart|status|disable|stop firewalld`
    

+ `firewall-cmd --help`
+ `firewall-cmd --state`

+ zone
    + `firewall-cmd --get-zone-of-interface=eth0`
        + 查看接口的zone
    + `firewall-cmd --set-default-zone=public`
        + 设置默认接口区域
    + `firewall-cmd --get-active-zones`

+ add
    + `firewall-cmd --zone=public --add-interface=eth0`
        + 接口添加到zone
    + `firewall-cmd --zone=<zone name> --add-port=8080/tcp` 
    + `firewall-cmd --zone=work --add-service=smtp`

+ `firewall-cmd --zone=<zone name> --list-ports`
    + 查看所有打开的端口
    

+ `firewall-cmd --panic-on` 拒绝所有包
    + `firewall-cmd --panic-off` 取消拒绝
    + `firewall-cmd --query-panic` 查看是否拒绝

+ `firewall-cmd --reload` 更新防火墙规则
    + `firewall-cmd --complete-reload` 需要重启服务

+ `firewall-cmd --zone=public --add-port=80/tcp --permanent`
    + `--permanent` 重启后任然有效
    +


## ref

+ [Linux系统安全Centos 7的Firewalld防火墙基础](https://zhuanlan.zhihu.com/p/94101480)