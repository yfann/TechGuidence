## tips

+ OCI(Open Container Initiative ) which publishes specifications for containers and their images.
    + image格式规范
    
+ runc (OCI-compliant tool)
    + 创建运行 containers

+ CRI(Container Runtime Interface) which defines an API between Kubernetes and a container runtime underneath


+ docker -> containerd -> runc -> container
    + containerd
        + manage and run containers
        + It pushes and pulls images, manages storage and networking, and supervises the running of containers.
    + runc
        +  It includes libcontainer, a native Go-based implementation for creating containers.

+ k8s
    + CRI
        + containerd
        + CRI-O
    + dockershim(docker doesn't implement CRI)

+ shim(垫片)    
    +  一个 shim 的职责就是作为适配器将各种容器运行时本身的接口适配到 Kubernetes 的 CRI 接口上
        + dockershim

+ docker 1.11
    + docker Daemon -> Containerd -> containerd-shim -> RunC
        + containerd-shim 
            + 没运行一个容器的父进程，防止containerd挂掉后所有容器都得退出
            + 收集容器进程的状态上报给containerd



## tips
+ CRI client -> kubelet
    + 准入校验
    + CSI挂载
    + 拉取pod
        + grpc client -> grpc server(Containerd)
+ CRI Server -> Containerd
    + 拉取镜像
    + create sandbox
    + create netns
    + 发出调用命令->runc
+ OCI Runtime -> runc

## ref
+ [The differences between Docker, containerd, CRI-O and runc](https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci/)

+ [一文搞懂容器运行时 Containerd](https://www.qikqiak.com/post/containerd-usage/)

+ [技术干货｜Docker和 Containerd 的区别，看这一篇就够了](https://zhuanlan.zhihu.com/p/494054143)