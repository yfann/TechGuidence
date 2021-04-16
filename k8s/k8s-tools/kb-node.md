
## cmd

+ `kubectl get node`
+ `kubectl top node <node name>`
+ `kubectl describe node <node name>`
    + 查看 limit.cpu
+ `kubectl label node minikube disk=ssd`

## tips

+ capacity
    + node上的资源总量
+ allocatable
    + 可消耗的资源量

## ref
+ [节点](https://kubernetes.io/zh/docs/concepts/architecture/nodes/#capacity)