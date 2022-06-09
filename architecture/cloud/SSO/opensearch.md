

## opensearch
<!-- values.yaml -->
```yml
searchguard.openid.scope: "profile email"
searchguard.openid.logout_url: "https://keycloak.example.com:8080/auth/realms/master/protocol/openid-connect/logout"

# Configure the Kibana internal server user
elasticsearch.username: '${kibana_user}'
elasticsearch.password: '${kibana_pass}'

opensearch:
  image: .../opensearch
  config:
    opensearch.yml: |
      ....
    jvm.options: |
      ....
       -Djdk.security.allowNonCaAnchor=true
  securityConfig:
    config:
      data:
        config.yml: |-
          config:
            dynamic:
              http:
                ....
              authc:
                basic_internal_auth_domain:
                  ....
                openid_auth_domain:
                  ...
```


## elasticsearch.yml
<!-- for https openid provider -->
```yml
opensearch_security.openid.base_redirect_url: "https://...."
opendistro_security.openid.root_ca: "/usr/share/kibana/config/root-ca.pem"
```
<!-- for self signed cert -->
```yml
opensearch-dashboards: 
  extraEnvs:
    - name: NODE_TLS_REJECT_UNAUTHORIZED
      value: "0"
```


## sso role mapping

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

## keytools
+ `bin/elasticsearch-keystore list`
+ `keytool -list -v -keystore keystore.jks` 查看keystore中内容

## tips

+ roles
    + kibana_user

+ `roles_key` use JWT roles

+ 循环跳转时
  + dashoard没有配置成功
    + secret不需要base64编码
  + master 的security没生效


+ OPENSEARCH_PATH_CONF
  + Set the OPENSEARCH_PATH_CONF environment variable to the directory that contains opensearch.yml (e.g. /etc/opensearch).
  + default `/usr/share/opensearch/config`
    + jvm.options
    + opensearch.yml



## issues

+ OPENSEARCH_JAVA_OPTS
  + `/usr/share/opensearch/config/jvm.options`
```yml
opensearch:
  opensearchJavaOpts: "-Xmx512M -Xms512M -Djdk.security.allowNonCaAnchor=true"
```
+ jdk.security.allowNonCaAnchor=true
  + If the property is set to the empty String or "true" (case-insensitive), trust anchor certificates can be used if they do not have proper CA extensions.
  + Note that the property does not apply to X.509 v1 certificates (since they don't support extensions).
  
## ref
<!-- kibana -->
+ [Read only mode](https://docs.search-guard.com/latest/kibana-read-only)
+ [Kibana OpenID Connect Authentication](https://docs.search-guard.com/latest/kibana-authentication-openid)
+ [Kibana - Session timeout [Solved]](https://forum.opensearch.org/t/kibana-session-timeout-solved/1220)

<!-- roles -->
+ [Open Distro  user and roles](https://opendistro.github.io/for-elasticsearch-docs/docs/security/access-control/users-roles/)

<!-- openid -->
+ [opensearch-project/security](https://github.com/opensearch-project/security)
+ [opensearch OpenID Connect](https://opensearch.org/docs/latest/security-plugin/configuration/openid-connect/)
+ [OpenID Connect troubleshooting](https://opensearch.org/docs/latest/troubleshoot/openid-connect/#set-log-level-to-debug)
+ [Configure elasticsearch for OpenID Connect authentication](https://www.elastic.co/guide/en/elasticsearch/reference/7.5/oidc-guide-authentication.html#oidc-guide-authentication)
+ [Secure your clusters with OpenID Connect](https://www.elastic.co/guide/en/cloud/current/ec-secure-clusters-oidc.html)

<!-- helm -->
+ [opensearch_dashboards.yml](https://github.com/opensearch-project/OpenSearch-Dashboards/blob/main/config/opensearch_dashboards.yml)



<!-- logs -->
+ [logs](https://opensearch.org/docs/latest/opensearch/logs/)

<!-- tls -->
+ [Setting up SSL with OpenID](https://forum.opensearch.org/t/setting-up-ssl-with-openid/3360)
+ [Configure TLS certificates](https://opensearch.org/docs/latest/security-plugin/configuration/tls/#keystore-and-truststore-files)

<!-- security -->
+ [opensearch.yml.example](https://github.com/opensearch-project/security/blob/main/securityconfig/opensearch.yml.example)
<!-- ******** -->
+ [OpenSearch Security 1](https://eliatra.com/blog/security-opensearch-concepts/)
+ [OpenSearch security part 2: Basic Setup](https://eliatra.com/blog/opensearch-security-part-2-basic-setup/)