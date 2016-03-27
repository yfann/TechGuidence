#MicroService

+ 优点 
  - 独立部署,节省部署测试时间
  - 对有瓶颈的服务单独扩展
  - 根据服务的特点，如读写频繁度等，用不同技术实现
  
+ 原则
  - 设计时，先考虑服务分割再考虑组件分割
  - 考虑服务分割粒度，一个服务能完成特点的业务逻辑，独立资源的CRUD
  - 粗粒度接口，减少服务间的调用次数
  - 建立回话，缓存信息，减少对对公共服务(权限)的调用(需要解决让同一个服务实例处理同一个用户的问题)


+ 服务调用
  - service locator
  - message broker
  - gateway

+ 思考
  - 如何划分服务
  - 数据一致性 
 
#Ref
+ [Microservice架构模式简介](http://www.cnblogs.com/loveis715/p/4644266.html)
+ [Microservice Anti-patterns](http://www.cnblogs.com/loveis715/p/5315860.html)