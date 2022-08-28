

## cmd
+ `kubectl expose rc example --port=8765 --target-port=9376 --name=example-service --type=LoadBalancer`

## tips
+ `service.spec.externalTrafficPolicy`
    + Cluster
    + Local
        + 保留客户端源IP
        + 和SLB service同个Node的pod才能curl到

## ref
+ [创建外部负载均衡器](https://kubernetes.io/zh/docs/tasks/access-application-cluster/create-external-load-balancer/)

<!-- ali cloud -->
+ [Service的负载均衡配置注意事项](https://help.aliyun.com/document_detail/181517.html?spm=a2c4g.11186623.6.762.32799002Kriei2)

<!-- cmd -->
+ [kubectl expose](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#expose)