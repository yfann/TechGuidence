
## pods healthy
+ kubelet 会重启container，如果container main process crashing 或 liveness probes检查失败
    + 如果node crash，则无法重启

+ liveness probes
    + k8s 会周期性的检查liveness probes
        - HTTP GET
        - TCP socket
        - exec probe
            - exit status code:0  正常
    + 若果失败，会重启container

+  

### HTTP-based liveness probe
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: kubia-liveness
spec:
  containers:
  - image: luksa/kubia-unhealthy       ❶
    name: kubia
    livenessProbe:                     ❷
      httpGet:                         ❷
        path: /                        ❸
        port: 8080                     ❹
      initialDelaySeconds: 15           
```
+ initialDelaySeconds,pod建立后延迟多少秒再探查.（可以避免程序还没准备好导致探查失败）

+ app中可以定义一个独立的端点`/health` 提供探针
    +  不要加认证
    + 只有本身失败时，才返回失败代码。因为重启只会重启自身。

+ java app适合用 http get liveness probe,如果使用Exec probe会启动JVM消耗大量资源。

+ `kubectl get po kubia-liveness`查看重启次数
+ `kubectl logs mypod --previous`查看之前的log


## replicationController

+ managed pods
    + 即使node crash,也会重建pod

+ replicationController has 3 essential parts
    + label selector
        + pods in RC scope
    + replica count
        + desired number of pods
    + pod template
        + create new pod replicas

+ yaml
```yaml
apiVersion: v1
kind: ReplicationController        ❶
metadata:
  name: kubia                      ❷
spec:
  replicas: 3                      ❸
  selector:                        ❹
    app: kubia                     ❹
  template:                        ❺
    metadata:                      ❺
      labels:                      ❺
        app: kubia                 ❺
    spec:                          ❺
      containers:                  ❺
      - name: kubia                ❺
        image: luksa/kubia         ❺
        ports:                     ❺
        - containerPort: 8080      ❺
```
   - ❹不配置selector会直接从template中读取

+ pod isn't tied to a RC
    + pod.metadata.ownerReferences
    + 修改pod label可以使pod脱离 RC的管理

+ update pods
    + edit pod template in RC
    + 删除已有的pods,用新的template创建新的pods

+ 删除RC 保留pods
    + `kubectl delete rc kubia --cascade=false`


## ReplicaSet

+ 代替RC

+ 创建Deployment时会创建

+ label 匹配更加灵活
    + label可以匹配多个value
    + 可以只匹配key,不管value

+ yaml
```yaml
apiVersion: apps/v1beta2            ❶
kind: ReplicaSet                    ❶
metadata:
  name: kubia
spec:
  replicas: 3
  selector:
     matchExpressions:
     - key: app                      ❶
       operator: In                  ❷
       values:                       ❷
         - kubia                     ❷
  template:                         ❸
    metadata:                       ❸
      labels:                       ❸
        app: kubia                  ❸
    spec:  
      nodeSelector:                
        disk: ssd                                          
      containers:                   ❸
      - name: kubia                 ❸
        image: luksa/kubia          ❸
```

## DaemonSet

+ run each pod on each node
    + 通常为system level pod
        + log,monitor

+ node-Selector in pod template
    + 指定某些node上运行pod

+ 不经过Scheduler
    + 有些node会通过scheduler阻止pod部署过来
        + DaemonSet不受此约束


## job
+ 运行完会结束
  + `kubectl get po -a` 查看运行完的pod
  + 运行完的pod不会退出，可以看log

+ completions job的pod运行的次数，顺序运行，每次创建一个pod
+ parallelism   pod可以并行的个数
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: multi-completion-batch-job
spec:
  completions: 5                                ❶
  parallelism: 2                      ❷
  template:
    <template is the same as in listing 4.11>
```

+ activeDeadlineSeconds
  + job运行的时限,超过则运行fail

+ spec.backoffLimit
  + 失败时尝试的次数,默认6

+ yaml
```yaml
apiVersion: batch/v1                  ❶
kind: Job                             ❶
metadata:
  name: batch-job
spec:                                 ❷
  template:
    metadata:
      labels:                         ❷
        app: batch-job                ❷
    spec:
      restartPolicy: OnFailure        ❸
      containers:
      - name: main
        image: luksa/batch-job
```
  - ❸ restartPolicy 不能是always

## cron jobs

+ 按照时间计划执行的job
```yaml
apiVersion: batch/v1beta1                  
kind: CronJob
metadata:
  name: batch-job-every-fifteen-minutes
spec:
  schedule: "0,15,30,45 * * * *"           ❷
  startingDeadlineSeconds: 15              ❶
  jobTemplate:
    spec:
      template:                            ❸
        metadata:                          ❸
          labels:                          ❸
            app: periodic-batch-job        ❸
        spec:                              ❸
          restartPolicy: OnFailure         ❸
          containers:                      ❸
          - name: main                     ❸
            image: luksa/batch-job         ❸
```
   - ❶the pod must start running at 15 seconds past the scheduled time.
     - 超过时限则fail