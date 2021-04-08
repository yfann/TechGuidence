# debug pod

## log

+ `kubectl logs --prevous <pod name> <container name>` 查看崩溃之前的日志

## exec

+ `kubectl exec -it <pod name> -c <container name> -- <cmd> <arg1> <arg2>`
    + 镜像包含调试程序,比如从linux基础构建的镜像
+ `kubectl exec <pod name> env`
+ `kubectl exec <pod name> ps aux`


## 临时容器调试
+ kubectl alpha debug
    + 当容器崩溃或镜像不包含调试程序时`kubectl exec`无法使用
    + 给运行的pod添加一个临时容器

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

## ref
 + [Debug Running Pods](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-running-pod/)
 + [调试 Service](https://kubernetes.io/zh/docs/tasks/debug-application-cluster/debug-service/)