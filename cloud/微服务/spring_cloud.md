## list
+ spring cloud
+ dubbo
+ 分布式事物
+ 分布式锁
+ zookeeper

## spring cloud
+ Eureka（服务注册中心，各个服务启动时，Eureka Client都会将服务注册到Eureka Server，并且Eureka Client还可以反过来从Eureka Server拉取注册表，从而知道其他服务在哪里）
+ Ribbon（服务间发起请求的时候，基于Ribbon做负载均衡，从一个服务的多台机器中选择一台）
+ Feign（基于Feign的动态代理机制，根据注解和选择的机器，拼接请求URL地址，发起请求，简化其他服务的调用）
+ Hystrix（隔离、熔断、降级用于解决一个服务挂掉导致调用它的其他服务也挂掉，防止连锁反应）
+ Zuul（微服务网关，如果前端、移动端要调用后端系统，统一从Zuul网关进入，由Zuul网关转发请求给对应的服务。可以做统一的降级、限流、认证授权、安全等）


## Eureka vs zookeeper
Zookeeper保证了CP（C：一致性，P：分区容错性），Eureka保证了AP（A：高可用）

（1）当向注册中心查询服务列表时，我们可以容忍注册中心返回的是几分钟以前的信息，但不能容忍直接down掉不可用。就是说，服务注册功能对高可用性要求比较高，但zk会出现这样一种情况，当master节点因为网络故障与其他节点失去联系时，剩余节点会重新选leader。问题在于，选取leader时间过长，30 ~ 120s，且选取期间zk集群都不可用，这样就会导致选取期间注册服务瘫痪。在云部署的环境下，因网络问题使得zk集群失去master节点是较大概率会发生的事，虽然服务能够恢复，但是漫长的选取时间导致的注册长期不可用是不能容忍的。

（2）Eureka保证了可用性，Eureka各个节点是平等的，几个节点挂掉不会影响正常节点的工作，剩余的节点仍然可以提供注册和查询服务。而Eureka的客户端向某个Eureka注册或发现时发生连接失败，则会自动切换到其他节点，只要有一台Eureka还在，就能保证注册服务可用，只是查到的信息可能不是最新的。除此之外，Eureka还有自我保护机制，如果在15分钟内超过85%的节点没有正常的心跳，那么Eureka就认为 户端与注册中心发生了网络故障，此时会出现以下几种情况：
①、Eureka不 从注册列表中移除因为长时间没有收到心跳而应该过期的服务。
②、Eureka仍然能够接受新服务的注册和查询请求，但是不会被同步到其他节点上（即保证当前节点仍然可用）
③、当网络稳定时，当前实例新的注册信息会被同步到其他节点。
因此，Eureka可以很好的应对因网络故障导致部分节点失去联系的情况，而不会像Zookeeper那样使整个微服务瘫痪。

## ref
+ [redis分布式锁](https://juejin.im/post/5bf3f15851882526a643e207)
+ [spring cloud](https://juejin.im/post/5be13b83f265da6116393fc7)
