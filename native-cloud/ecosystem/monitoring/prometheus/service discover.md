
# prometheus service discover

+ scraping exporter or metrics port

## static_configs

+ 手动配置IP,port
    + 重启Prometheus发现


## 基于注册中心
+ Consul

## 基于文件的服务发现
+ /data/prometheus/conf/prometheus-file-sd.yml
    + file_sd_configs
+ service prometheus restat

## 基于DNS的发现
+ dns_sd_configs


## service monitor
+  ServiceMonitor配置Prometheus的监控采集规则
+ `kubectl edit servicemonitor/prometheus-grafana -n monitoring`

+ Service Monitor Selector
    + `kubectl -n monitoring describe prometheus prometheus-kube-prometheus-prometheus`
    + service monitor需要满足的条件(添加label)
        

## pod monitor







## ref
<!-- service monitor -->
+ [ServiceMonitor](https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/user-guides/running-exporters.md)
+ [Prometheus Operator ServiceMonitor Troubleshooting](https://managedkube.com/prometheus/operator/servicemonitor/troubleshooting/2019/11/07/prometheus-operator-servicemonitor-troubleshooting.html)
+ [getting-started](https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/user-guides/getting-started.md#related-resources)
+ [通过ServiceMonitor创建服务发现](https://help.aliyun.com/document_detail/260895.html)

+ [管理Kubernetes集群服务发现](https://help.aliyun.com/document_detail/217556.html)
+ [Prometheus监控神器-服务发现篇](https://segmentfault.com/a/1190000023765950)
+ [Prometheus-operator 介绍和配置解析](https://zhuanlan.zhihu.com/p/76835425)