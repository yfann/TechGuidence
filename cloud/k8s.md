
## k8s(container orchestration)

+ master
    - API server
    - Controller
    - Scheduler
    - etcd
+ node
    - Pod(包含Contianer,Volume)
    - Kubelet
    - Container Runtime

+ Deployment(包含多个Pod)
+ Service(一个或多个Pod的稳定访问地址)
    - ClusterIP
    - NodePort
    - LoadBlance
+ Namespace(集群内的逻辑隔离,pod都有Namespace)
+ Classic F5
    - Service
    - Deployment
    - Pod
    - ReplicaSet
    - Ingress

## install
+ virtualBox
 
## tips

+ kubectl config
    - c:\users\[account]\.kube\config



## ref
+ [Kubernetes Handbook](https://jimmysong.io/kubernetes-handbook/)
+ [k8s](https://www.kubernetes.org.cn/doc-11)
+ [Kubernetes](http://hardocs.com/d/kubernetes/145-kubectl_config.html)
+ [十分钟带你理解Kubernetes核心概念](http://www.dockone.io/article/932)
+ [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
+ [Windows下的包管理器Chocolatey](https://www.jianshu.com/p/831aa4a280e7)
+ [helm](https://www.hi-linux.com/posts/21466.html)
+ [K8S从懵圈到熟练](https://yq.aliyun.com/search?q=K8S%E4%BB%8E%E6%87%B5%E5%9C%88%E5%88%B0%E7%86%9F%E7%BB%83&type=ARTICLE)
+ [从零开始入门 K8s | 手把手带你理解 etcd](https://zhuanlan.zhihu.com/p/96721097)
+ [K8S从懵圈到熟练 – 集群网络详解](https://zhuanlan.zhihu.com/p/67894883)
