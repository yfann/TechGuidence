
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

+ virtualBox(为了安装hypervisor)
+ MiniKube
+ kubectl
 
## tips

+ kubectl config
    - c:\users\[account]\.kube\config

+ 容器(单进程模型)
    - 视图隔离资源受限的进程
    - 容器里PID=1的进程就是应用本身
    - 管理虚拟机=管理基础设施
    - 管理容器=管理应用
    - kubernetes=操作系统
    - 镜像=软件包
    - pod=进程组
+ Pod(逻辑单位，进程组)
    - 包含多个容器(容器间超亲密关系，容器之间通信，localhost调用...,共享)
    - 原子调度单位
    - 容器共享Pod资源
    - 共享网络 Infra Container
    - 共享存储 Pod级别volume
+ 容器设计模式
    - 部署Tomcat+WAR
        + Init Container 先启动，拷贝war到volume
        + Tomcat容器使用该volume
    - Sidecar
        + Pod中定义专门容器为主容器做辅助工作（Init Container）
        + 辅助功能与业务解耦
        + 重用辅助功能
        + 日志,代理容器,适配器容器
+ k8s资源对象
    - Spec 期望的状态
    - Status 观察到的状态
    - Metadata
        + Labels
            - key:Value
            - 可以被select
        + Annotations(资源注解)
            - key:Value
            - 存储非表示信息
            - 比label大
            - 可以包含特殊字符
            - 可以包含JSON等结构数据
        + OwnerReference(描述资源间关系)
            - 谁创建了pod谁拥有pod
+ 控制器模式(声明式)
    - 每个资源都对于一个控制器(可以自定义控制器),控制器使资源的status趋向Spec
    - 命令式API(按步骤执行)
    - 声明式API(按目标)
    - 控制循环
    - sensor

## ref
+ [Kubernetes Handbook](https://jimmysong.io/kubernetes-handbook/)
+ [k8s](https://www.kubernetes.org.cn/doc-11)
+ [Kubernetes](http://hardocs.com/d/kubernetes/145-kubectl_config.html)
+ [十分钟带你理解Kubernetes核心概念](http://www.dockone.io/article/932)
+ [K8S从懵圈到熟练](https://yq.aliyun.com/search?q=K8S%E4%BB%8E%E6%87%B5%E5%9C%88%E5%88%B0%E7%86%9F%E7%BB%83&type=ARTICLE)
+ [K8S从懵圈到熟练 – 集群网络详解](https://zhuanlan.zhihu.com/p/67894883)

+ [Windows下的包管理器Chocolatey](https://www.jianshu.com/p/831aa4a280e7)
+ [helm](https://www.hi-linux.com/posts/21466.html)
+ [从零开始入门 K8s | 手把手带你理解 etcd](https://zhuanlan.zhihu.com/p/96721097)
+ [kubectl](https://kubernetes.io/zh/docs/reference/kubectl/)

+ [Minikube - Kubernetes本地实验环境](https://yq.aliyun.com/articles/221687)
+ [Install Minikube](https://kubernetes.io/zh/docs/tasks/tools/install-minikube/)