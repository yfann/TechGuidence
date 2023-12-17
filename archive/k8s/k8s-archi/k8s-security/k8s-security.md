
## tips
+ securitry Context
    + UID
    + GID

+  PodSecurityContext 
    + 可以应用到Pod中的所有Container
```yaml
spec:
  securityContext:
    runAsUser: ...

# ps
# 查看runAsUser
# PID   USER     TIME  COMMAND

# ls -l
# 查看fsGroup设置


# id
```

## inject vault agent container to pod in openshift
+ vault.hashicorp.com/agent-run-as-user 

+ vault.hashicorp.com/agent-run-as-same-user: "true"
    + agent注入的容器和原有的容器runAsUser一致

+  vault.hashicorp.com/agent-set-security-context: "false"
    + That will let openshift apply its own security context for your openshift project

## ref
+ [为 Pod 或容器配置安全性上下文](https://kubernetes.io/zh/docs/tasks/configure-pod-container/security-context/)