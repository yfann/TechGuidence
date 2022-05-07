

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
opendistro_security.restapi.roles_enabled: ["all_access","security_rest_api_access"]
```

## tips

+ roles
    + kibana_user

+ `roles_key` use JWT roles

## ref
<!-- kibana -->
+ [Read only mode](https://docs.search-guard.com/latest/kibana-read-only)
+ [Kibana OpenID Connect Authentication](https://docs.search-guard.com/latest/kibana-authentication-openid)

<!-- roles -->
+ [Open Distro  user and roles](https://opendistro.github.io/for-elasticsearch-docs/docs/security/access-control/users-roles/)

<!-- opensearch -->
+ [opensearch-project/security](https://github.com/opensearch-project/security)
+ [opensearch OpenID Connect](https://opensearch.org/docs/latest/security-plugin/configuration/openid-connect/)