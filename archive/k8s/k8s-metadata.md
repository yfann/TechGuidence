



## metadata

+ service account
    + pod-----authentication----->API server

+ metadata of pod can be passed to container by  environment or downwardAPI volumn

+ label and annotation can only  be exposed through downwardAPI volumn
  + label or annotation 可能会被更新
    + 即使更新 downwardAPI volumn中映射的文件也会同步更新

+ container level metadata要指定container name
```yaml
spec:
  volumes:
  - name: downward
    downwardAPI:
      items:
      - path: "containerCpuRequestMilliCores"
        resourceFieldRef:
          containerName: main                    ❶
          resource: requests.cpu
          divisor: 1m
```

+ 同pod下的不同container可以传递metadata
  + 通过volumn

## pass metadata by env
+ 只能获取同一个container的metadata

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: downward
spec:
  containers:
  - name: main
    image: busybox
    command: ["sleep", "9999999"]
    resources:
      requests:
        cpu: 15m
        memory: 100Ki
      limits:
        cpu: 100m
        memory: 4Mi
    env:
    - name: POD_NAME
      valueFrom:                                   ❶
        fieldRef:                                  ❶
          fieldPath: metadata.name                 ❶
    - name: POD_NAMESPACE
      valueFrom:
        fieldRef:
          fieldPath: metadata.namespace
    - name: POD_IP
      valueFrom:
        fieldRef:
          fieldPath: status.podIP
    - name: NODE_NAME
      valueFrom:
        fieldRef:
          fieldPath: spec.nodeName
    - name: SERVICE_ACCOUNT
      valueFrom:
        fieldRef:
          fieldPath: spec.serviceAccountName
    - name: CONTAINER_CPU_REQUEST_MILLICORES
      valueFrom:                                   ❷
        resourceFieldRef:                          ❷
          resource: requests.cpu                   ❷
          divisor: 1m                              ❸
    - name: CONTAINER_MEMORY_LIMIT_KIBIBYTES
      valueFrom:
        resourceFieldRef:
          resource: limits.memory
          divisor: 1Ki
```

+ `kubectl exec downward env`

## Passing metadata through files by downwardAPI volumn

+ 只能获取同一个pod的metadata(可以不同container)

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: downward
  labels:                                     ❶
    foo: bar                                  ❶
  annotations:                                ❶
    key1: value1                              ❶
    key2: |                                   ❶
      multi                                   ❶
      line                                    ❶
      value                                   ❶
spec:
  containers:
  - name: main
    image: busybox
    command: ["sleep", "9999999"]
    resources:
      requests:
        cpu: 15m
        memory: 100Ki
      limits:
        cpu: 100m
        memory: 4Mi
    volumeMounts:                             ❷
    - name: downward                          ❷
      mountPath: /etc/downward                ❷
  volumes:
  - name: downward                            ❸
    downwardAPI:                              ❸
      items:
      - path: "podName"                       ❹
        fieldRef:                             ❹
          fieldPath: metadata.name            ❹
      - path: "podNamespace"
        fieldRef:
          fieldPath: metadata.namespace
      - path: "labels"                            ❺
        fieldRef:                                 ❺
          fieldPath: metadata.labels              ❺
      - path: "annotations"                       ❻
        fieldRef:                                 ❻
          fieldPath: metadata.annotations         ❻
      - path: "containerCpuRequestMilliCores"
        resourceFieldRef:
          containerName: main
          resource: requests.cpu
          divisor: 1m
      - path: "containerMemoryLimitBytes"
        resourceFieldRef:
          containerName: main
          resource: limits.memory
          divisor: 1
```


+ `kubectl exec downward ls -lL /etc/downward`
+ `kubectl exec downward cat /etc/downward/labels`




## k8s API server
+ 可以获取其他pod和resource的metadata

+ `kubectl cluster-info`
<!-- Kubernetes master is running at https://192.168.99.100:8443 -->
+ `curl https://192.168.99.100:8443 -k` `--insecure`
<!-- 跳过https认证检查 -->

<!-- 或者 -->
+ `kubectl proxy`
<!-- curl localhost:8001 -->