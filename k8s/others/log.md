
## 容器日志
+ STOUT
+ STDERR

## k8s日志
+ 应用(Pod)级别
+ 节点级别
+ 集群级别

+ k8s中logging Driver为JSON文件

## 集群级日志架构
+ 生命周期独立于pod
+ sidecar收集容器日志(文件，套接字...)到自己的stdout,stderr
+ logging-agent
    + 节点级别
    + 一个运行的容器
    + DaemonSet
    + 收集容器的stdout,stderr。然后上传到后端
    + filebeat,logrotate

+ 有logging-agent功能的sidecar


## ref
+ [日志架构](https://kubernetes.io/zh/docs/concepts/cluster-administration/logging/#logging-at-the-node-level)
+ [Configure logging drivers](https://docs.docker.com/config/containers/logging/configure/)

+ [Kubernetes(k8s)那些套路之日志收集](https://zhuanlan.zhihu.com/p/70662744)
+ [logrotate学习使用](https://www.jianshu.com/p/a29c84a5d1ac)
+ [fluentd](https://docs.fluentd.org/)