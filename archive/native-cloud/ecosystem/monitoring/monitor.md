
## k8s host monitor(VM/BMS)
+ metrics
    + CPU
    + Mem
    + Disk
    + DiskIO
    + NET
    + NETstat
    + Processes
    + SYstem
    + Conntrack
    + Vmstat

+ 原理
    + 读取OS的数据（/proc,syscall）做一些简单计算

+ tools
    + Telegraf
        + Data: string
            + 不兼容时序库
    + Grafana-agent
        + same to node-exporter
    + Datadog-agent
    + node-exporter
    + Categraf

## k8s node
+ container
    + metrics
        + cpu
        + mem
+ pod
    + metrics
        + net IO
+ 原理
    + 读取cAdvisor(Kubelet集成 /metrics/cadvisor)
        + docker,containerd都能采集

## k8s control plane

+ apiserver
    + /metrics 接口暴露监控数据
    + metrics
        + apiserver_request_total
            + 请求量，可以统计美妙请求数，陈功率
        + apiserver_reqeust_duration_seconds
            + 请求延迟
        + process_cpu_seconds_total
            + CPU使用时间
        + process_resident_momory_bytes
            + 进程内存使用

+ controller-manager
    + /metrics
    + metrics
        + workqueue_depth
        + workqueue_adds_total
        + process_cpu_seconds_total

+ scheduler
    + /metrics
    + metrics
        + scheduler_pending_pods

+ etcd
    + /metrics
    + metrics
        + etcd_server_has_leader
        + etcd_server_proposals_failed_total


## k8s resources monitoring

+ kube-state-metrics
    + 读取apiserver，将k8s的结构化转为metrics
    + /metrics

+ metrics
    + service metrics
    + namespace metrics

+ ksm deploy


## app in pod monitoring

+ 埋点
    + statsd
        + app内嵌statsd sdk,截获请求后通过UDP推送兼容statsd协议的agent(telegraf,datadog-agent),agent在内存中做指标聚合，然后推到服务端
            + UDP
                + fire-and-forget
                + agent挂了不影响业务
    + prometheus sdk
        + 聚合在sdk里完成，即业务进程中完成,然后暴露/metrics

+ log to metrics（如果不能修改代码则可以通过日志的方式
    + mtail
        + 解析日志提取metrics

## 中间件监控
+ zookeeper/rabbitmq
    + /metrics

## tips

+ java埋点方案
    + micrometer
    + statsd sdk
    + prometheus sdk

+ sidecar抓取器 
    + 抓取 /metrics 
    + 发到server

+ 采样数据
    + 通过降低准确度来降低流量

## ref

+ [云原生监控体系建设](https://www.bilibili.com/video/BV1Jt4y1n7Na?spm_id_from=444.41.list.card_archive.click&vd_source=d3c0a53193a65728ad278e633b3790e5)
+ [Monitoring 的工作原理](https://docs.ranchermanager.rancher.io/zh/integrations-in-rancher/monitoring-and-alerting/how-monitoring-works)