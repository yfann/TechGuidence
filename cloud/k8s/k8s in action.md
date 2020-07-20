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

## tips

+ contianer share the linux kernel(VM doesn't)