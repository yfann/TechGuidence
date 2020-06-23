
## cmd
+ `get`
    - `kubectl get pods`
    - `kubectl get nodes`
    - `kubectl get deployments`
    - `kubectl get rs` check replicaset status
    - `kubectl get svc`
    - `kubectl get namespace`
    - `kubectl describe [pod||node] <pod name>`
        + `kubectl describe pod <pod name> > xxx.yaml` 明细输出到yaml,可以用来排查问题
+ `create`
    - `kubectl create -f <name>.yaml`
    - `kubectl create namespace <name>`
+ `kubectl expose deployment <dep name> --external-ip="xxx.xx" --port=8000 --target-port=80`
+ `kubectl port-forward <source name> <from port>:<to port>`
+ `kubectl [-f] logs <name>` -f 流式输出
+ `kubectl exc -it <pod name> sh`
+ `kubectl run <deployment name> <--images=...> --replicas=1`


### parameters
+ `--namespace <namespace>` `-n <namespace>`
+ `|grep <exp>` 匹配

## issues
+ CrashLoopBackOff
## ref
+ [Kubernetes kubectl 命令表](http://docs.kubernetes.org.cn/683.html)
+ [kubectl](https://kubernetes.io/zh/docs/reference/kubectl/)
+ [kubectl docs](https://kubectl.docs.kubernetes.io/pages/container_debugging/port_forward_to_pods.html)
+ [通过describe命令学习Kubernetes的pod属性详解](https://developer.aliyun.com/article/672167?spm=a2c6h.14164896.0.0.46eb6d11HeMlD1)