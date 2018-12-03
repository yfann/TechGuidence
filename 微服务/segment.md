## 多IDC架构：Redis

![multi-redis.png](img/multi-redis.png)

+ proxy代表客户端
+ 黑色箭头代表读，红色箭头代表写
+ 虚线机房分割
+ proxy只从本地redis读数据，但会把数据写到主redis,主redis会把数据写到其他从redis.如果主redis挂掉后，同机房的从redis提升为主Redis


## 网关层的功能

+ 请求鉴权（authentication
+ 数据完整性检查（数据包定长Header+变长body
+ 协议转换（JSON->HashMap(String,Object)
+ 路由转发(根据CMD转发到不同业务逻辑层
+ 服务治理（限流，降级，熔断等

## 网关比较

|对比维度|Zuul|Spring Cloud Gateway|Nginx|Kong|Tyk|Node.js|
|--|--|--|--|--|--|--|
|编程语言|Java|java|C|C+Lua|Go|JS|
|成熟度|高|低|高|高|高|高|
|使用成本|低|较低|高|较低|较低|较低|
|IO模型|BIO|Netty|epoll|epoll|AIO|AIO|
|技术生态|Netflix|Spring Cloud|Nginx社区|OpenRestry|Go社区|NodeJS社区|
|适应场景|网关|网关|负载均衡|网关|网关|网关|
