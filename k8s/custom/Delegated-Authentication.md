## Delegated Authentication

+ custom API server和k8s API server使用的auth lib一致

+ 请求经过auth后先到k8s API server，再proxy到后面的custom API server
    +  preauthorized
        + request到达custom API server时已经被K8s API server认证过了
        + request header:X-Remote-User(有值)
        + X-Remote-Group(有值)
+ custom API server可以信任这些header不用重新认证
    + 因为reqeust header:client CA
        + kube-system/extension-apiserver-authentication
    + auth
        + request使用的client sertificate与client-ca-file是否一致
        + Clients preauthenticated by the Kubernetes API server whose requests are forwarded using the given requestheader-client-ca-file and whose username and group memberships are stored in the given HTTP headers X-Remote-Group and X-Remote-User


## Delegated Authorization

+ 在每个aggergated custom API server上有cache
    + allow 5m
    + deny 30s
+ based on username and group list
+ RBAC
    + map id to roles
+ SubjectAccessReviews

```yaml
# 发送给K8s API server
apiVersion: authorization.k8s.io/v1
kind: SubjectAccessReview
spec:
  resourceAttributes:
    group: apps
    resource: deployments
    verb: create
    namespace: default
    version: v1
    name: example
  user: michael
  groups:
  - system:authenticated
  - admins
  - authors
# 返回结果
apiVersion: authorization.k8s.io/v1
kind: SubjectAccessReview
status:
  allowed: true
  denied: false
  reason: "rule foo allowed this request"
```

## tips

+ TokenAccessReview
    + 发送<Authorization:bearer token>到k8s API server验证