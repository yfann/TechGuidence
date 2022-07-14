## check info
+ `kubectl cluster-info dump` overall health of the cluster

+ `kubectl version --short`
+ `kubectl cluster-info`
+ `kubectl get componentstatus`
+ `kubectl get --raw /apis/metrics.k8s.io/v1beta1/nodes`
    + ` kubectl get --raw /healthz?verbose`
+ `kubectl api-resources -o wide --sort-by name`

+ `kubectl get events -A`
    + `kubectl get events --watch`
    + `kubectl get events --sort-by=.metadata.creationTimestamp`

+ `kubectl get nodes -o wide`
    + `kubectl get pods -o wide`

## cmd

<!-- kubectl debug -->
+ `kubectl debug -it keycloak-1 --image=busybox --target=istio-init -n keycloak`
<!-- kubectl run -->
+ `kubectl run busybox --image=busybox -n keycloak`
+ `kubectl run d –image alpine –command — /bin/sleep 1d`


<!-- update pod -->
+ `kubectl get pod {podname} -n {namespace} -o yaml | kubectl replace --force -f -`


## tips

+ docker k8s->local host
    - https://host.docker.internal/

## ref
+ [如何在 Kubernetes Pod 内进行网络抓包](https://zhuanlan.zhihu.com/p/493792509)
+ [Kubernetes 上调试 distroless 容器](https://mp.weixin.qq.com/s?__biz=MjM5OTg2MTM0MQ==&mid=2247484544&idx=1&sn=3279af9a0795489d2a812ec022938cfb&scene=21#wechat_redirect)

+ [kubectl run](https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_run/)

<!-- kubectl debug -->
+ [enable ephemeral container in k3s](https://stackoverflow.com/questions/61732373/how-to-enable-resource-ephemeralcontainers-in-rancher-kubernetes)

<!-- others -->
+ [Debug Running Pods](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-running-pod/)
+ [重启 Kubernetes Pod的几种方式](https://segmentfault.com/a/1190000020675199)

+ [Troubleshoot Clusters](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)