
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
+ `sysctl -a | grep -E --color 'machdep.cpu.features|VMX'`查看macOS是否支持虚化技术
+ `brew install kubectl`
    - `kubectl version --client`
+ 安装Hypervisor
    - install virtualBox
+ `brew install minikube`
    - on fail
        + `brew cask remove minikube`
        + `brew link minikube`
+ `minikube start`
    - `--docker-env HTTP_PROXY=xxxx` need proxy
+ docker desktop（minikube start --vm-driver virtualbox...，否则minikube会装到docker里）
+ `eval $(minikube docker-env)`
+ `brew install kubernetes-helm` 最新版本不用tiller

    
## cmd
+ `minikube start`
    -  `--vm-driver virtualbox`
    - `--docker-env HTTP_PROXY=xxxx`
    - `--docker-env HTTPS_PROXY=xxxx`
    - `--docker-env NO_PROXY=xxxx`
+ `minikube stop`
+ `minikube status`
+ `minikube delete`
+ `minikube dashboard`
+ `minikube service list`
+ `minikube docker-env`
<!-- update -->
+ `minikube kubectl -- get pods` update kubectl version
+ `minikube ip`
+ `minikube ssh`    
    - `exit`

<!-- clean -->
+ `minikube delete`
+ `brew uninstall minikube`

+ `minikube ip`

## minikube start
<!-- registry mirror -->
+ `minikube ssh | docker info` 查看registry-mirror
+ `minikube start --logtostderr --v=3 --image-mirror-country=cn --registry-mirror https://dockerhub.azk8s.cn`
    - 默认装docker里
    - `--vm-driver virtualbox` 使用kubectl时会报错
<!-- proxy -->
+ `minikube start --vm-driver virtualbox --docker-env HTTP_PROXY=xxxx:xx --docker-env HTTPS_PROXY=xxxx:xx --docker-env NO_PROXY=localhost,127.0.0.1`

<!-- check -->
+ `minikube status`
    - `minikube update-context` fix kubeconfig

## push image to Minikube
+ `eval $(minikube docker-env)`
    - 重用 minikube 内置的 Docker 守护进程
    - 检查`MINIKUBE_ACTIVE_DOCKERD`
    - `docker ps` 可以看到minikube内的镜像
    - 用latest以外的标签标记Docker镜像
    - 使用`imagePullPolicy:IfNotPresent` or `imagePullPolicy:Never`
        + 镜像版本为:latest时，拉取策略为Always时，会出现ErrImagePull
    - 关闭窗口后，docker还是使用的本地的docker daemon
+ `eval $(minikube docker-env)`
+ `docker ps`

+ `minikube addons enable registry` minikube的VM暴露5000端口
## docker-env
+ configure environment to use minikube's Docker daemon
+ `minikube docker-env`
+ `eval $(minikube docker-env)` 使用本地docker
    - `eval $(minikube docker-env -u)`


## tips
+ kubectl config
    - c:\users\[account]\.kube\config
+ `--vm-driver`
    + 默认是docker
    + `--vm-driver=none`k8s运行在主机中而不是VM中,需要docker和linux,不需要hypervisor,不用push image
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
+ [--vm-driver <driver>](https://kubernetes.io/docs/setup/learning-environment/minikube/#specifying-the-vm-driver)
+ [Minikube + Helm 搭建本地 k8s 环境(worked)](https://zhuanlan.zhihu.com/p/69274854)
+ [通过 Minikube 在本地运行 Kubernetes](https://k8smeetup.github.io/docs/getting-started-guides/minikube/)
<!-- online -->
+ [play-with-k8s](https://labs.play-with-k8s.com/)
+ [Katacoda：免费学习 Kubernetes 利器](https://developer.aliyun.com/article/752183)
<!-- ali -->
+ [Minikube - Kubernetes本地实验环境](https://yq.aliyun.com/articles/221687)
<!-- 技巧 -->
+ [使用 Minikube 安装 Kubernetes](https://kubernetes.io/zh/docs/setup/learning-environment/minikube/#interacting-with-your-cluster)
+ [Docker on Windows](https://minikube.sigs.k8s.io/docs/handbook/registry/)
+ [Pushing images](https://minikube.sigs.k8s.io/docs/handbook/pushing/)