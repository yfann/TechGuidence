## Helm
+ Manage Kubernetes application as a whole to install
+ Tiller(Run inside Kubernetes cluster as a Kubernetes application)
+ Chart
    - Helm包
+ Helm(客户端)
    - 将charts安装到Kubernetes中
    - 每个安装创建一个新的release
    - repositories charts仓库
+ release 
    - k8s中运行的Chart实例
## cmd
+ `<command> --help`
+ `repo`
    - `helm search <repo name> <chart name>` 查询可用的charts
    - `helm show [chart||readme] <repo name>/<chart name>`
    - `helm repo list` 查看配置了哪些repo
    - `helm repo add <name> <repo url>` 
    ```bash
    $ helm repo add gkarthiks https://gkarthiks.github.io/helm-charts
    $ helm fetch gkarthiks/prometheus-kafka-exporter
    ```
+ `helm list --all-namespaces`
+ `helm ls -n <namespace>` 查看release
+ `helm install <name> [<chart name>/<./chart directory>] --namespace [release name]` 安装一个软件包，产生一个release
+ `helm delete <release name> -n <namespace>` 从集群中删除release
+ `helm status <chart name>`查看release状态
+ `helm inspect`
    - `helm inspect <chart name>`
    - `helm inspect values <char name>` 修改chart配置

+ `helm env` ~/.kube/config
+ `helm create <chart name>`
    - `tree <chart name>`


## ref
+ [Helm docs](https://helm.sh/docs/helm/helm_show_values/)
+ [Helm 用户指南](https://whmzsu.github.io/helm-doc-zh-cn/)
+ [Helm Hub](https://hub.helm.sh/charts)
+ [Helm 入门指南](https://www.hi-linux.com/posts/21466.html)
+ [使用Helm管理kubernetes原生应用](https://jimmysong.io/posts/manage-kubernetes-native-app-with-helm/)