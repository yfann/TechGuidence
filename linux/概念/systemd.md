# daemons

+ CentOS 7.x systemd取代init
    +  /etc/init.d/daemon start
        + stand alone
        + super daemon


# systemd

+ 服务同时启动，而不是init挨个启动

+ on-demand启动
    + systemd服务，常驻内存
        + systemctl指令

+ unit(服务单位)
    + service
    + socket
    + target
        + 多个daemons集合
    + path
    + timer

+ 兼容init脚本

+ systemctl不支持自订参数，/etc/init.d/daemon 更灵活

+ 手动启动的服务(直接输命令),systemd无法管理

## systemctl
<!-- /run/systemd/system/ -->
<!-- /usr/lib/systemd/system/ -->
<!-- /etc/systemd/system/ -->
+ `systemctl <cmd> <unit>`
    + cmd: start/stop/restart/reload/enable/disable/status/is-active/is-enable
        + enable 开机启动

+ `systemctl` 列出所有unit

+ `systemctl list-units`
    + `systemctl list-units --all` 包括没启动的units
    + `systemctl list-units --type=target --all`

+ `systemctl list-unit-files`
    + `/usr/lib/systemd/system/`

+ `systemctl list-sockets`

+ `systemctl poweroff/reboot/suspend/...`


## path

+ `/usr/lib/systemd/system/` 系统内置
+ `/etc/systemd/system/` 修改过的
    + `/etc/systemd/system/vsftp.service.d/custom.conf`会merge回`/usr/lib/systemd/vsftpd.service`

## 日志

+ systemd 使用systemd-journald.service记日志
    + `ls -R /var/log/journal/`

+ journalctl 查看日志
    + `-p` 设置级别
        + `journalctl -p err --lines=10`
    + `--lines` 最后几行
    + `-f` 只显示最新的日志项，并且不断显示新生成的日志项
    + `--boot` 本次启动后发生的日志
    + `--grep="REGEXP"`
        + `journalctl --boot --grep="Wifi"`
    + `--all` 完整显示
    + `-u` unit
        + `journalctl -u k3s`
    + `--no-pager` 不分页完整显示

## tips

+ runlevel
    + 7

## ref

+ [17.1 什么是 daemon 与服务 （service）](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/148.html)
+ [Systemd 入门教程：命令篇](https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html)

+ [systemctl 针对 service 类型的配置](https://zq99299.github.io/linux-tutorial/tutorial-basis/17/03.html)

<!-- 查看sytemd日志 -->
+ [How To Use Journalctl to View and Manipulate Systemd Logs](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs)
+ [journalctl：查询 systemd 日记](https://documentation.suse.com/zh-cn/sles/12-SP4/html/SLES-all/cha-journalctl.html)