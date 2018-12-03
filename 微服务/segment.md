## 多IDC架构：Redis

![multi-redis.png](img/multi-redis.png)

+ proxy代表客户端
+ 黑色箭头代表读，红色箭头代表写
+ 虚线机房分割
+ proxy只从本地redis读数据，但会把数据写到主redis,主redis会把数据写到其他从redis.如果主redis挂掉后，同机房的从redis提升为主Redis