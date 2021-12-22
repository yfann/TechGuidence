
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
+ [Open Container Initiative (OCI)](https://opencontainers.org/about/overview/)
+ [CRI](https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/)


+ [CNCF Cloud Native Interactive Landscape](https://landscape.cncf.io/card-mode)