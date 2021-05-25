# Thanos


+ Sidecar


+ Thanos Query
    + PromQL查询
    + 查询有Store API的组件
        + Thanos Store
        + Thanos Sidecar
        + Thanos Query
    + 去重

+ Thanos Query Frontend
    + 查询拆分
    + 缓存结果

+ store
    + `thanos store`
    + Thanos store gateway
        + 给query使用
    + 暴露对象存储给Query

+ Thanos Compactor
    + 单例，压缩数据
    + 降采样(Downsample)，提升查询
        + 历史数据不需要太精确

+ Ruler
    + 通过Thanos query查询数据并计算出新指标并存储
        + 分布式的Prometheus，每个Prometheus只有部分数据不能做计算
    + 提供Store API
        + Query可以访问Ruler
    + alert

+ Receiver
    + 代替Sidecar
        + query需要查询Sidecar来获取最新数据（2hour）
    + 支持Prometheus remote write API
        + Prometheus实时push data到Thanos Receiver
    + 上传数据到对象存储


## 镜像参数
<!-- Query -->
+ `--store`
    + 指定实现了Store API的地址
        + Sidecar,Ruler,Store Gateway,Receiver
    + 一般使用服务发现机制
        + 同集群可以DNS SRV
            + `--store=dnssrv+_grpc._tcp.prometheus-headless.thanos.svc.cluster.local`
                + headless service
        + 集群外使用`--store.sd-files`
            + ConfigMap中写地址，更新不需要重启Query


## debug
<!-- query debug -->
+ `curl 'http://thanos-query.thanos.svc.cluster.local:9090/api/v1/query?query=kube_namespace_created'`
    + thanos-query 为服务名

## issues
+ thanos 上传数据到oss：`unsupported type of io.Reader`
    + 可能是thanos镜像版本问题

+ query 时返回`No StoreAPIs matched for this query`
    + curl http://thanos-query.thanos.svc.cluster.local:9090/api/v1/query?query=kube_namespace_created
        + 默认查当前时间的kube_namespace_created
        + 如果thanos query中没有加入sidecar,会查不到最新数据（2小时）。
    + curl http://thanos-query.thanos.svc.cluster.local:9090/api/v1/query?query=kube_namespace_created%5B6h%5D
        + 带上时间查询 kube_namespace_created[6]

## tips
+ external labels

+ ingress ip:443 ---> thanos sidecar
    + ingress通过443接口暴露gPRC服务


## ref
+ [thanos](https://thanos.io/tip/thanos/quick-tutorial.md/)
<!-- 介绍 -->
+ [Thanos 架构详解*******](https://k8s.imroc.io/monitoring/build-cloud-native-large-scale-distributed-monitoring-system/thanos-arch/)
+ [一文读懂Thanos多集群监控](http://dockone.io/article/2432427)
+ [Introducing Thanos: Prometheus at scale](https://www.improbable.io/blog/thanos-prometheus-at-scale)
+ [Thanos 组件介绍以及使用心得](http://dockone.io/article/10035)


<!-- detail -->
+ [Service Discovery](https://github.com/thanos-io/thanos/blob/main/docs/service-discovery.md)
+ [Sidecar](https://viva.gitbook.io/project/cloud-native/prometheus/thanos/zu-jian/sidecar)
<!-- deploy  -->
+ [Thanos 部署与实践***********](https://k8s.imroc.io/monitoring/build-cloud-native-large-scale-distributed-monitoring-system/thanos-deploy/)
+ [thanos-io/kube-thanos******](https://github.com/thanos-io/kube-thanos/)
    + [kube-thanos/manifests/](...)
+ [Configuring Thanos Secure TLS Cross-Cluster Communication](https://thanos.io/tip/operating/cross-cluster-tls-communication.md/)  

<!-- deploy thanos sidecar using prometheus helm chart -->
+ [Example Deploying sidecar using official Prometheus Helm Chart](https://github.com/thanos-io/thanos/blob/f1ee264ff10619ec875703f4e31549b43df3b47b/tutorials/kubernetes-helm/README.md)

<!-- prometheus operator安装thanos sidecar -->
+ [prometheus operator](https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/values.yaml)
+ [ThanosSpec](https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#thanosspec)
+ [prometheus-operator/example/thanos/](https://github.com/prometheus-operator/prometheus-operator/tree/master/example/thanos)

<!-- ruler -->
+ [Integrate Thanos With Prometheus And Alertmanager](https://docs.bitnami.com/kubernetes/infrastructure/thanos/administration/enable-metrics/)

<!-- image -->
+ [thanos images](https://quay.io/repository/thanos/thanos?tag=latest&tab=tags)

<!-- ruler -->
+ [Alerts ruler example](https://github.com/thanos-io/thanos/blob/48c8c0fda70da488068841cf48a3a174a8df1d88/examples/alerts/alerts.md#Ruler)