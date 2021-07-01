
## tips
+ command
    + 会覆盖 docker entrypoint
+ args
    + 会覆盖 docker CMD
+ args 使用环境变量
```yaml
env:
- name: MESSAGE
  value: "hello world"
command: ["/bin/echo"]
args: ["$(MESSAGE)"]
```

## Pod Security Policy


+ pod 默认run as root
  + 进入pod通过`id`查看
    + `uid=0(root) gid=0(root) groups=0(root)`


+ pod run as root
```yaml
spec:
  securityContext:
    runAsUser: 0
```

+ dock file 中设置user
```
FROM alpine:latest
RUN apk update && addgroup -S mygroup && adduser -S myuser -G mygroup
USER myuser
ENTRYPOINT ["sh","-c","sleep 100000"]
```

## issues

+ pod中操作文件时`permission denied`
  + pod 没有run as root

## ref
+ [为容器设置环境变量](https://kubernetes.io/zh/docs/tasks/inject-data-application/define-environment-variable-container/)
+ [通过环境变量将Pod信息呈现给容器](https://kubernetes.io/zh/docs/tasks/inject-data-application/environment-variable-expose-pod-information/)
+ [pod template](https://kubernetes.io/docs/concepts/workloads/pods/#pod-templates)
+ [为容器设置启动时要执行的命令和参数](https://kubernetes.io/zh/docs/tasks/inject-data-application/define-command-argument-container/)

<!-- SecurityContext -->
+ [为 Pod 或容器配置安全性上下文](https://kubernetes.io/zh/docs/tasks/configure-pod-container/security-context/)
+ [熟悉又陌生的 k8s 字段：SecurityContext](https://developer.aliyun.com/article/777651)
+ [配置Security Context](https://help.aliyun.com/document_detail/163023.html)
+ [Digitalocean kubernetes and volume permissions](https://faun.pub/digitalocean-kubernetes-and-volume-permissions-820f46598965)


+ [Running Containers Securely Under Kubernetes](https://www.magalix.com/blog/running-containers-securely-under-kubernetes)