## redis

## install on windows
- redis with vagrant
    + download [vagrant](https://www.vagrantup.com/downloads.html)
    + download [vagrant-redis](https://raw.github.com/ServiceStack/redis-windows/master/downloads/vagrant-redis.zip)
    + `vagrant up` 在vagrant-redis所在目录执行
- MS native port of redis
    + download [redis-windows](https://github.com/ServiceStack/redis-windows/tree/master/downloads)c or Nuget
    + `redis-server.exe redis.windows.conf`
    + `redis-cli.exe`
    ```cmd
        redis 127.0.0.1:6379> SET foo bar
        OK
        redis 127.0.0.1:6379> KEYS *
        1) "foo"
        redis 127.0.0.1:6379> GET foo
        "bar"
        redis 127.0.0.1:6379>
    ```
## tools

+ [ServiceStackApps/RedisReact](https://github.com/ServiceStackApps/RedisReact#download)  UI

## issue

+ VT-x is disabled


## ref

+ [redis document](https://redis.io/documentation)
+ [MSOpenTech/redis](https://github.com/MSOpenTech/redis)
+ [ServiceStack/redis-windows](https://github.com/ServiceStack/redis-windows)
+ [Windows下安装并设置Redis](http://blog.csdn.net/renfufei/article/details/38474435)
+ [Redis【入门】就这一篇](https://zhuanlan.zhihu.com/p/37982685)
+ [Redis分布式锁](https://juejin.im/post/5ce5638ef265da1b91636a56)
