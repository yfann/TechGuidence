

## kibana.yaml

```yml
searchguard.openid.scope: "profile email"
searchguard.openid.logout_url: "https://keycloak.example.com:8080/auth/realms/master/protocol/openid-connect/logout"

# Configure the Kibana internal server user
elasticsearch.username: '${kibana_user}'
elasticsearch.password: '${kibana_pass}'


```

## elasticsearch.yml

```yml
opensearch_security.openid.base_redirect_url: "https://...."
opendistro_security.openid.root_ca: "/usr/share/kibana/config/root-ca.pem"
```

## sso

+ 映射sso user的role到opensearch的role
```yml
openid_auth_domain:
  http_authenticator:
    config:
      roles_key: roles
      ...

# keycloak 返回的ID token中需要有 roles:["admin"], client scope->roles->realm roles开启
# 可以映射opensearch的admin role
```

## debug

+ ``

## tips

+ roles
    + kibana_user

+ `roles_key` use JWT roles

+ 循环跳转时
  + dashoard没有配置成功
    + secret不需要base64编码
  + master 的security没生效

## ref
<!-- kibana -->
+ [Read only mode](https://docs.search-guard.com/latest/kibana-read-only)
+ [Kibana OpenID Connect Authentication](https://docs.search-guard.com/latest/kibana-authentication-openid)

<!-- roles -->
+ [Open Distro  user and roles](https://opendistro.github.io/for-elasticsearch-docs/docs/security/access-control/users-roles/)

<!-- openid -->
+ [opensearch-project/security](https://github.com/opensearch-project/security)
+ [opensearch OpenID Connect](https://opensearch.org/docs/latest/security-plugin/configuration/openid-connect/)
+ [OpenID Connect troubleshooting](https://opensearch.org/docs/latest/troubleshoot/openid-connect/#set-log-level-to-debug)

<!-- logs -->
+ [logs](https://opensearch.org/docs/latest/opensearch/logs/)

<!-- tls -->
+ [Setting up SSL with OpenID](https://forum.opensearch.org/t/setting-up-ssl-with-openid/3360)