# rsyslog

+ syslog server

+ /etc/rsyslog.conf 
+ /etc/logrotate.conf
+ /etc/rsyslog.d
+ /var/log/


## cmd
+ `sudo apt install -y rsyslog`
    + install on Ubuntu
    + centOS自带rsyslog
+ `rsyslogd -version`



##  rsyslog.conf
+ `vi /etc/rsyslog.conf ` or `vi /etc/rsyslog.d/xxx.conf`
```conf
# Collect log with UDP
$ModLoad imudp
$UDPServerAddress 127.0.0.1
$UDPServerRun 514

local2.* /var/log/test.log
```

<!-- test -->
+ `logger -p local2.info "hello~"`
    + local0~local7


## ref
+ [System: Controlling what logs where with rsyslog.conf](https://www.the-art-of-web.com/system/rsyslog-config/)
+ [Linux环境下使用rsyslog管理日志](https://segmentfault.com/a/1190000003509909)
+ [rsyslog](https://wiki.gentoo.org/wiki/Rsyslog)
