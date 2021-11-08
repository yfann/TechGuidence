
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