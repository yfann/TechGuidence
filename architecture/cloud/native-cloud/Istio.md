# Istio

+ Control Plane
    + istiod
        + Pilot
        + Citadel
        + Galley
+ Data Plane
    + Envoy sidecar组成
        + Envoy代理
            + data plane流量都经过Envoy代理

+ 服务发现/负载均衡

## cmd
+ `kubectl get svc istio-ingressgateway -n istio-system`


## tips

+ label `istio-injection=enabled ` on namespace
+  external load balancer

## ref
+ [Istio](https://istio.io/latest/zh/docs/examples/microservices-istio/setup-kubernetes-cluster/)
+ [Istio架构](https://istio.io/latest/zh/docs/ops/deployment/architecture/)


+ [Kubernetes Ingress with istio](https://istio.io/latest/docs/tasks/traffic-management/ingress/kubernetes-ingress/)
+ [istio Gateways](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/)