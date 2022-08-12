


## issues

+ opensearch 开启 opendid 配置 keycloak https url时:
    + `<opensearch ip>/auth/openid/login?nextUrl=%2F 401`
        + reason:
            + dashboards-plugin中wreck.get("https://<keycloak ip>/auth/realms/China-OP/.well-known/openid-configuration")时返回`502 Client request error: unable to verify the first certificate`

## ref
+ [opensearch-project/security](https://github.com/opensearch-project/security)
+ [security-dashboards-plugin](https://github.com/opensearch-project/security-dashboards-plugin)