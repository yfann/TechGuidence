

## blackbox_exporter

+ `additionalScrapeConfigs[]` kube-prometheus-stack/value.yaml
```yaml
additionalScrapeConfigs: 
      - job_name: 'uptime-check-endpoint'
        metrics_path: /probe
        params:
          module: [http_2xx]
        static_configs:
          - targets:
            - https://google.com
            - https://abc.com:8080
            - <add-external-and-internal-endpoint>
                
        relabel_configs:
          - source_labels: [__address__]
            target_label: __param_target
          - source_labels: [__param_target]
            target_label: instance
          - target_label: __address__
            replacement: prometheus-blackbox-exporter:9115
```
+ `helm upgrade prometheus ./kube-prometheus-stack/  -n monitoring`

## ref
<!-- blackbox_exporter 和 prometheus集成 -->
+ [Additional Scrape Configuration](https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/additional-scrape-config.md)
+ [prometheus/blackbox_exporter](https://github.com/prometheus/blackbox_exporter)
+ [Uptime monitoring with Prometheus and Grafana](https://sterba.dev/posts/uptime-monitoring/)
+ [Monitor Uptime of Endpoints in K8s using Blackbox Exporter](https://medium.com/@akashjoffical08/monitor-uptime-of-endpoints-in-k8s-using-blackbox-exporter-f80166a328e9)
+ [网络探测：Blackbox Exporter](https://yunlzheng.gitbook.io/prometheus-book/part-ii-prometheus-jin-jie/exporter/commonly-eporter-usage/install_blackbox_exporter)
