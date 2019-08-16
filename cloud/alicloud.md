## 云原生
### 两个基础理论
+ 不可变基础设施(容器镜像)
    - 基础设置一致性和可靠性
    - 简单可预测的部署和运维（自描述，自运行）
+ 运应用编排理论(容器设计模式)
## 容器
+ 容器：视图隔离，资源可限制，独立文件系统的进程集合(镜像的实例)
    - docker run(init容器)
    - 数据卷（docker volume）：容器产生的数据持久化到特定的目录，生命周期独立于容器
+ 容器镜像：运行容器的所有文件集合（模板）
+ Dockerfile: 描述镜像构建步骤（分层，复用）
+ changeset: 构建步骤产生的文件系统的变化(节约资源，提高分发效率)
+ moby

## Kubernetes(k8s)
+ 工业级的容器编排平台
+ 服务发现与负载均衡
+ 容器自动装箱
+ 存储编排
+ 自动容器恢复
+ Pod
    - 最小调度资源
    - 包含一个或多个容器
    - 定义容器运行变量
    - 容器间共享环境
+ Service
    - 提供访问一个或多个Pod实例的稳定访问地址
    - ClusterIP
    - NodePort
    - LoadBalance
+ Namespace(BU间的隔离)


## keyword

+ cloud native computing foundation (cncf)
+ Kubernetes
+ containerd
+ etcd
+ Envoy
+ SSH连到服务器
+ golang
+ alpine
+ etcd
<!-- 隔离进程 -->
+ namespace
+ cgroup
+ chroot

## ref
+ [阿里云](https://edu.aliyun.com/roadmap/cloudnative)
+ [Ingress](https://www.jianshu.com/p/189fab1845c5)