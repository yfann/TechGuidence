
## RBAC
+ serviceaccount,role,rolebinding
+ 权限为累加(不会拒绝)
+ 非system: 开头的。这些是面向用户的角色
+ Role作用于namespace
+ ClusterRole作用于整个cluster
    + 包含Role功能
    + nodes
    + 非资源端点
    + 跨命名空间访问(kubectl get pods --all-namespaces)
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""] # "" 指定核心 API 组
  resources: ["pods", "pods/log"]
  resourceNames: ["my-configmap"] #也可以按照名称引用资源
  verbs: ["get", "watch", "list"]
```

+ RoleBinding/ClusterRoleBinding
    + roleRef部分不可以修改，只能删除重建
```yaml
apiVersion: rbac.authorization.k8s.io/v1
# 此角色绑定使得用户 "jane" 能够读取 "default" 命名空间中的 Pods
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: jane # Name is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role #this must be Role or ClusterRole
  name: pod-reader # 这里的名称必须与你想要绑定的 Role 或 ClusterRole 名称一致
  apiGroup: rbac.authorization.k8s.io
```


## 服务账号
+ system:serviceaccounts:(前缀)
+ 如果一个应用没有指定 serviceAccountName，那么它将使用 "default" 服务账号。
+ 许多附加组件 add-ons 目前在 kube-system 命名空间以 "default" 服务账号运行.要允许这些附加组件以超级用户权限运行，需要将集群的 cluster-admin 权限授予 kube-system 命名空间中的 "default" 服务账号。

## cmd

+ `kubectl create role pod-reader --verb=get --verb=list --verb=watch --resource=pods`
    + `kubectl create role pod-reader --verb=get --resource=pods --resource-name=readablepod --resource-name=anotherpod`
    + `kubectl create role foo --verb=get,list,watch --resource=replicasets.apps` 指定apiGroups

+ `kubectl create rolebinding bob-admin-binding --clusterrole=admin --user=bob --namespace=acme`
    + `kubectl create rolebinding myappnamespace-myapp-view-binding --clusterrole=view --serviceaccount=myappnamespace:myapp --namespace=acme`


+ `kubectl describe clusterrolebindings| grep -B 9 "hsc-vcap-system"`
+ `kubectl describe clusterroles <role name>`
+ `kubectl get clusterroles system:discovery -o yaml`

## tips
+ k8s 1.6 API Server启用了RBAC授权
+ aggregationRule（k8s 1.9 clusterRole可以使用）
+ DAC -> MAC -> RBAC -> ABAC
  + DAC(Discretionary Access Control) 
    + 文件owner自主设置文件权限
    + rwx
      + chmod
  + MAC(Mandatory access control)
    + 强制访问控制，admin设置文件权限
    + MFA( multi-factor authentication)
    + 2FA
  + RBAC
    + 是MAC的子集
  + ABAC(attribute-based access control)
    + RBAC的改进
      + 除了检查用户的role还会检查用户的attribute
    + Attribute: 位置，设备，认证类型，用户的cookie

## ref
+ [使用 RBAC 鉴权](https://kubernetes.io/zh/docs/reference/access-authn-authz/rbac/)
+ [为 Pod 配置服务账户](https://kubernetes.io/zh/docs/tasks/configure-pod-container/configure-service-account/)
<!-- detail -->
+ [Kubernetes RBAC (基于角色的访问控制) 的演进历史、设计理念及简洁实现](https://zhuanlan.zhihu.com/p/485779426)
+ [RBAC like it was meant to be](https://tailscale.com/blog/rbac-like-it-was-meant-to-be/)