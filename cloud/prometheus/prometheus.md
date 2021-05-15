## cmd
+ `docker pull prom/prometheus`
+ `docker run -p 9090:9090 prom/prometheus`
+ `http://localhost:9090`
    - `.../metrics`
    - `.../targets`


## storage

+ on disk
    + blocks of two hours(每两小时写一次磁盘)
        + `--storage.tsdb.min-block-duration`
        + `--storage.tsdb.max-block-duration`


## install
+ `helm upgrade --install prometheus prometheus-community/kube-prometheus-stack -f prometheus-operator-values.yaml --version 14.8.1`



## tips
+ grafana datasource 要用Mac 局域网ip不能用localhost
+ prometheus
    - servicemonitor

## Prometheus
<!-- official doc -->
+ [prometheus API](https://prometheus.io/docs/introduction/overview/)
+ [prometheus 入门](https://www.hi-linux.com/posts/25047.html)
+ [Prometheus 中文文档](https://ryanyang.gitbook.io/prometheus/di-yi-zhang-jie-shao/overview)
+ [Prometheus Book](https://yunlzheng.gitbook.io/prometheus-book/)
<!-- exporter -->
+ [exporters](https://prometheus.io/docs/instrumenting/exporters/)
+ [prometheus/node_exporter](https://github.com/prometheus/node_exporter)
+ [PromCat]( PromCat.io )





<!-- pull -->
+ [Pull doesn't scale - or does it?](https://prometheus.io/blog/2016/07/23/pull-does-not-scale-or-does-it/)
+ [Prometheus and the Debate Over ‘Push’ Versus ‘Pull’ Monitoring](https://thenewstack.io/exploring-prometheus-use-cases-brian-brazil/)
+ [Push vs. Pull Monitoring Configs](https://medium.com/@steve.mushero/push-vs-pull-configs-for-monitoring-c541eaf9e927)

+ [微服务实战之Prometheus使用分享](https://www.jianshu.com/p/67ec2643c963)
+ [End-to-end monitoring with Prometheus](https://www.kancloud.cn/huyipow/prometheus/527563)

+ [对接普罗米修斯(自定义监控)](https://support.huaweicloud.com/usermanual-cce/cce_01_0201.html)
+ [普罗米修斯系统用户指南](https://support.huaweicloud.com/topic/94874-1-P-puluomixiusixitongyonghuzhinan)
+ [基于Prometheus的分布式在线服务监控实践](https://zhuanlan.zhihu.com/p/24811652)

+ [重磅！容器集群监控利器 阿里云Prometheus 正式免费公测](https://yq.aliyun.com/articles/709123)
+ [Prometheus® 云托管实例介绍](https://help.aliyun.com/document_detail/123098.html?spm=a2c4e.11153940.0.0.49357c0cfnkuh5)
+ [Prometheus监控数据格式学习](https://www.cnblogs.com/afterdawn/p/9025052.html)
+ [基于Grafana和Prometheus的监视系统](https://www.jianshu.com/p/339db34e4afe)
+ [Prometheus监控数据格式](https://www.jianshu.com/p/15f929160f38)
+ [一文搞懂 Prometheus 的直方图](https://juejin.im/post/5d492d1d5188251dff55b0b5)
+ [Prometheus监控Kubernetes系列1——监控框架](https://www.servicemesher.com/blog/prometheus-monitor-k8s-1/)
+ [Prometheus zhihu](https://www.zhihu.com/topic/20223143/hot)

<!-- detail -->
+ [Scrape data from pod upon annotation](https://www.weave.works/docs/cloud/latest/tasks/monitor/configuration-k8s/#per-pod-prometheus-annotations)
+ [query](https://prometheus.io/docs/prometheus/latest/querying/basics/)

<!-- install -->
+ [全手动部署prometheus-operator监控Kubernetes集群遇到的坑](https://www.servicemesher.com/blog/prometheus-operator-manual/)
<!-- install with prometheus-community  -->
+ [prometheus-community/helm-charts](https://github.com/prometheus-community/helm-charts)



<!-- mock data -->
+ [给Prometheus造假数据的方法](https://www.shangmayuan.com/a/964aace4f33f4ab19685ec1f.html)
+ [little-angry-clouds/prometheus-data-generator](https://github.com/little-angry-clouds/prometheus-data-generator)
+ [chanjarster/prometheus-mock-data](https://github.com/chanjarster/prometheus-mock-data)


<!-- monitor k8s -->
+ [Kubernetes monitoring with Prometheus, the ultimate guide](https://sysdig.com/blog/kubernetes-monitoring-prometheus/)
    +  kube-state-metrics
+ [How to Monitor Kubernetes API Server](https://sysdig.com/blog/monitor-kubernetes-api-server/)


<!-- practice -->
+ [网易云轻舟微服务监控：基于Prometheus的实践与踩过的坑](https://zhuanlan.zhihu.com/p/58999791)
+ [基于Prometheus的监控系统实践](https://zhuanlan.zhihu.com/p/101184971)
+ [基于Prometheus的微服务应用监控](https://zhuanlan.zhihu.com/p/51611454)
+ [通过gitlab-ci自动添加prometheus业务监控](https://zhuanlan.zhihu.com/p/54026576)
+ [Spring Boot 使用 Micrometer 集成 Prometheus 监控 Java 应用性能](https://blog.csdn.net/aixiaoyang168/article/details/100866159)
+ [Prometheus 监控报警系统 AlertManager 之邮件告警](https://blog.csdn.net/aixiaoyang168/article/details/98474494#3_Prometheus_19)
+ [Spring Boot Metrics监控之Prometheus&Grafana](https://www.jianshu.com/p/afc3759e75b9)
+ [Monitor Apache Kafka Using Grafana and Prometheus](https://medium.com/@mousavi310/monitor-apache-kafka-using-grafana-and-prometheus-873c7a0005e2)


