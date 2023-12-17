
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


<!-- cilium -->
+ [cilium](https://github.com/cilium/cilium)
+ [cilium doc](https://docs.cilium.io/en/v1.11/)