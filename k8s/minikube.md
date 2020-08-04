
## install miniKube
+ windows
    + Hypervisor 
        -`systeminfo`查看是否有hypervisor
        - 没有则安装virtualBox(为了安装hypervisor)
    + kubectl
        - `choco install kubernetes-cli`
        - `kubectl version --client`
    + MiniKube
        - `choco install minikube`
    + `kubectl cluster-info dump` check the kubectl connection(setting proxy and no_proxy)
        - `~/.kube/config`
## mac instll
+ `brew install kubectl`
    - `kubectl version --client`
+ install virtualBox
+ `brew install minikube`
    - on fail
        + `brew cask remove minikube`
        + `brew link minikube`
    - `minikube start`
+ `brew install docker`
+ `eval $(minikube docker-env)` 使用本地docker
+ helm
    - `brew install kubernetes-helm`
    
## cmd
+ `minikube start`
    -  `--vm-driver virtualbox`
+ `minikube stop`
+ `minikube status`
+ `minikube delete`
+ `minikube dashboard`
<!-- update -->
+ `minikube kubectl -- get pods` update kubectl version
+ `minikube ip`
+ `minikube ssh`    
    - `exit`
## push image to minikube
+ `minikube addons enable registry` minikube的VM暴露5000端口


## tips
+ kubectl config
    - c:\users\[account]\.kube\config
+ `--vm-driver=none`k8s运行在主机中而不是VM中,需要docker和linux,不需要hypervisor
+ `set no_proxy=localhost,127.0.0.1,192.168.99.0/24,192.168.39.0/24,10.96.0.0/12,172.30.103.201`
+ windows
    - `c:/Users` is mapped into vm as `/c/Users`
## ref
<!-- cmd -->
+ [minikube commands](https://minikube.sigs.k8s.io/docs/commands/ssh/)
<!-- install -->
+ [install-kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
+ [Install Minikube](https://kubernetes.io/zh/docs/tasks/tools/install-minikube/)
+ [Proxies and VPNs](https://minikube.sigs.k8s.io/docs/handbook/vpn_and_proxy/)
+ [Minikube + Helm 搭建本地 k8s 环境](https://zhuanlan.zhihu.com/p/69274854)
<!-- online -->
+ [play-with-k8s](https://labs.play-with-k8s.com/)
+ [Katacoda：免费学习 Kubernetes 利器](https://developer.aliyun.com/article/752183)
<!-- ali -->
+ [Minikube - Kubernetes本地实验环境](https://yq.aliyun.com/articles/221687)
<!-- 技巧 -->
+ [使用 Minikube 安装 Kubernetes](https://kubernetes.io/zh/docs/setup/learning-environment/minikube/#interacting-with-your-cluster)
+ [Docker on Windows](https://minikube.sigs.k8s.io/docs/handbook/registry/)