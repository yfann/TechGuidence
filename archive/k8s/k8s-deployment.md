## udpate new version of app manually
<!-- option 1 -->
+ update new version in RS pod template
+ delete old pods
<!-- option 2 blue-green deployment-->
+ create new pods
+ change service label selection to new pods
+ delete old pods
<!-- rolling update -->
+ replace pods step by step
+ scale down the old pods
+ scale up the new pods
+ service pod selector to both old and new pods


## deployments
+ declarative

+ deployment-->replicaSet-->pods

+ deploy & update pods 
    + rolling update时,可能要创建多个RS,一个version一个RS

+ create multiple RS
    + one for each version of the pod template
    + kubia-1506449474-xis6m(created pod name)  1506449474为pod template的hash

+ rollingudpate
    + remove old pods one by one
    + add new pods
    + 修改pod template会触发更新
```yaml
spec:
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
    type: RollingUpdate
```

+ recreate strategy(delete all old pods at once then create new ones)
    + 如果app不支持多版本同时运行
    + 短暂的不可用

+ revisionHistoryLimit  保留的版本数
+  minReadySeconds
    + how long a newly created pod should be ready before the pod is treated as available
    + slow down your rollout process

+ canary release  只替换一小部分old pods，然后验证
    + `kubectl rollout pause deployment kubia`
    + `kubectl rollout resume deployment kubia`

+ yaml
```yaml
apiVersion: apps/v1beta1          ❶
kind: Deployment                  ❷
metadata:
  name: kubia                     ❸
spec:
  replicas: 3
  template:
    metadata:
      name: kubia
      labels:
        app: kubia
    spec:
      containers:
      - image: luksa/kubia:v1
        name: nodejs
```