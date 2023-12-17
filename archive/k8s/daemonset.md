# DaemonSet

+ 为每个node建立一个pod

## tips
+ 和depoyment区别
    + depoyment
        + 部署无状态服务,对副本扩容
    + daemonSet
        + 运行在全部或特定node上，先与其他pod启动


## ref
+ [DaemonSet](https://kubernetes.io/zh/docs/concepts/workloads/controllers/daemonset/)
+ [static Pods](https://kubernetes.io/docs/tasks/configure-pod-container/static-pod/)
    + Kubelet直接在node上管理此pod
    + API server不会watch此pod