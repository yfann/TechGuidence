
## control plane(master nodeß)
+ etcd
    + 乐观锁（ metadata.resourceVersion）
    + RAFT 
    + 奇数个实例(分成两半后其中多数的一方可以更新state)
+ API server
    + the only component that communicates with etcdß
+ Scheduler
+ Controller Manager

## worker node
+ kubelete 只能运行在system上，其他component可以运行在pod上

## cmd
+ `kubectl get componentstatuses`
+ `kubectl attach`
    + 类似于`kubectl exec`, `kubectl attach`会attach到container的main process而不是单独启动一个
+ `kubectl get po -o custom-columns=POD:metadata.name,NODE:spec.nodeName --sort-by spec.nodeName -n kube-system`
<!-- etcd -->
+ `etcdctl ls /registry/pods/default`  etcd中的key是个directory，可以看到内部的key
    + `etcdctl get /registry --prefix=true` etcd version3 不支持文件夹作为key，可以做为前缀
+ `etcdctl get /registry/pods/default/kubia-159041347-wt6ga`