## contianeri;s isolation
+ Linux Namespace(isolate resources,make sure each process sees its own personal view of the system)
    - namespace type
        - Mount(mnt)
        - Process ID(pid)
        - Network(net)
        - Inter-process communication(ipc)
        - UTS(hostname domain name)
        - User ID(user)
    - process belongs to one namespace of each kind    
+ Linux Control Groups(cgroups)(limit the amount of resources the process can consume)
    - A process can’t use more than the configured amount of CPU, memory, network bandwidth, and so on

## container
+ one process per container
    - 如果一个容器跑多个进程，需要写程序管理或重启crash的进程
    - 多个进程日志不好查看

## pod
+ bind containers together and mange them as a single unit
+ In a pod,share Linux namespaces in a pod
    - Network and UTS namespaces
        + same IP,port
    - IPC namespace
        + process communicate
    - PID namespace(posible,`ps aux`)
+ In a pod,Volume(shere file directories)  
+ pods are in a flat,shared network-address space
    - then can access each other,no matter worker nodes
    - an additional software-defined network layered
    - don't need NAT(Network Address Translation)
    - like they are in a local area network(LAN)
+ like a VM
+ splitting multi-tier apps into multiple pods
+ one pod one container
    - pod is the basic unit of scaling
+ one pod multiple containers
    - sidecar
## tips

+ contianer share the linux kernel(VM doesn't)
+ service
    - to solve the problem of ever-changing pod IP addresses, as well as exposing multiple pods at a single constant IP and port pair
    - static ip