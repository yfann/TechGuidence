## Helm
+ Manage Kubernetes application as a whole to install
+ Tiller(Run inside Kubernetes cluster as a Kubernetes application)
    - 默认Namespace:kube-system
+ Chart
    - Helm包
+ Helm(客户端)
    - 将charts安装到Kubernetes中
    - 每个安装创建一个新的release
    - repositories charts仓库
+ release 
    - k8s中运行的Chart实例
+ repository
    - chart收集和共享的地方


## cmd
+ `<command> -h`
+ `helm version`
+ `helm list`
    - `helm list --all` 显示所有release包括删除的
    - `helm list --all-namespaces`
    - `helm list --namespace <namespace>` 查看release
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
    - `helm show [chart||readme] <repo name>/<chart name>`
    - `helm repo list` 查看配置了哪些repo
    - `helm repo add <name> <repo url>` 
    ```s
    $ helm repo add gkarthiks https://gkarthiks.github.io/helm-charts
    $ helm fetch gkarthiks/prometheus-kafka-exporter
    ```


## charts依赖关系
- requirements.yaml
    + condition
    + tags
    ```sh
    helm install --set tags.front-end=true --set subchart2.enabled=false
    ```
- `helm dependency update` 将依赖chart下载到charts/下
- charts/
- exports
```yml
# parent's requirements.yaml file
...
import-values:
    - data

# child's values.yaml file
...
exports:
    data:
        myint: 99

# parent's values file
...
myint: 99

```
- child-parent
```yml
# parent's requirements.yaml file
dependencies:
- name: subchart1
    repository: http://localhost:10191
    version: 0.1.0
    ...
    import-values:
    - child: default.data
        parent: myimports

# parent's values.yaml file
myimports:
    myint: 0
    mybool: false
    mystring: "helm rocks!"

# subchart1's values.yaml file
default:
    data:
        myint: 999
        mybool: true

# parent's final values
myimports:
    myint: 999
    mybool: true
    mystring: "helm rocks!"
```
## 模板
+ values.yaml或--set 提供的值通过`.Values`访问

## values
+ 用户提供的包含值的yaml文件`helm install -f xx.yaml`会覆盖values.yaml 文件中的值
+ `--values` 与chart中的values.yaml合并
```sh
helm install --values=myvals.yaml wordpress
```
+ `-f` 指定yaml
+ `--set` 命令行传值,设置null删除值
    - `--set a=b,c=d,outer.inner=value --set ss=null`
+ `--set-string`
    - `--set-string foo=true`  "true"是string
+ `--set-file`   文件内容作为值
    - `--set-file xxx=<filepath>`
+ values.yaml可以为依赖chart提供值,子chart不能访问父chart的value
```yaml
title: "My WordPress Site" # Sent to the WordPress template

mysql:
  max_connections: 100 # Sent to MySQL
  password: "secret"

apache:
  port: 8080 # Passed to Apache
```

## hook
+ 让 chart 开发人员有机会在 release 的生命周期中的关键点执行操作
+ pre-install,post-install
+ hook 准备就绪，Tiller将往下执行
    - Job类型资源，会等job执行完成
    - 其他类型资源，kubernetes将资源标记为加载,则就绪
+ hook创建的资源不作为release的一部分
    - 不能用helm delete删除这部分资源
    - pre-delete,post-delte中手动删除
    - helm.sh/hook-delete-policy

## tips
+ `{{- `删除左空格，将空白左移
    - 否则会产生空行
+ `$.`全局变量
    - `$.Release.Name`
+ `templates/`里的文件为K8s manifests
    - `_`开头的文件除外，这些文件不会渲染k8s对象定义，这些文件存储`partials`和辅助程序
        + `_helpers.tpl`
+ 命名模板
    - 模板名称全局，父子都能用
    - `{{- template "mychart.labels" . }}` 调用时传入作用域
    - `{{ include "mychart.app" . | indent 2 }}` 缩进插入的内容- 
    - `{{include $mytemplate}}`可动态引用模板

+ chart要小于1M
+ `.Files`
    - `Files.Glob(pattern string)`
    - `templaates/`无法访问文件
```sh
  {{- $files := .Files}}
  {{- range tuple "config1.toml" "config2.toml" "config3.toml"}}
  {{.}}: |-
    {{$files.Get .}}
  {{- end}}
```
+ global value,所有chart都能访问
```sh
global:
  app: MyWordPress

## .Values.global.app  访问方式
```
+ `.helmignore`
+ `<chart name>/<./chart directory>`
## ref
+ [Helm docs](https://helm.sh/docs/helm/helm_show_values/)
+ [Helm 用户指南](https://whmzsu.github.io/helm-doc-zh-cn/)
+ [Helm 入门指南](https://www.hi-linux.com/posts/21466.html)
+ [空白处理](https://www.qikqiak.com/k8s-book/docs/46.Helm%E6%A8%A1%E6%9D%BF%E4%B9%8B%E6%8E%A7%E5%88%B6%E6%B5%81%E7%A8%8B.html)
<!-- detail -->
+ [使用Helm管理kubernetes原生应用](https://jimmysong.io/posts/manage-kubernetes-native-app-with-helm/)
<!-- repo -->
+ [Helm Hub](https://hub.helm.sh/charts)
+ [stable repo](https://github.com/helm/charts/tree/master/stable)