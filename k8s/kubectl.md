
## 概念

+ 命令式命令
+ 命令式对象配置
    - `kubectl create -f <filename|url>`
+ 声明式对象配置

## cmd
+ `kubectl version`
    -  `--short=true`
+ `get`
    - `kubectl get pods`
    - `kubectl get nodes`
    - `kubectl get deployments`
    - `kubectl get rs` check replicaset status
    - `kubectl get svc -n <namespace>`
    - `kubectl get namespace`
    - `kubectl describe [pod||node] <pod name>`
        + `kubectl describe pod <pod name> > xxx.yaml` 明细输出到yaml,可以用来排查问题
        + `kubectl describe svc <service name> -n <namespace>`
+ `create`
    - `kubectl create -f <name>.yaml`
    - `kubectl create namespace <name>`
+ `kubectl expose deployment <dep name> --external-ip="xxx.xx" --port=8000 --target-port=80`
+ `kubectl port-forward <source name> <from port>:<to port>`
+ `kubectl [-f] logs <name>` -f 流式输出
+ `kubectl exc -it <pod name> sh`
+ `kubectl run <deployment name> <--images=...> --replicas=1`
+ `kubectl create -f myapp.yaml`
    - `kubectl get -f myapp.yaml`
    - `kubectl describe -f myapp.yaml`

## apiservice
+ `kubectl get apiservice`
+ `kubectl api-versions`
+ `kubectl explain <k8s obj>`
    - `kubectl explain pods`  
        + `kubectl explain pods.spec`  

## configMap
+ `kubectl create configmap <map-name> <data-source>` 
    - `kubectl create configmap game-config --from-file=<directory>`   `--from-file`可多次使用
+ `kubectl describe configmaps <map-name> [-o yaml]` 查看map

## operate k8s obj
+ `kubectl create -f <file>.yaml`
+ `kubectl get <types>`
+ `kubectl get <type> <obj> [-o yaml]`
+ `kubectl describe <type> <obj>`
+ `kubectl delete <type> <obj>`
<!-- instance -->
+ `kubectl get rc`
+ `kubectl delete all --all`first all means all types,--all means all instances

## Imperative object configuration
- `kubectl create -f <file>`
- `kubectl replace -f <filename|url>` 
    + update
    + config中未配置的资源,更新时会被删除
    + `kubectl apply`更新不会丢失更改
- `kubectl delete -f <filename|url>`
- `kubectl get -f <filename|url> -o yaml`
- `kubectl get -h` help
- imperative commands
    - `kubectl get <kind>/<name> -o yaml > <kind>_<name>.yaml`
    - remove status field
    - `kubectl replace -f <kind>_<name>.yaml`


## Declarative object configuration
+ live object configuration
    - configuration osbserved by the k8s cluster
    - configuration stored in cluster storage like etch
+ `kubectl apply -f <directory>/ [-R]`
    - create/update
    - manage live object configuration
    - config写入 annotation kubectl.kubernetes.io/last-applied-configuration用作计算
    - 不支持和`kubectl craete` `kubectl replace`混用
+ `kubectl diff -f https://k8s.io/examples/application/simple_deployment.yaml`
    - server-side dry-run
+ `kubectl delete -f <filename>`



## labels
+ `kubectl get po --show-labels`
+ `kubectl get po -L <label-name>,<label-name>`
+ `kubectl label po <pod-name> <label-name>=<label-value>`
    - `kubectl label po <pod-name> <label-name>=<label-value> --overwrite` update exsiting label
+ `kubectl get po -l <label-name>=<label-value>,<label-name>=<label-value>`
    - `-l <label-name>`
    - `-l '!<label-name>'` select those don't have the label name,单引号在bash中转义！
+ `kubectl delete po -l <label-name>=<label-value>`

## logs
+ `kubectl logs <pod-name> [-f xxx]` pod logs(contianer log)
    - `kubectl logs <pod-name> -c <contianer-name>`

## k8s monitoring
+ `kubectl top node <node name>`显示cpu和memory的metrics

## parameters
+ `--namespace <namespace>` 
    - `-n <namespace>`
+ `-l xx=xxx` label
+ `|grep <exp>` 匹配
+ `--output=yaml` 导出yaml
+ `--output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode` json中的base64解码
+ `kubectl get pods -o wide` 显示ip,node信息

## pod
+ `kubectl get po <pod-name> -o yaml`
+ `kubectl delete po <pod-name> <pod-name>`
+ `kubectl delete po --all`

## node
+ `kubectl get nodes`
+ `kubectl label nodes <node-name> <label-key>=<label-value>` add label
+ `kubectl describe node <node-name>`
    - `kubectl get nodes --show-labels`

## namespace
+ `kubectl get ns`
+ `kubectl get po -n <namespace>`
+ `kubectl create namespace custom-namespace`
+ `kubectl delete ns custom-namespace` also delete the resource under that namespace

## net
+ `kubectl port-forward <pod-name> <local-port>:<pod-port>`
    - `curl localhost:<local-port>`

## dashboard
+ `kubectl proxy`

## exe
+ `kubectl exec mypod -it sh`

## resource
+ `kubectl api-resources --namespaced=false`查看不在命名空间中的资源

## ref
+ [kubectlbook](https://kubectl.docs.kubernetes.io/)
+ [kubectl 命令式](https://kubernetes.io/zh/docs/tasks/manage-kubernetes-objects/imperative-config/)
+ [kubectl 声明式](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/)
+ [Kubernetes kubectl 命令表](http://docs.kubernetes.org.cn/683.html)
+ [kubectl](https://kubernetes.io/zh/docs/reference/kubectl/)
+ [kubectl docs](https://kubectl.docs.kubernetes.io/pages/container_debugging/port_forward_to_pods.html)
+ [通过describe命令学习Kubernetes的pod属性详解](https://developer.aliyun.com/article/672167?spm=a2c6h.14164896.0.0.46eb6d11HeMlD1)
+ [kubectl-commands](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
+ [Kubernetes Object Management](https://kubernetes.io/docs/concepts/overview/working-with-objects/object-management/)