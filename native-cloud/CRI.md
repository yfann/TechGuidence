## tips

+ OCI(Open Container Initiative ) which publishes specifications for containers and their images.
    + runc (OCI-compliant tool)
        + running containers

+ CRI(Container Runtime Interface) which defines an API between Kubernetes and a container runtime underneath
    + containerd
    + CRI-O

+ docker -> containerd -> runc -> container
    + containerd
        + manage and run containers
        + It pushes and pulls images, manages storage and networking, and supervises the running of containers.
    + runc
        +  It includes libcontainer, a native Go-based implementation for creating containers.

+ k8s
    + CRI
        + dockershim(docker doesn't implement CRI)

## ref
+ [The differences between Docker, containerd, CRI-O and runc](https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci/)