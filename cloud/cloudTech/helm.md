## Helm
+ Manage Kubernetes application as a whole to install
+ Tiller(Run inside Kubernetes cluster as a Kubernetes application)
+ Chart
    - Helm包
+ Helm
    - 将charts安装到Kubernetes中
    - 每个安装创建一个新的release
    - repositories charts仓库

## cmd
+ `<command> --help`
+ `helm search <chart name>` 查询可用的charts
+ `helm install <chart name>/<./directory> --name [release name]` 安装一个软件包，产生一个release
+ `helm status <chart name>`查看release状态
+ `helm inspect values <char name>` 修改chart配置
+ `helm delete <release name>` 从集群中删除release
+ `helm ls` 查看release
+ `helm repo list` 查看配置了哪些repo
```bash
$ helm repo add gkarthiks https://gkarthiks.github.io/helm-charts
$ helm fetch gkarthiks/prometheus-kafka-exporter
```


## ref
+ [Helm docs](https://helm.sh/docs/helm/helm_show_values/)
+ [Helm 用户指南](https://whmzsu.github.io/helm-doc-zh-cn/)
+ [Helm Hub](https://hub.helm.sh/charts)
+ [Helm 入门指南](https://www.hi-linux.com/posts/21466.html)
+ [使用Helm管理kubernetes原生应用](https://jimmysong.io/posts/manage-kubernetes-native-app-with-helm/)