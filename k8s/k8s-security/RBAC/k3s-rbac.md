

## groups

+ `system:authenticated` 通过验证的user会包含此组

## tips

+ 进程发起api call的身份(kubectl,kubelet...)
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

## ref
+ [Authenticating](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#users-in-kubernetes)
+ [使用 RBAC 鉴权](https://kubernetes.io/zh-cn/docs/reference/access-authn-authz/rbac/)
<!-- RBAC with keycloak -->
+ [RBAC keylcoak](https://faun.pub/kubernetes-auth-e2f342a5f269)