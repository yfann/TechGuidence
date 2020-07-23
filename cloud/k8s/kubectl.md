
## cmd
+ `kubectl version --short=true`
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

## configMap
+ `kubectl create configmap <map-name> <data-source>` 
    - `kubectl create configmap game-config --from-file=<directory>`   `--from-file`可多次使用
+ `kubectl describe configmaps <map-name> [-o yaml]` 查看map

## k8s obj
+ `kubectl create <obj>`
+ `kubectl get <obj>`
+ `kubectl describe <obj>`
+ `kubectl delete <obj>`
<!-- instance -->
+ `kubectl get rc`

## logs
+ `kubectl logs -f xxx `

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

## node
+ `kubectl get nodes`
+ `kubectl label nodes <node-name> <label-key>=<label-value>` add label
+ `kubectl describe node <node-name>`
    - `kubectl get nodes --show-labels`

## issues
+ CrashLoopBackOff

## ref
+ [Kubernetes kubectl 命令表](http://docs.kubernetes.org.cn/683.html)
+ [kubectl](https://kubernetes.io/zh/docs/reference/kubectl/)
+ [kubectl docs](https://kubectl.docs.kubernetes.io/pages/container_debugging/port_forward_to_pods.html)
+ [通过describe命令学习Kubernetes的pod属性详解](https://developer.aliyun.com/article/672167?spm=a2c6h.14164896.0.0.46eb6d11HeMlD1)
+ [kubectl-commands](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)