## KVM
+  Kernel-based Virtual Machine（KVM)
    + Linux kernel中的一个内核模块
        + kvm.ko
            + 管理CPU和内存大虚化
            + IO的虚化由Qemu管理（用户空间）
    + Linux -> Hypervisor(虚拟机监控器,virtual machine monitor，缩写为 VMM)
    + 使主机可以运行VM

+ Qemu
    + 纯软件实现的模拟

## tips
+ Hypervisor
    + 一种运行在基础物理服务器和操作系统之间的中间软件层，可允许多个操作系统和应用共享硬件
    + VMM( virtual machine monitor )，即虚拟机监视器
    + 虚拟环境中的“元”操作系统

+ Openstack是基于linux的IaaS层的解决方案
    + 云计算的虚化
    + 支持多种虚化KVM,Xen等
    + 需要基于KVM的OS镜像
        + WMware需要ISO文件

<!-- VM vs container -->
+ 传统的虚化技术以OS为中心
    
+ Container以应用为中心的虚化技术
    + 共享Host OS代替VM的Gest OS

## ref
+ [什么是KVM？](https://www.redhat.com/zh/topics/virtualization/what-is-KVM)
+ [Linux云计算底层技术之 KVM 初探](https://zhuanlan.zhihu.com/p/72487608)
+ [虚拟化，看这篇文章就够了](https://www.51cto.com/article/536043.html)