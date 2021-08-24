# virtlet


## install

### install criproxy to every node

+ 通过登录 hostPath:/ 的pod修改node配置

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ssh-node
  labels:
    plugin: ssh-node
spec:
  containers:
  - name: ssh-node
    image: radial/busyboxplus:curl
    imagePullPolicy: IfNotPresent
    command: ["chroot", "/host"]
    tty: true
    stdin: true
    stdinOnce: true
    securityContext:
      privileged: true
    volumeMounts:
    - name: host
      mountPath: /host
  volumes:
  - name: host
    hostPath:
      path: /
  hostNetwork: true
  hostIPC: true
  hostPID: true
  restartPolicy: Never
```

+ pod中curl访问外网，设proxy
    + `export HTTP_PROXY="xxxx"`


## ref

+ [criproxy](https://github.com/Mirantis/criproxy)