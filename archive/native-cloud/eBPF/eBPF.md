# eBPF

+ 扩展的伯克利数据包过滤器（Extended Berkeley Packet Filter

+ eBPF 是一个框架，允许用户在操作系统的内核内加载和运行自定义程序

+ 当 eBPF 程序被加载到内核中时，有一个验证器确保它是安全运行的，如果无法确认，则拒绝它。

+ 一旦加载，eBPF 程序需要被附加到一个事件上，这样，每当事件发生时，程序就会被触发。

+ eBPF验证器

+ 应用
    + 网络
        + 负载均衡
            + Katran(L4)
            + Cilium
        + k8s network
            + Cilium
            + Calico
        + network
            + 取代sidecar
    + 可观测性
        + eBPF可以在内核观察application，而不必修改application（无侵入）
        + Pixie
            + 自定义脚本
        + Parca
            + CPU
        + Hubble 
            + 网络
            + Cilium,可以诊断网络
    + 安全
        + 网络安全
            + DDos保护
            + 相当于防火墙
        + 运行时安全
            + Falco 
            + Tracee 
            + Tetragon（Cilium）
                + 容器安全可观测性的四个黄金信号：进程执行、网络套接字、文件访问和七层网络身份


## cmd
+ `strace -c cat liz.txt`
    + 列出所有系统调用

## tips

+ BPF/eBPF

+ 内核是应用和硬件之间的软件层

+ 应用在用户空间(非特权层)-->syscall--->内核(特权层)-->硬件

+ 添加内核功能
    + 直接修改内核
    + 编写内核模块
    + eBPF

+ eBPF程序一般C，Rust编写，一个ELF文件

+ ELF(可执行和可链接格式，Executable and Linkable Format)

+ k8s
    + sidecar模式每个pod一个代理
    + eBPF模式每个node一个代理(每个node都有一个内核)

## ref

+ [深入浅出eBPF｜你要了解的7个核心问题](https://zhuanlan.zhihu.com/p/526476483)
<!-- eBPF -->
+ [什么是 eBPF？](https://lib.jimmysong.io/what-is-ebpf/)
+ [How eBPF will solve Service Mesh - Goodbye Sidecars](https://isovalent.com/blog/post/2021-12-08-ebpf-servicemesh)
+ [eBPF, sidecars, and the future of the service mesh](https://buoyant.io/2022/06/07/ebpf-sidecars-and-the-future-of-the-service-mesh/)
+ [请暂时抛弃使用 EBPF 取代服务网格和 Sidecar 模式的幻想](https://jimmysong.io/blog/ebpf-sidecar-and-service-mesh/)
+ [eBPF Cilium实战(1) – 基于团队的网络隔离](https://www.kubernetes.org.cn/9884.html)
+ [超细节！十年码农讲述Linux网络新技术基石——eBPF and XDP](https://zhuanlan.zhihu.com/p/543113095)

+ [一文详解用eBPF观测HTTP](https://zhuanlan.zhihu.com/p/551257831)

<!-- observation -->
+ [pixie](https://px.dev/)