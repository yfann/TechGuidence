# daemons

+ CentOS 7.x systemd取代init
    +  /etc/init.d/daemon start
        + stand alone
        + super daemon


## systemd

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

## tips

+ runlevel
    + 7

## ref

+ [17.1 什么是 daemon 与服务 （service）](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/148.html)