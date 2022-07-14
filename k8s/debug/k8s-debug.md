## debug pod

+ `kubectl logs --prevous <pod name> <container name>` 查看崩溃之前的日志

+ `kubectl exec -it <pod name> -c <container name> -- <cmd> <arg1> <arg2>`
    + 镜像包含调试程序,比如从linux基础构建的镜像
+ `kubectl exec <pod name> env`
+ `kubectl exec <pod name> ps aux`


## kubectl debug

+ `kubectl exec`无法使用时的调试方式

+ kubectl alpha debug
    + 当容器崩溃或镜像不包含调试程序时
    + 给运行的pod添加一个临时容器

+ ephemeral contianers(临时容器)
  + debug用，不能在build中用


+ `kubectl debug myapp -it --image=ubuntu --share-processes --copy-to=myapp-debug`   复制一个pod,使它带一个新的容器
  + `kubectl debug myapp -it --copy-to=myapp-debug --container=myapp -- sh`  复制一个pod 改变他的命令
  + `kubectl debug myapp --copy-to=myapp-debug --set-image=*=ubuntu` 复制一个pod 改变他的所有container为ubuntu

+ `kubectl debug node/mynode -it --image=ubuntu`
  + 指定node上创建pod

+ process    
    + `kubectl run ephemeral-demo --image=k8s.gcr.io/pause:3.1 --restart=Never`
    + `kubectl exec -it ephemeral-demo -- sh` 有错误,因为镜像中没有shell
    + `kubectl debug -it ephemeral-demo --image=busybox --target=ephemeral-demo`
        + --target 参数指定另一个容器的进程命名空间

## debugging using a copy of pod
 + `kubectl run myapp --image=busybox --restart=Never -- sleep 1d`
 + `kubectl debug myapp -it --image=ubuntu --share-processes --copy-to=myapp-debug`
    + 把myapp复制到myapp-debug pod，并添加容器ubuntu


+ `kubectl run --image=busybox myapp -- false`
    + 模拟崩溃
    + `kubectl debug myapp -it --copy-to=myapp-debug --container=myapp -- sh`debug 更改命令

## busybox 调试
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  containers:
  - name: busybox
    image: busybox
    command:
      - sleep
      - "3600"
    imagePullPolicy: IfNotPresent
  restartPolicy: Always
```
+ `kb exec -it busybox -- sh`


## node调试

+ 部分集群提供ssh to node

+ hostPath
  + mount node filesystem to a pod


## debug apiserver

<!-- kubectl proxy -->
+ `kubectl proxy`
+ 查看所有api
    + http://127.0.0.1:8001/


<!-- API & resources -->
+ `kubectl get apiservice`
+ `kubectl api-versions`
+ `kubectl api-resources`
    + `kubectl api-resources -o wide`
    + `kubectl api-resources --namespaced=false`查看不在命名空间中的资源
+ `kubectl cluster-info`
+ `kubectl proxy  [--port=8080]`  用代理访问kubernetes API
    + `curl http://localhost:8080/api/`
+ `kubectl explain <k8s obj>`
    - `kubectl explain pods`  
        + `kubectl explain pods.spec` 

<!-- debug -->
+ `kb get --raw /apis/networking.k8s.io/v1`


## ref
 + [Debug Running Pods](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-running-pod/)
 + [调试 Service](https://kubernetes.io/zh/docs/tasks/debug-application-cluster/debug-service/)
 + [如何优雅的在 Kubernetes Pod 内进行网络抓包 ](https://www.cnblogs.com/cheyunhua/p/16256434.html)