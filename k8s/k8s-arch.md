
## control plane(master nodeß)
+ etcd
    + 乐观锁（ metadata.resourceVersion）
    + RAFT 
    + 奇数个实例(分成两半后其中多数的一方可以更新state)
+ API server
    + store resources in etcd and notify chients about the change
    + 操作etcd的唯一入口
    + request->Authentications->Authorizations->Admission controls
        + Admission Control会修改资源，添加或修改字段
    + request如果只是获取数据,不会经过Admission controls
    + clients 通过HTTP connection watch资源
        + 如果资源发生变化，API server会发送新版本的资源到HTTP connection到clients
        + clients包括kubectl,control plane components

+ Scheduler 
    + wait new pod through the API server's watch mechanism
    + assign a node to new pod
    + update the pod definition throught API server for scheduled pod
    + scheduling algorithm
        + filter nodes which the pods can be scheduled to
        + Prioritizing the acceptable nodes
    + pod can set schedulerName(pod is scheduled using a named Scheduler)

+ Controller Manager
    + controller
        + make resources' actual state towards the desired state(reconciliation)
        + watch the API server for changes to resources
        + run a reconciliation loop
            + reconciles the actual state with the desired state,writes the actual state to the resource's status section




## worker node
+ kubelete 只能运行在system上，其他component可以运行在pod上
    + responsible for everything running on a worker node
    + monitor running contianers
    + run liveness probes
        + restart containers when i't fail

+ kube-proxy
    + userspace proxy
        + client---------iptables---------->kube-proxy-->pod
            + round-robin
    + iptable proxy
        + client-------iptables----->pod
            + randomly

## add-ons
+ enable feature
+ deployed as pods
    + deploy by Deployment,RC,DaemonSet

+ DNS add-on
    + pods use the cluster's internal DNS server by default
    + exposed by kube-dns service

## cmd
+ `kubectl get componentstatuses`
+ `kubectl attach`
    + 类似于`kubectl exec`, `kubectl attach`会attach到container的main process而不是单独启动一个
+ `kubectl get po -o custom-columns=POD:metadata.name,NODE:spec.nodeName --sort-by spec.nodeName -n kube-system`
<!-- etcd -->
+ `etcdctl ls /registry/pods/default`  etcd中的key是个directory，可以看到内部的key
    + `etcdctl get /registry --prefix=true` etcd version3 不支持文件夹作为key，可以做为前缀
+ `etcdctl get /registry/pods/default/kubia-159041347-wt6ga`
<!-- API server -->
+ `kubectl get pods --watch`
## ref
+ [admission controllers](https://kubernetes.io/docs/admin/admission-controllers/)