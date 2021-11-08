## k8s networking

+ container runtime 为每个pod创建 virtual network interface

## tips

+ 外网---->node(network interface)-->bridge---->pod(virtual network inteface)

+ kubelet,kube-proxy
    + 使用iptables

+ 