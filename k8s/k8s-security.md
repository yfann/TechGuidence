
## tips
+ securitry Context
    + UID
    + GID

+  PodSecurityContext 
```yaml
containers:
  securityContext:
    runAsUser: ...
```
## ref
+ [为 Pod 或容器配置安全性上下文](https://kubernetes.io/zh/docs/tasks/configure-pod-container/security-context/)