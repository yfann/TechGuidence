
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


    

## groups

+ `system:authenticated` 通过验证的user会包含此组

## tips

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
+ [使用 RBAC 鉴权](https://kubernetes.io/zh-cn/docs/reference/access-authn-authz/rbac/)
+ [Kubernetes RBAC (基于角色的访问控制) 的演进历史、设计理念及简洁实现](https://zhuanlan.zhihu.com/p/485779426)
+ [RBAC like it was meant to be](https://tailscale.com/blog/rbac-like-it-was-meant-to-be/)

+ [Limiting access to Kubernetes resources with RBAC](https://learnk8s.io/rbac-kubernetes)
<!-- integrate RBAC with keycloak -->
+ [RBAC keylcoak](https://faun.pub/kubernetes-auth-e2f342a5f269)