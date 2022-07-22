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

## sa
+ system:serviceaccounts:(前缀)
+ 如果一个应用没有指定 serviceAccountName，那么它将使用 "default" 服务账号。
+ 许多附加组件 add-ons 目前在 kube-system 命名空间以 "default" 服务账号运行.要允许这些附加组件以超级用户权限运行，需要将集群的 cluster-admin 权限授予 kube-system 命名空间中的 "default" 服务账号。

## groups

+ `system:authenticated` 通过验证的user会包含此组

## tips

+ process call k8s api 时的身份(kubectl,kubelet...)
    + normal user
    + service account
    + anonymous request

+ authenticate API requests through authentication plugins
    + client certificate
    + bearer token
    + authenticating proxy

+ `authenticating proxy` or `authentication webhook`
    + 可以集成其他认证协议
        + LDAP
        + SAML
        + X509

+ DAC -> MAC -> RBAC -> ABAC
  + DAC(Discretionary Access Control) 
    + 文件owner自主设置文件权限
    + rwx
      + chmod
  + MAC(Mandatory access control)
    + DAC的基础上加入admin
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
<!-- k8s鉴权 -->
+ [Authenticating](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#users-in-kubernetes)
+ [使用 RBAC 鉴权](https://kubernetes.io/zh-cn/docs/reference/access-authn-authz/rbac/)
+ [为 Pod 配置服务账户](https://kubernetes.io/zh-cn/docs/tasks/configure-pod-container/configure-service-account/)

<!-- RBAC design -->
+ [Kubernetes RBAC (基于角色的访问控制) 的演进历史、设计理念及简洁实现](https://zhuanlan.zhihu.com/p/485779426)
+ [RBAC like it was meant to be](https://tailscale.com/blog/rbac-like-it-was-meant-to-be/)

<!-- integrate RBAC with keycloak -->
+ [RBAC keylcoak](https://faun.pub/kubernetes-auth-e2f342a5f269)