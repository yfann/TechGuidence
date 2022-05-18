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
<!-- install -->
+ `kubectl -n istio-system get deploy`
+ `kubectl -n istio-system get IstioOperator installed-state -o yaml`

## gateway

+ `kubectl get svc istio-ingressgateway -n istio-system`
    + `export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')`
    + `export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')`
    + `echo "INGRESS_HOST=$INGRESS_HOST, INGRESS_PORT=$INGRESS_PORT"`
    + ` curl -s -I -HHost:httpbin.example.com "http://$INGRESS_HOST:$INGRESS_PORT/status/200"`
+ `mesh`
    + for internal calls

## istioctl

+ `istioctl install`
+ `istioctl analyze -n <name space> --kubeconfig k8s.yaml`
<!-- profile -->
+ `istioctl profile list` configs can be accessable via istioctl
+ `istioctl profile dump <profile name>`
    + `istioctl profile dump --config-path components.pilot demo`
    + `istioctl profile diff default demo`
<!-- manifest -->
+ `istioctl manifest generate > $HOME/generated-manifest.yaml`
    + `kubectl apply -f -`
        + not equal to `istioctl install`
+ `istioctl manifest generate > 1.yaml`
+ `istioctl manifest generate -f samples/operator/pilot-k8s.yaml > 2.yaml`
+ `istioctl manifest diff 1.yaml 2.yaml`
+ `istioctl verify-install -f $HOME/generated-manifest.yaml`

## debug
+ `kubectl logs  istio-ingressgateway-65c8999c6f-smdcw  -n istio-system`

+ `./istioctl pc route istio-ingressgateway-667f585f87-75dxv.istio-system -oyaml`
    + `kubectl get pods -n istio-system`
    +  cluster: outbound|8000||httpin.test.svc.cluster.local

+ `./istioctl pc cluster istio-ingressgateway-667f585f87-75dxv.istio-system -oyaml`

## istio-proxy
+ 15000
    + `.. curl localhost:15000/stats`
    + `curl http://localhost:15000/config_dump`
    + `kubectl  exec -it -c istio-proxy <pod> -n <ns> -- curl http://localhost:15000/help`
    + `kubectl -n test exec -it -c istio-proxy httpbin-85464b86f8-7ghks -- curl http://localhost:15000/logging?level=trace`
+ `kubectl logs PODNAME -c istio-proxy -n NAMESPACE`


## destinationrule

+ 定义cluster

## match
+ regex
```yaml
  - match:
    - uri:
        regex: "/usrv(/.*)?"
```


## tips

+ 注入istio-init container(创建pod时注入)
    + label `istio-injection=enabled ` on namespace
    + `kubectl label namespace default istio-injection=enabled --overwrite`
    + `kubectl get namespace -L istio-injection`

+  external load balancer

+ edge router


+ fqdn
    + name.namespaces.svc.cluster.local

+ tlsMode: istio/

+ gateway
```yaml
tls:
      httpsRedirect: true
```

## ref
+ [Istio](https://istio.io/latest/zh/docs/examples/microservices-istio/setup-kubernetes-cluster/)
+ [Istio架构](https://istio.io/latest/zh/docs/ops/deployment/architecture/)

<!-- documents -->
+ [Virtual Service](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
+ [Istio常见问题：默认重试2次、超时、503](https://blog.csdn.net/a605692769/article/details/115639976?spm=1001.2101.3001.6650.2&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-115639976-blog-124611136.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-115639976-blog-124611136.pc_relevant_default&utm_relevant_index=5)

<!-- tls -->
+ [Understanding TLS Configuration](https://istio.io/latest/docs/ops/configuration/traffic-management/tls-configuration/)
+ [VirtualService TLSRoute](https://istio.io/latest/docs/reference/config/networking/virtual-service/?ie=utf-8&hl=en&docs-search=tls#TLSRoute)
+ [Secure Gateways](https://istio.io/latest/docs/tasks/traffic-management/ingress/secure-ingress/)

<!-- ingress -->
+ [Kubernetes Ingress with istio](https://istio.io/latest/docs/tasks/traffic-management/ingress/kubernetes-ingress/)
+ [istio Gateways](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/)
    + [gateway](https://istio.io/latest/docs/reference/config/networking/gateway/)


<!-- samples -->
+ [httpbin sample](https://github.com/istio/istio/tree/release-1.13/samples/httpbin)
+ [Bookinfo Application](https://istio.io/latest/docs/examples/bookinfo/)

<!-- debug -->
+ [Traffic Management Problems](https://istio.io/latest/docs/ops/common-problems/network-issues/)
+ [在 Istio 中调试 503 错误 - DestinationRule双向tls](https://blog.csdn.net/weixin_34097242/article/details/91438981?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-91438981-blog-124611136.pc_relevant_antiscanv2&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-91438981-blog-124611136.pc_relevant_antiscanv2&utm_relevant_index=2)
+ [一个Istio请求的生命周期 - 从云提供商的SLB到istio-ingressgateway***网络***istio***](https://juejin.cn/post/6844903881634217998)
