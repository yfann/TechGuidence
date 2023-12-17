# Opentelemetry

+ OpenCensus +  OpenTracing

+ Otel Collector
    + Receivers
        + 兼容数据采集协议
    + Processor
        + 解耦数据处理


+ signal
    + traces
    + metrics
    + logs

+ collector pipline
    + receiver
    + processor
    + exporter

+ event
    + 时间戳
    + 一组属性
        + 可以被搜索
        + context
            + static contex
                + resource
            + dynamic  contex
                + span
+ event aggregate
    + metrics


+ Receiver--->Processor---->Exporter
    + OTLP 

## Opentelemetry stack
+ Grafana loki
+ Grafana
+ Grafana Tempo
+ Grafana Mimir


## distributed tracing
+ Zipkin
+ Jaeger

## ref
+ [OTel](https://opentelemetry.io/docs/)
+ [OpenTelemetry: 经得起考验的工具](https://www.cnblogs.com/charlieroro/p/13862471.html)
+ [OpenTelemetry-云原生资料库](https://jimmysong.io/opentelemetry-obervability/history.html)
+ [exproter-->vendors](https://opentelemetry.io/vendors/)
