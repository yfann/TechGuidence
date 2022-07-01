
# cilium

## eBPF
+ linux VM
    + 可在linux内核中动态执行代码

+ sidecarless model
    + high efficiency
    + low complexity

+ service mesh evolve
    + shared library model -> sidecar model -> kernel model

+ per-node proxy model

## tips

+ cilium
    + k8s CNI
    + support eBPF
    + sidecarless
        + eBPF hook替代sidecar
            + 在linux内核中执行

+ linux namspaces

+ cgroups
    + resource management and prioritization for resources like CPU, memory, and the network.

## ref
+ [How eBPF will solve Service Mesh - Goodbye Sidecars](https://isovalent.com/blog/post/2021-12-08-ebpf-servicemesh)
+ [eBPF, sidecars, and the future of the service mesh](https://buoyant.io/2022/06/07/ebpf-sidecars-and-the-future-of-the-service-mesh/)
+ [cilium](https://github.com/cilium/cilium)