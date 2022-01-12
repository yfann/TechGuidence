# haproxy log

<!-- haproxy.log -->

```conf
# to have these messages end up in /var/log/haproxy.log you will
# need to:
#
# 1) configure syslog to accept network log events.  This is done
#    by adding the '-r' option to the SYSLOGD_OPTIONS in
#    /etc/sysconfig/syslog
#
# 2) configure local2 events to go to the /var/log/haproxy.log
#   file. A line like the following can be added to
#   /etc/sysconfig/syslog
#
#    local2.*                       /var/log/haproxy.log
```

## haproxy rsyslog

```cfg
global
    ...
    log 127.0.0.1 local0 info
    log 127.0.0.1 local1 warning
    ...
defaults
    ...
    log global
    option httplog
    ...
```

+ `vi /etc/rsyslog.d/haproxy.conf`
```conf
# Collect log with UDP
$ModLoad imudp
$UDPServerAddress 127.0.0.1
$UDPServerRun 514
# $FileCreateMode 0644  #日志文件的权限
# $FileOwner ha  #日志文件的owner
# Creating separate log files based on the severity
local0.*     /var/log/haproxy.log 
local1.*     /var/log/haproxy_warn.log
```

+ `vi /etc/sysconfig/rsyslog`
```cfg
SYSLOGD_OPTIONS="-c 2 -r -m 0"
```

+ `service rsyslog restart`
+ `service haproxy restart`

## ref
+ [Introduction to HAProxy Logging](https://www.haproxy.com/blog/introduction-to-haproxy-logging/)
+ [为rsyslog添加haproxy日志的配置](https://segmentfault.com/a/1190000039713086)