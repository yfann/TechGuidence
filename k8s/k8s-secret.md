
## cmd 
+ `kubectl create secret`
```bash
# 设置键名
kubectl create secret generic db-user-pass \
  --from-file=username=./username.txt \
  --from-file=password=./password.txt
```
+ `kubectl get secrets`
    - `kubectl get secret <secret name> -o yaml`
+ `kubectl describe secrets/db-user-pass`
+ `kubectl edit secrets <secret name>`

## Secret
+ 保存敏感信息
+ 服务账号使用 API 凭证自动创建和附加 Secret
+ Secret 对象的名称必须是合法的 DNS 子域名
+ 数据
    + data,存储base64编码的任意数据
        - `echo -n 'admin' | base64`
        - `echo 'MWYyZDFlMmU2N2Rm' | base64 --decode`
    + stringData,未编码的字符串
```yaml
# ......
data:
  config.yaml: YXBpVXJsOiAiaHR0c...
# ......
```
+ 挂载的 Secret 会被自动更新
+ 不可变类型(关闭 kube-apiserver 对其的监视)
```yaml
apiVersion: v1
kind: Secret
metadata:
  ...
data:
  ...
immutable: true
```
## 使用
+ 挂载到容器上的卷中的文件(Pod使用放在卷上的Secret)
  - secret对象会先于依赖他的Pod创建
```yaml
# Secret的data映射中的每一个建都对应mountPath下的一个文件名
# spec.volume下挂载secret
# username Secret 存储在 /etc/foo/my-group/my-username 文件中而不是 /etc/foo/username 中。
# mode 文件权限
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: mypod
    image: redis
    volumeMounts:
    - name: foo
      mountPath: "/etc/foo"
      readOnly: true
  volumes:
  - name: foo
    secret:
      secretName: mysecret
      items:
      - key: username
        path: my-group/my-username
        mode: 511
```
+ 作为容器的环境变量
  - 必须先创建 Secret，Pod引用不存在的Secret时无法启动
  - `echo $SECRET_USERNAME`
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-env-pod
spec:
  containers:
  - name: mycontainer
    image: redis
    env:
      - name: SECRET_USERNAME
        valueFrom:
          secretKeyRef:
            name: mysecret
            key: username
      - name: SECRET_PASSWORD
        valueFrom:
          secretKeyRef:
            name: mysecret
            key: password
  restartPolicy: Never
  ------------------
apiVersion: v1
kind: Pod
metadata:
  name: secret-test-pod
spec:
  containers:
    - name: test-container
      image: k8s.gcr.io/busybox
      command: [ "/bin/sh", "-c", "env" ]
      envFrom:
      - secretRef:
          name: mysecret
  restartPolicy: Never
```
+ kubelet 为Pod拉取镜像时使用
  - `imagePullSecrets`

## tips
+ 通过 API 创建 Pod 时，不会检查引用的 Secret 是否存在。一旦 Pod 被调度，kubelet 就会尝试获取该 Secret 的值. Kubelet会重试直到获取Secret值
+ Secret 不会被写入磁盘，而是被 kubelet 存储在 tmpfs 中。 一旦依赖于它的 Pod 被删除，Secret 数据的本地副本就被删除。
+ 你可以为 Secret 数据开启静态加密， 这样 Secret 数据就不会以明文形式存储到etcd 中。

## ref
+ [Secret](https://kubernetes.io/zh/docs/concepts/configuration/secret/)
+ [静态加密 Secret 数据](https://kubernetes.io/zh/docs/tasks/administer-cluster/encrypt-data/)
+ [对象名称和IDs](https://kubernetes.io/zh/docs/concepts/overview/working-with-objects/names/#dns-subdomain-names)
+ [springboot读取配置信息、环境变量](https://blog.csdn.net/ggaofengg/article/details/79380055)
+ [Mount Environment Variables Safely with Kubernetes Secrets and Helm chart](https://medium.com/gammastack/mounting-environment-variables-safely-with-kubernetes-secrets-and-helm-chart-764420dc787b)