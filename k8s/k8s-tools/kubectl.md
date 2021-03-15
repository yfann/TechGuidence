
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

+ `kubectl expose deployment <dep name> --external-ip="xxx.xx" --port=8000 --target-port=80`
+ `kubectl port-forward <source name> <from port>:<to port>`
+ `kubectl [-f] logs <name>` -f 流式输出
+ `kubectl exc -it <pod name> sh`
+ `kubectl run <deployment name> <--images=...> --replicas=1`

+ `kubectl create -f myapp.yaml` 文件或文件夹
    - `kubectl get -f myapp.yaml`
    - `kubectl describe -f myapp.yaml`


## configMap
+ `kubectl create configmap <map-name> <data-source>` 
    - `kubectl create configmap game-config --from-file=<directory>`   
        - `--from-file`可多次使用
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
+ `kubectl get ... --show-labels`

+ `kubectl get po -L <label-name>,<label-name>`
+ `kubectl label po <pod-name> <label-name>=<label-value>`
    - `kubectl label po <pod-name> <label-name>=<label-value> --overwrite` update exsiting label
+ `kubectl get po -l <label-name>=<label-value>,<label-name>=<label-value>`
    - `-l <label-name>`
    - `-l '!<label-name>'` select those don't have the label name,单引号在bash中转义！
+ `kubectl delete po -l <label-name>=<label-value>`

+ `kubectl label pod <pod-name> app=foo [--overwrite]`
+ `kubectl label pod <pod-name> <label>-`


## logs
+ `kubectl logs <pod-name> [-f xxx]` pod logs(contianer log)
    - `kubectl logs <pod-name> -c <contianer-name>`
+ `kubectl exec <pod> cat <logfile>`
+ `kubectl logs <pod name> --previous`
+ `kubectl logs <pod name> > ~/log` 输出到文件
+ tips
    + `--tail=20`
    + `--since=1h`最近一小时
    + `-f` 持续输出
    + `-p` 停止的容器

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

## crd
+ `kubectl get crd`
+ `kubectl get <crd-name> -n <namespace>`

## node
+ `kubectl get nodes`
+ `kubectl label nodes <node-name> <label-key>=<label-value>` add label
+ `kubectl describe node <node-name>`
    - `kubectl get nodes --show-labels`

## namespace
+ `kubectl get ns`
+ `kubectl create ns <namespace>`
+ `kubectl delete ns <namespace>` also delete the resource under that namespace
+ `kubectl get all -n <namespace>`
+ `kubectl get po -n <namespace>`
+ `kubectl config set-context --current --namespace=<namespace>`


## net
+ `kubectl port-forward <pod-name> <local-port>:<pod-port>`
    - `curl localhost:<local-port>`

## exec 

+ `kubectl exec -it shell-demo -- /bin/bash` 
        - ` -- ` 后面的命令在目标pod中执行
        - `--container [container name]`如果pod有多个容器`--c [container name]`
            - `kubectl describe pod/[pod name]` 查看容器数
+ `kubectl exec <pod name> -n namespace -- printenv`
+ `kubectl exec <pod name> -n namespace -- sh`
+ `kubectl cp <pod>:/var/log/foo.log foo.log` copy container文件
    + `kubectl cp localfile foo-pod:/etc/remotefile` copy文件到container

## API & resources
+ `kubectl api-versions`
+ `kubectl api-resources`
    + `kubectl api-resources -o wide`
    + `kubectl api-resources --namespaced=false`查看不在命名空间中的资源
+ `kubectl cluster-info`
+ `kubectl proxy  [--port=8080]`  用代理访问kubernetes API
    + `curl http://localhost:8080/api/`
+ `kubectl get apiservice`
+ `kubectl explain <k8s obj>`
    - `kubectl explain pods`  
        + `kubectl explain pods.spec` 
    
## context
<!-- ~/.kube/config -->
+ `kubectl config view`
+ `kubectl config use-context <context>`
    + `kubectl config --kubeconfig=<config name> use-context <context>`
+ `kubectl config set-context --current --namespace=<namespace>` 
    + switch namespace
+ `kubectl config set-context gce-dev --user=cluster-admin --namespace=dev`
    + set context

+ `kubectl config set-context default --namespace=${work_namespace}`设置默认上下文的默认命名空间
+ `kubectl config set-context ${work_context} --cluster=default --user=default --namespace=${work_namespace}`新建上下文
+ `kubectl config use-context ${work_context}`设置为默认上下文

## serviceaccounts
+ `kubectl get serviceaccounts -n <namespace>`
+ `kubectl get rolebindings`
+ `kubectl get roles`


## servicves
+ `kubectl get svc`
+ `kubectl get endpoints <service-name>`
+ `kubectl describe svc <service-name>`
+ `kubectl get ingresses`

## pv&pvc
+ `kubectl get pv`
+ `kubectl get pvc`
+ `kubectl delete pvc mongodb-pvc`
+ `kubectl get sc` storage class

## configmap
+ `kubectl create configmap <config-name> --from-literal=<key>=<val> --from-literal=<key>=<val>`
+ `kubectl create configmap my-config --from-file=mykey=config-file.conf`
+ `kubectl create configmap my-config --from-file=/path/to/dir`
+ `kubectl edit configmap <name>`
+ `kubectl get configmap fortune-config -o yaml`
+ `kubectl create -f fortune-config.yaml`

