# Keycloak

 + IAM
 + SSO
    + OpenID Connect
    + SAML 2.0





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

## ref
+ [keycloak](https://www.keycloak.org/)
+ [Keycloak: Core concepts of open source identity and access management](https://developers.redhat.com/blog/2019/12/11/keycloak-core-concepts-of-open-source-identity-and-access-management#)
+ [Keycloak features and concepts](https://www.keycloak.org/docs/latest/server_admin/#keycloak-features-and-concepts)

<!-- documents -->
+ [keycloak documents](https://www.keycloak.org/documentation.html)
+ [Client Scope](https://wjw465150.gitbooks.io/keycloak-documentation/content/server_admin/topics/roles/client-scope.html)

<!-- api -->
+ [api documents](https://www.keycloak.org/docs-api/9.0/rest-api/index.html)
+ [Authentication and authorization using the Keycloak REST API](https://developers.redhat.com/blog/2020/11/24/authentication-and-authorization-using-the-keycloak-rest-api#)
+ [API login and JWT token generation using Keycloak](https://developers.redhat.com/blog/2020/01/29/api-login-and-jwt-token-generation-using-keycloak#)
+ [How to get client secret from Keycloak using curl?](https://stackoverflow.com/questions/57265755/how-to-get-client-secret-from-keycloak-using-curl)
+ [Admin REST API](https://wjw465150.gitbooks.io/keycloak-documentation/content/server_development/topics/admin-rest-api.html)

<!-- sso -->
+ [Keycloak快速上手指南，只需10分钟即可接入Spring Boot/Vue前后端分离应用实现SSO单点登录](https://juejin.cn/post/6844903973741150215)
+ [Integrating Keycloak and ArgoCD](https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/keycloak/)