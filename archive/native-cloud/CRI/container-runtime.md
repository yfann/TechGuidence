
# container runtime

+ run on each node
    + to run pod

+ types
    + containerd
    + CRI-O
    + Docker

+ cgroup
    + systemd
    + kubeadm

## CRI(Container Runtime Interface)

+ Kubelet(grpc client) <-----(CRI protobuf)----> CRI(grpc server)<------------->container runtime------>container

## ref
+ [容器运行时](https://kubernetes.io/zh/docs/setup/production-environment/container-runtimes/)
+ [如何选择Docker运行时、Containerd运行时、或者安全沙箱运行时？](https://help.aliyun.com/document_detail/160313.html?spm=5176.22414175.sslink.1.5e1f38fdLU5tce)


+ [Open Container Initiative (OCI)](https://opencontainers.org/about/overview/)
+ [CRI](https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/)


+ [CNCF Cloud Native Interactive Landscape](https://landscape.cncf.io/card-mode)