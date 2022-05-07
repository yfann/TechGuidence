



## SSO with keycloak

```yml
apiVersion: v1
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