## secret
+ `kubectl get secrets`
+ `kubectl describe secrets`
+ `kubectl create secret generic <name> --from-file=<file name>`
+ `kubectl get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode`
    + `kubectl get secrets/vcap-services -n crd --template={{.data.SomeKey}}|base64 -D`
+ `echo -n 'admin' | base64`
+ `echo 'MWYyZDFlMmU2N2Rm' | base64 --decode`


## replicationController
+ `kubectl get rc`
+ `kubectl edit rc <name>` edit pod template or replicas
    + `export KUBE_EDITOR="/usr/bin/nano"` 选择editor
+ `kubectl scale rc kubia --replicas=10`
+ `kubectl delete rc kubia --cascade=false` 删除RC 保留pods

## replicaSet
+ `kubectl get rs`
+ `kubectl describe rs`
+ `kubectl delete rs kubia`

## daemonSet
+ `kubectl get ds`

## jobs
+ `kubectl get jobs`
+ `kubectl get po -a` 查看运行完的pod
+ `kubectl scale job multi-completion-batch-job --replicas 3`

## deployment
+ `kubectl get deployment`
+ `kubectl describe deployment`
+ `kubectl rollout status deployment kubia`
+ `kubectl patch deployment kubia -p '{"spec": {"minReadySeconds": 10}}'`
+ `kubectl set image deployment kubia nodejs=luksa/kubia:v2` rollout
+ `kubectl rollout undo deployment kubia`
+ `kubectl rollout history deployment kubia`
+ `kubectl rollout undo deployment kubia --to-revision=1`
+ `kubectl rollout pause deployment kubia`
+ `kubectl rollout resume deployment kubia`

## Node
+ `kubectl get node`
+ `kubectl label node minikube disk=ssd`

## events
+ `kubectl get events --watch`

## debug
+ ssh a worker node
    + `docker ps`
+ `kubectl get events --watch`
+ `kubectl logs <pod name> --previous`可以查看之前的log,查找重启原因
+ `kubectl exec <pod name>  -n namespace -- printenv` 查看环境变量

## patch
+ `kubectl patch deployment website --patch "$(cat patch-website.yml)"`

## tips
+ `--all-namespaces`
+ `--previous` 
    + `kubectl logs <pod name> --previous`可以查看之前的log,查找重启原因
    + `kubectl describe po kubia-liveness` 查看重启原因
+ `--all`
    + `kubectl delete rc --all`
+ `--record`  history的一部分
    + `kubectl create -f kubia-deployment-v1.yaml --record`
+ `--watch` 监控资源的变化
    + `kubectl get pods -o yaml --watch`
    + `kubectl get pods --watch`
+ `-f` 后面文件或文件夹
+ `--output=yaml`
+ `-o yaml`
    + `-o wide`
+ `--grace-period`
    + `kubectl delete po mypod --grace-period=5`
    + `kubectl delete po mypod --grace-period=0 --force`

+ verbosity level
    + `kubectl get ats -v=7`

+ `kubectl edit`	
<!-- Opens the object’s manifest in your default editor. After making changes, saving the file, and exiting the editor, the object is updated. Example: kubectl edit deployment kubia -->
+ `kubectl patch`	
<!-- Modifies individual properties of an object. Example: kubectl patch deployment kubia -p '{"spec": {"template": {"spec": {"containers": [{"name": "nodejs", "image": "luksa/kubia:v2"}]}}}}' -->
+ `kubectl apply`	
<!-- Modifies the object by applying property values from a full YAML or JSON file. If the object specified in the YAML/JSON doesn’t exist yet, it’s created. The file needs to contain the full definition of the resource (it can’t include only the fields you want to update, as is the case with kubectl patch). Example: kubectl apply -f kubia-deployment-v2.yaml -->
+ `kubectl replace`	
<!-- Replaces the object with a new one from a YAML/JSON file. In contrast to the apply command, this command requires the object to exist; otherwise it prints an error. Example: kubectl replace -f kubia-deployment-v2.yaml -->
+ `kubectl set image`	
<!-- Changes the container image defined in a Pod, ReplicationController’s template, Deployment, DaemonSet, Job, or ReplicaSet. Example: kubectl set image deployment kubia nodejs=luksa/kubia:v2 -->

## ref
+ [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

+ [kubectlbook](https://kubectl.docs.kubernetes.io/)
+ [kubectl 命令式](https://kubernetes.io/zh/docs/tasks/manage-kubernetes-objects/imperative-config/)
+ [kubectl 声明式](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/)
+ [Kubernetes kubectl 命令表](http://docs.kubernetes.org.cn/683.html)
+ [kubectl](https://kubernetes.io/zh/docs/reference/kubectl/)
+ [kubectl docs](https://kubectl.docs.kubernetes.io/pages/container_debugging/port_forward_to_pods.html)
+ [通过describe命令学习Kubernetes的pod属性详解](https://developer.aliyun.com/article/672167?spm=a2c6h.14164896.0.0.46eb6d11HeMlD1)
+ [kubectl-commands](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
+ [Kubernetes Object Management](https://kubernetes.io/docs/concepts/overview/working-with-objects/object-management/) 
+ [获取正在运行容器的 Shell](https://kubernetes.io/zh/docs/tasks/debug-application-cluster/get-shell-running-container/)

+ [配置对多集群的访问](https://kubernetes.io/zh/docs/tasks/access-application-cluster/configure-access-multiple-clusters/)