## config app

### command-line arguments

+ Dockerfile
    + entrypoint
        + executable invoked when contianer is started
    + CMD
        + specify the arguments that get passed to the entrypoint
    + `docker run <img>`
        + `docker run <img> <arguments>`override whatever's set under CMD in the dockerfile
    + shell form
        + shell 中运行
        + 容器中会有个shell进程为主进程
        + `ENTRYPOINT node app.js`
    + exec form
        + 直接运行
        + `ENTRYPOINT ["node", "app.js"]`
    + `docker exec 4675d ps x`
        + 查看进程
```yaml
FROM ubuntu:latest
RUN apt-get update ; apt-get -y install fortune
ADD fortuneloop.sh /bin/fortuneloop.sh
ENTRYPOINT ["/bin/fortuneloop.sh"]                 ❶
CMD ["10"]                                         ❷
```
    + ❶ exec form
    + ❷ default argument for the executable

+ Overriding ENTRYPOINT and CMD
```yaml
kind: Pod
spec:
  containers:
  - image: some/image
    command: ["/bin/command"]
    args: ["arg1", "arg2", "arg3"]
```

### environment variable
+ container level,not pod level
```yaml
kind: Pod
spec:
 containers:
 - image: luksa/fortune:env
   env:                            ❶
   - name: INTERVAL                ❶
     value: "30"                   ❶
   name: html-generator
...
```

+ 引用变量
```yaml
env:
- name: FIRST_VAR
  value: "foo"
- name: SECOND_VAR
  value: "$(FIRST_VAR)bar"
```
### mounting configuration files with volume

### configmap

+ read configMap from environment variables
    + configMapKeyRef.optional: true  找不到configMap container也会启动
    + 导入的key作为环境变量不合法会忽略
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fortune-env-from-configmap
spec:
  containers:
  - image: luksa/fortune:env
    env:                             ❶
    - name: INTERVAL                 ❶
      valueFrom:                     ❷
        configMapKeyRef:             ❷
          name: fortune-config       ❸
          key: sleep-interval        ❹
# 导入所有变量
spec:
  containers:
  - image: some-image
    envFrom:                      ❶
    - prefix: CONFIG_             ❷
      configMapRef:               ❸
        name: my-config-map       ❸
```

+ pass ConfigMap to command-line args by $(ENV_VAR)
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fortune-args-from-configmap
spec:
  containers:
  - image: luksa/fortune:args          ❶
    env:                               ❷
    - name: INTERVAL                   ❷
      valueFrom:                       ❷
        configMapKeyRef:               ❷
          name: fortune-config         ❷
          key: sleep-interval          ❷
    args: ["$(INTERVAL)"]              ❸
```

+ configMap volumes
    + 把volume mount为一个已经存才的文件夹
        + 原有的文件会不可见，container 只能访问mount的文件
    + 可以mount为单个文件,不会覆盖已经存才的文件

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fortune-configmap-volume
spec:
  containers:
  - image: nginx:alpine
    name: web-server
    volumeMounts:
    ...
    - name: config
      mountPath: /etc/nginx/conf.d      ❶
      readOnly: true
    ...
  volumes:
  ...
  - name: config
    configMap:                          ❷
      name: fortune-config              ❷
  ...

# import part of configMap
  volumes:
  - name: config
    configMap:
      name: fortune-config
      items:                             ❶
      - key: my-nginx-config.conf        ❷
        path: gzip.conf                  ❸
# mount为单个文件而不是整个文件夹
spec:
  containers:
  - image: some/image
    volumeMounts:
    - name: myvolume
      mountPath: /etc/someconfig.conf      ❶
      subPath: myconfig.conf               ❷
#  the permissions on all files in a configMap volume are set to 644 (-rw-r—r--).
  volumes:
  - name: config
    configMap:
      name: fortune-config
      defaultMode: "6600"           ❶
```

+ udpate configMap
    + 所有引用也会更新
    + 不需要重启app
    + 需要app reload config
        + `kubectl exec fortune-configmap-volume -c web-server -- nginx -s reload`
    + symbolic links(更新volumn中的引用)
    + mount 单个文件（而不是整个文件夹）不会更新

+ container is immutable
    + 同个image创建的container都会一致
    + 有的container可能会不支持reload config
        + 这样如果configMap改变，有些container会在旧版本的config下运行


## ref
+ [使用 ConfigMap 配置 Pod](https://kubernetes.io/zh/docs/tasks/configure-pod-container/configure-pod-configmap/)

+ [K8s 集群使用 ConfigMap 优雅加载 Spring Boot 配置文件](https://cloud.tencent.com/developer/article/1433236)
+ [Configuring Spring Boot on Kubernetes with ConfigMap](https://developers.redhat.com/blog/2017/10/03/configuring-spring-boot-kubernetes-configmap/)
+ [Configuring Redis using a ConfigMap](https://kubernetes.io/docs/tutorials/configuration/configure-redis-using-configmap/)