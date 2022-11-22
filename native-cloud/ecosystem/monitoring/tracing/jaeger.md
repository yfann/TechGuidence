# Jaeger

+ Jaeger-client
    + client libraries
    + 接收request时创建span
        + 附加 trace id, Span id, baggage传出
    + 采样

+ jaeger-agent
    + 网络守护进程
    + 监听UDP发送的span
    + 发送给COllector

+ jaeger-collector
    + 写入DB

+ jaeger-query
    + UI




## Jaeger-Operator

+ create Jaeger instance 

```sh
# default strategy allInOne 
kubectl apply -n observability -f - <<EOF
apiVersion: jaegertracing.io/v1
kind: Jaeger
metadata:
  name: simplest
EOF
```
<!-- 查看 -->
```sh
kubectl get jaegers -n observability
kubectl get pods -l app.kubernetes.io/instance=simplest -n observability
kubectl logs -l app.kubernetes.io/instance=simplest  -c jaeger -n observability
kubectl get -n observability ingress
```

+ jaeger instance

```yaml
apiVersion: jaegertracing.io/v1
kind: Jaeger
metadata:
  name: my-jaeger
spec:
  strategy: allInOne # <1>
  allInOne:
    image: jaegertracing/all-in-one:latest # <2>
    options: # <3>
      log-level: debug # <4>
  storage:
    type: memory # <5>
    options: # <6>
      memory: # <7>
        max-traces: 100000
  ingress:
    enabled: false # <8>
  agent:
    strategy: DaemonSet # <9>
  annotations:
    scheduler.alpha.kubernetes.io/critical-pod: "" # <10>
```

## all-in-one
+  all-in-one image 
  + agent
  + collector
  + query
  + ingestor
  + Jaeger UI
  + memory storage



+ Default hostname of Jaeger agent is localhost
<!-- add agent -->
+ `kubectl annotate deployments.apps tasks-service sidecar.jaegertracing.io/inject=true`
+ 6831 端口上报
+ 16686 Jaeger UI,API端口




## jaeger client
+ `pip install jaeger-client`






## tips
+  one Jaeger Operator per namespace in multi-tenant scenarios

+ backend components
    + agent,collector,query service

+ strategy
    + allInOne
        + which deploys the “all-in-one” image (agent, collector, query, ingester, Jaeger UI) in a single pod, using in-memory storage by default.
    + production
        + storage
        + Each of the backend components is therefore separately deployed.
        + The agent can be injected as a sidecar on the instrumented application or as a daemonset.
    + streaming
        + The streaming strategy is designed to augment the production strategy by providing a streaming capability that effectively sits between the collector and the backend storage (Cassandra or Elasticsearch)
        + reducing the pressure on the backend storage,
        + 在collector和storage间添加缓存
            + kafka

+ Jaeger instance (CR)
+ cluster-mode 
    + watch
        + CR
        + annotation: sidecar.jaegertracing.io/inject: true or jaeger instance name(same namespace)
            + namespace
            + deployments
    + requries
        + ClusterRole
        + ClusterRoleBinding

+ none Cluster-mode
    + `WATCH_NAMESPACE` in jaeger-operator deployment
```yaml
    env:
    - name: WATCH_NAMESPACE
        value: default,observability
```
    + RoleBinding
        + jaeger-operator in on namespace to watch another namespace
```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: jaeger-operator-in-default
subjects:
- kind: ServiceAccount
  name: jaeger-operator
  namespace: observability
roleRef:
  kind: Role
  name: jaeger-operator
  apiGroup: rbac.authorization.k8s.io
```


## ref
+ [jaeger-operator](https://github.com/jaegertracing/jaeger-operator)
+ [Operator for Kubernetes](https://www.jaegertracing.io/docs/1.38/operator/)
+ [微服务监控 - Jaeger 简介](https://makeoptim.com/distributed-tracing/jaeger)
+ [jaeger architecture](https://www.jaegertracing.io/docs/1.16/architecture/)
+ [sampling](https://www.jaegertracing.io/docs/1.16/sampling/)
+ [All in One](https://www.jaegertracing.io/docs/1.21/getting-started/)

<!-- sample -->
+ [Jaeger 教程](https://pjw.io/articles/2018/05/18/jaeger-tutorial/)
+ [Integrating Flask with Jaeger tracing on Kuberentes](https://vorozhko.net/integrating-flask-with-jaeger-tracing-on-kuberentes)
+ [使用 jaeger 给你的微服务进行分布式链路追踪](https://kebingzao.com/2020/12/25/jaeger-use/)
+ [Distributed Tracing Infrastructure with Jaeger on Kubernetes](https://masroorhasan.medium.com/tracing-infrastructure-with-jaeger-on-kubernetes-6800132a677)
