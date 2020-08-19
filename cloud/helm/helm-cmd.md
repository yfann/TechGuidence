
## cmd
+ `<command> -h`
+ `helm version`
+ `helm list`
    - `helm list --all` 显示所有release包括删除的
    - `helm list --all-namespaces`
    - `helm list --namespace <namespace>` 查看release
+ `helm get manifest <release-name>`
+ `heml install`
    -  `helm install --name <release name> [<chart name>/<./chart directory>] --namespace [release name]` 安装一个软件包，产生一个release
    -  `helm install -f xx.yaml <chart name>`
    -  `helm install --debug --dry-run <chart name>` debug
 + `helm upgrade [RELEASE] [CHART] [flags]`
    - e.g.`helm upgrade -f myvalues.yaml -f override.yaml redis ./redis`


+ `helm delete <release name> -n <namespace> --purge` 从集群中删除release,--purge删干净
+ `helm status <release name>`查看release状态（在集群内）

+ `helm inspect`
    - `helm inspect <chart name>`
    - `helm inspect values <char name>` 修改chart配置
+ `helm create <chart name> --starter`
    - `tree <chart name>`
    - `helm package <chart name>`
    - `helm lint <chart name>`
+ `helm get` 查看集群中的release
    - `helm get values <release name>`查看release中的值
    - `helm get manifest <release name>` 查看服务器上安装的模板

+ `helm fetch`将依赖放入charts/ 

+ `repo`
    - `helm search`
    - `helm search <repo name> <chart name>` 查询可用的charts
        + add以后才能search
    - `helm show [chart||readme] <repo name>/<chart name>`
    - `helm repo list` 查看配置了哪些repo
    - `helm repo add <name> <repo url>` 
    ```s
    $ helm repo add gkarthiks https://gkarthiks.github.io/helm-charts
    $ helm fetch gkarthiks/prometheus-kafka-exporter
    ```
<!-- download -->
+ `helm pull <chart name>`