
## tips
+ override maps a Prometheus label to a Kubernetes group-resource
```yml
# microservice is a prometheus label in matrix
resources:
  overrides:
    microservice: {group: "apps", resource: "deployment"}
```
+ rules 支持custom和external
```yml
rules:
  default: false
  external:
```

+ prometheusUrl: http://{prometheus service name}.{namespace}.svc.cluster.local

## ref
+ [stable/prometheus-adapter](https://github.com/helm/charts/tree/master/stable/prometheus-adapter)
+ [prometheus-adapter-docs](https://github.com/DirectXMan12/k8s-prometheus-adapter/tree/master/docs)
+ [Custom-metrics API](https://knative.dev/docs/serving/custom-metrics-api/)