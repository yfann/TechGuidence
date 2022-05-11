# Keycloak

 + IAM
 + SSO
    + OpenID Connect
    + SAML 2.0


## Client Scope

+ expose claims 
    + can exposes claims attributes at user level
+ configured at the realm level and they can be linked to clients

+ add roles to ID token
    + CLient Scopes
        + roles
            + 开启`Add to ID token`
            + mappers
                + realm roles

## debug

+ ROPC
```sh
access_token=curl \
-d "client_id=ldap-app" -d "client_secret=password" \
-d "username=jbrown" -d "password=password" \
-d "grant_type=password" \
-d "scope=openid" \
https://localhost:8180/auth/realms/ldap-demo/protocol/openid-connect/token | jq -r '.access_token'
curl –header « Authorization: Bearer $access_token » \
https://localhost:8180/auth/realms/ldap-demo/protocol/openid-connect/userinfo | jq 
```

## issues

+ type=CODE_TO_TOKEN_ERROR
    + secret 没有写正确(base64编码或解码)

## tips

+ Keycloak acts as an identity broker between Argo CD and OpenShift.

+ user
    + offline_access role 可以登录keycloak

+ 获取token的方式
    + account + password
    + clientid + secret

+ api
    + /auth/realms/{realm}
    + /auth/admin/realms/{realm}

+ hostname

+ hostname-path
    + KC_HOSTNAME_PATH

+ bitnami/keycloak doesn't `KEYCLOAK_FRONTEND_URL`
```yml
extraStartupArgs: |
  -Dkeycloak.frontendUrl=https://mydomain.com/auth
```

+ `PROXY_ADDRESS_FORWARDING`

## ref
+ [keycloak](https://www.keycloak.org/)
+ [Keycloak: Core concepts of open source identity and access management](https://developers.redhat.com/blog/2019/12/11/keycloak-core-concepts-of-open-source-identity-and-access-management#)
+ [Keycloak features and concepts](https://www.keycloak.org/docs/latest/server_admin/#keycloak-features-and-concepts)

<!-- documents -->
+ [keycloak documents](https://www.keycloak.org/documentation.html)
+ [Client Scope](https://wjw465150.gitbooks.io/keycloak-documentation/content/server_admin/topics/roles/client-scope.html)
+ [Using Client Scope with RedHat SSO Keycloak](https://www.janua.fr/using-client-scope-with-redhat-sso-keycloak/)
+ [Configuring the Subsystem](https://wjw465150.gitbooks.io/keycloak-documentation/content/getting_started/topics/secure-jboss-app/subsystem.html)

<!-- api -->
+ [api documents](https://www.keycloak.org/docs-api/9.0/rest-api/index.html)
+ [Authentication and authorization using the Keycloak REST API](https://developers.redhat.com/blog/2020/11/24/authentication-and-authorization-using-the-keycloak-rest-api#)
+ [API login and JWT token generation using Keycloak](https://developers.redhat.com/blog/2020/01/29/api-login-and-jwt-token-generation-using-keycloak#)
+ [How to get client secret from Keycloak using curl?](https://stackoverflow.com/questions/57265755/how-to-get-client-secret-from-keycloak-using-curl)
+ [Admin REST API](https://wjw465150.gitbooks.io/keycloak-documentation/content/server_development/topics/admin-rest-api.html)
+ [Keycloak REST API: Create a New User](https://www.appsdeveloperblog.com/keycloak-rest-api-create-a-new-user/)

<!-- sso -->
+ [Keycloak快速上手指南，只需10分钟即可接入Spring Boot/Vue前后端分离应用实现SSO单点登录](https://juejin.cn/post/6844903973741150215)
+ [Integrating Keycloak and ArgoCD](https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/keycloak/)

<!-- helm -->
+ [bitnami/keycloak](https://github.com/bitnami/charts/blob/master/bitnami/keycloak/values.yaml)
+ [bitnami env](https://github.com/bitnami/bitnami-docker-keycloak/blob/master/16/debian-10/rootfs/opt/bitnami/scripts/keycloak-env.sh#L23-L73)