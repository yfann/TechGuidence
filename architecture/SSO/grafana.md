
## grafana.ini
<!-- /etc/grafana/grafana.ini -->
```ini
[auth.generic_oauth]
enabled = true
scopes = openid email profile
name = Keycloak
tls_skip_verify_insecure = true
allow_sign_up = true
client_id = grafana
client_secret = eCBRaVhRtrmcHjjGjcS1ZFilMki6ZLR4
auth_url = https://xxxxxx/auth/realms/China-OP/protocol/openid-connect/auth
token_url = https://xxxxx/auth/realms/China-OP/protocol/openid-connect/token
api_url = https://xxxxxxx/auth/realms/China-OP/protocol/openid-connect/userinfo
[server]
root_url=http://xxxxxxx:3000
```

## role mapping
```ini

; role_attribute_path = role


; {
;     ...
;     "role": "Admin",
;     ...
; }
```


## tips

+ root_url
    + e.g. root_url = http://localhost:3000/grafana, Grafana is accessible on http://localhost:3000/grafana

+ grafana role
    + Viewer, Editor or Admin

## ref
<!-- oauth -->
+ [grafana oauth config](https://grafana.com/docs/grafana/latest/auth/generic-oauth/)
+ [Keycloak Integration with Grafana](https://docs.expertflow.com/chat/3.18/hybrid-chat-deployment/prometheus-grafana-deployment/keycloak-integration-with-grafana)
+ [OAuth2对接grafana最佳实践](https://help.aliyun.com/document_detail/194196.html)
<!-- others -->
+ [grafana Configuration](https://grafana.com/docs/grafana/latest/administration/configuration/)
+ [role_attribute_path](https://grafana.com/docs/grafana/latest/auth/generic-oauth/#role-mapping)
+ [jmespath](https://jmespath.org/)