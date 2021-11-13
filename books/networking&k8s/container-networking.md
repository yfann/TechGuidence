
# Container Networking

+ Hypervisor

## container networking modes

+ none

+ bridge
    + 通过NAT访问外部service

+ Host
    + container shares the same IP, the same network ns
    + container中的process和host中的Process，network一样
    + container需要访问host的network resourcs,可以用这种模式
    + 只能在Linus host上

+ Macvlan
    + allows a physical interface to have multiple MAC and IP addresses using Macvlan subinterfaces

+ IPvlan
    + multiple IP, same MAC


## tips
+ container
    + cgroup
    + namespace

+ OCI(Open Container Initiative)
    + a set of specifications that container runtime engines must implement

+ CRI-O
    + an OCI-based implementation of the k8s CRI

+ LXC
    + linux container
    + cgroup & namespace

+ cgroup
    + limit resource usage
        + cpu,memory,I/O,network

+ Namespaces
    + isolate processes
        + PID,Netork,IPC,Mount
    + The process has root privileges for execution inside the user namespace but is unprivileged for operations outside the namespace.
    + `sudo ps -p 1 -o pid,pidns`

## Docker Networking Model

+ Libnetwork 
    + container networking model(CNM)
     + sandbox
        + implements the management of the linux network namespaces for all containers running on the host
     + endpoint
        + are hosts on the network
        + use iptables for network isolation
     + network
        + collection of endpoints


+ bridge(连接同host内的containers)
    + 分配private IP
    + 暴露port给外界访问，需要映射到host的port避免冲突
    + Docker启动时会创建virtual bridge interface(docker0)
        + 分配private IP
        + 关联containers

+ networking mode
    + Bridge(local driver)
        + for containers running on the same host
    + Custom or Remote
    + Overlay(global drivers)
        + for containers running on different hosts
        + rely on libkv(key-value store),CNM doesn't have
            + Consul
            + etcd
            + Zookeeper are needed
    + Null

+ Overlay Networking
    + 运行在不同nodes上的container间的通信
    + VXLAN
        + layer2

## Container network Interface(CNI)
+ define a standard interface to manage a container's network

+ manage pod IP, individual container network provisioning

+ is the software interface between the container runtime and the network implementation
    + specification
    + libraries

+ CNI plugin
    + Cilium
        + securing network connectivity between application containers
    + Flannel
        + configure a L3 network
        + store in etcd
    + Calico
        + uses the BGP routing protocol to route packets between hosts
        + can integrate with Istio

+ AWS

## container connectivity

+ Each container can reach the other over the docker0 bridge and the container ports because they are on the same Docker host and the same network
+ CNI network models
    + flat networks
        + require many IP
    + overlay networks
        + create a virtual network within the cluster
            + IPAM
        + host不能直接连pod
        + 只有node需要IP
