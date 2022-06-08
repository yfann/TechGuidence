



## SSO with keycloak

+ sso
```yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
data:
  application.instanceLabelKey: argocd.argoproj.io/instance
  oidc.config: |
    name: Keycloak
    issuer: http://<keycloak ip>/auth/realms/China-OP
    clientID: argocd
    clientSecret: $oidc.keycloak.clientSecret
    # JWT claim 返回的字段
    requestedScopes: [roles, openid, profile, email, groups]
  url: <argo ip>
kind: ConfigMap
```


+ role mapping
```yaml
kind: ConfigMap
metadata:
  name: argocd-rbac-cm
data:
   # 必须设置
   policy.default: role:readonly # 为role:admin时，policy.csv会失效，登入用户都为admin
   policy.csv: |
     p, myrole, clusters, get, */*, allow
     g, /admin, role:myrole

# check the group name in keycloak. Fe. /admin or admin
```

## ref
+ [Integrating Keycloak and ArgoCD](https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/keycloak/)
+ [RBAC Configuration](https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/)
<!-- issue -->
+ [X509 certificates with SSO issuer](https://github.com/argoproj/argo-workflows/discussions/5079)