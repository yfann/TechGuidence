


## issues

+ opensearch 开启 opendid 配置 keycloak https url时:
    + `<opensearch ip>/auth/openid/login?nextUrl=%2F 401`
        + reason:
            + dashboards-plugin中wreck.get("https://<keycloak ip>/auth/realms/China-OP/.well-known/openid-configuration")时返回`502 Client request error: unable to verify the first certificate`
                + `Client request error: unable to verify the first certificate`
                    + `await Wreck.get('https://.....',{ rejectUnauthorized: false });`
                        + TLS flag indicating whether the client should reject a response from a server with invalid certificates.
                    + solve: `export NODE_TLS_REJECT_UNAUTHORIZED='0'`

## ref
+ [opensearch-project/security](https://github.com/opensearch-project/security)
+ [security-dashboards-plugin](https://github.com/opensearch-project/security-dashboards-plugin)