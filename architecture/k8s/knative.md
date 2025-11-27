# knative
+ knative通过trigger并发投递消息
+ 如果knative发现service后端的pod忙会扩容
    + Knative 是基于 queue-proxy 上报的数据来判断 Pod 是否忙的。
+ queue-proxy
    + Knative Serving 为每个 Pod 自动注入一个 sidecar
        + [queue-proxy] -> [your app container]
    + 作用
        + 控制并发（比如限制一个 Pod 最多 X 并发）
        + 给请求排队
        + 采集当前并发/排队指标并上报给 Autoscaler