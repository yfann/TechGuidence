# haproxy log

+ /var/log/haproxy.log


```cfg
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

## haproxy log

```cfg
global
    ...
    log 127.0.0.1 local0 info
    log 127.0.0.1 local1 warning
    ...
defaults
    ...
    log global
    ...
```

+ 