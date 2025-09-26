
## elasticsearch的操作
+ ElasticsearchRepositorie
+ ElasticsearchTemplate

## 配置
```yml
spring:
  data:
    elasticsearch:
      # 集群名
      cluster-name: syncwt-es
      # 连接节点,注意在集群中通信都是9300端口，否则会报错无法连接上！
      cluster-nodes: localhost:9300,119.29.38.169:9300
      # 是否本地连接
      local: false
      repositories:
        # 仓库中数据存储
        enabled: true
```

## ref
+ [SpringBoot+Elasticsearch](https://www.cnblogs.com/cjsblog/p/9756978.html)
+ [spring-boot集成elasticsearch及其简单应用](https://www.jianshu.com/p/35f9f867f48f)