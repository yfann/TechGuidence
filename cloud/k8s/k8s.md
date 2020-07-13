
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

## docker容器
+ 容器：视图隔离，资源可限制，独立文件系统的进程集合(镜像的实例)
    - docker run(init容器)
    - 数据卷（docker volume）：容器产生的数据持久化到特定的目录，生命周期独立于容器
+ 容器镜像：运行容器的所有文件集合（模板）
+ Dockerfile: 描述镜像构建步骤（分层，复用）
+ changeset: 构建步骤产生的文件系统的变化(节约资源，提高分发效率)

## Pod(逻辑主机，进程组)
- Pod是一个服务的多个进程的聚合单位
- 创建后分配UID
- 一般一个pod一个容器（Docker）
- 可包含多个容器(容器间超亲密关系，容器间通过localhost，进程间通信(IPC,Inter-process communication)，共享网络和存储)
- k8s的原子调度单位
- 容器共享Pod资源
- 共享网络 Infra Container，容器共享IP和端口
- 共享存储 Pod级别volume，Pod是临时实体
- 唯一IP
- 在node中
- namespace,cgroup隔离
- controller创建管理过个pod
    + 例如Deployment,StatefulSet,DaemonSet
    + 集群级别的自愈，复制和升级管理
    + 一个Node故障，Controller自动将该节点的Pod调度到其他Node上,创建新的UID
- Pod删除 Volume也会被删除
- init container(修改init容器会导致pod重启)
- pod hook(kubelet发起，容器进程启动前或终止前执行,执行前kubelet或锁住容器)
    + 类型：exec，HTTP
    + 执行完成后容器才会改变状态
    + hook失败会导致容器失败
- Pod Preset
    + pod创建时注入特定信息(如环境变量)
    + 不需要改Pod template

## 集群资源
+ 集群在网络防火墙后面
+ Node(k8s集群的工作节点)
    - 物理机或虚拟机
    - ExternalIP 集群外访问
    - InternalIP 集群内访问
+ Namespace
    - 创建虚拟集群
    - 可将生产，测试，开发分为不同Namespace，隔离环境
    - `kubectl get ns`
    - default,kube-system两个默认的Namespace
    - 不是所有资源都有NS,node和persistentVolume没有NS
+ Label 
    - 元数据关联到k8s资源对象上
    - 用于选择对象
    - Label selector 可以选择一个集合
    - 不唯一
+ Annotation
    - 不能用于选择
    - 可结构化或非结构化数据
+ Taint,Toleration
    - 避免pod被分配到不适合的node上
    - node定义多个Taint
    - pod上定义toleration
+ Owner,Dependent
    - metadata.ownerReferences
    - 删除对象的Dependent称为级联删除
    - 例子：ReplicaSet(Owner) pods(Dependent)

## controller(状态机，控制pod的状态和行为)
+ Deployment
+ StatefulSet
+ DaemonSet
    - 确保全部或部分Node上运行一个Pod
    - 新增Node会为它新增一个Pod
    - 例如：在每个Node上运行日志手机daemon(fluentd,logstash)
+ ReplicationController
+ Job
+ CronJob

## 网络
+ Service
    - 使用标签选择器标识一组pod成为的K8s服务
    - 一般只能在集群内通过VIP访问
    - 解耦frontend到backend的访问
    - REST对象
    - Node中的kube-proxy为Service实现了VIPS
    - userspace
    - iptables
    - ipvs
+ Ingress
    - 集群外部访问集群内部的入口
    - ingress controller
## 存储
+ secret
+ ConfigMap
    - 存在etcd
    - ENV是容器启动后注入，启动后就不会改变环境变量的值
    - CnofigMap更新后，要滚动更新pod来枪支重新挂载configmap
+ Volume
    - 容器磁盘的文件生命周期短，容器重启后丢失文件
    - volume可以使多个容器共享文件
    - volume的生命周期和pod一致，比pod中的contianer生命周期长
    - 容器中的进程看到的是由其 Docker 镜像和卷组成的文件系统视图
    - volume之间无法连接
+ Persistent Volume
    - PersistentVolume 管理员设置，PV是集群资源，独立于pod
    - PersistentVolumeClaim PVC对PV的请求

## tips
+ Container(单进程模型)
    - 视图隔离资源受限的进程
    - 容器里PID=1的进程就是应用本身
    - 管理虚拟机=管理基础设施
    - 管理容器=管理应用
    - kubernetes=操作系统
    - 镜像=软件包
    - pod=进程组
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
    - 每个资源都对应一个控制器(可以自定义控制器),控制器使资源的status趋向Spec
    - 命令式API(按步骤执行)
    - 声明式API(按目标)
    - 控制循环
    - sensor
+ Deployment
    - 管理部署发布的控制器
    - 定义一组Pod
    - 批量更新一组Pod
    - 一键回滚
+ Flannel
    - 在node上
    - 为node分配subnet
    - node加入网络时，为node增加路由配置

## keywords
+ manifests
+ cluster
+ Kubernetes API
+ config map

## ref
+ [k8s 官网](https://kubernetes.io/docs/concepts/overview/)
+ [k8s 中文](https://kubernetes.io/zh/docs/tasks/administer-cluster/dns-debugging-resolution/)

+ [Kubernetes Handbook](https://jimmysong.io/kubernetes-handbook/)
+ [Kubernetes 中文文档](http://hardocs.com/d/kubernetes/145-kubectl_config.html)

+ [十分钟带你理解Kubernetes核心概念](http://www.dockone.io/article/932)
+ [K8S从懵圈到熟练](https://yq.aliyun.com/search?q=K8S%E4%BB%8E%E6%87%B5%E5%9C%88%E5%88%B0%E7%86%9F%E7%BB%83&type=ARTICLE)
+ [K8S从懵圈到熟练 – 集群网络详解](https://zhuanlan.zhihu.com/p/67894883)
<!-- detail -->
+ [Windows下的包管理器Chocolatey](https://www.jianshu.com/p/831aa4a280e7)
+ [从零开始入门 K8s | 手把手带你理解 etcd](https://zhuanlan.zhihu.com/p/96721097)
+ [Pod的生命周期](https://jimmysong.io/posts/pod-lifecycle/)

+ [ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
+ [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)

+ [调试 DNS 问题](https://kubernetes.io/zh/docs/tasks/administer-cluster/dns-debugging-resolution/)

+ [日志架构](https://kubernetes.io/zh/docs/concepts/cluster-administration/logging/)