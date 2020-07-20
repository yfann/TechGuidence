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


## pod
+ container
    - one process per container
        + 如果一个容器跑多个进程，需要写程序管理或重启crash的进程

## tips

+ contianer share the linux kernel(VM doesn't)
+ service
    - to solve the problem of ever-changing pod IP addresses, as well as exposing multiple pods at a single constant IP and port pair
    - static ip