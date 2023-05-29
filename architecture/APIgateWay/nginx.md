

## integration with OAuth2

要在Nginx中进行OAuth 2.0令牌认证，可以使用Nginx的ngx_http_auth_request_module模块结合OAuth 2.0授权服务器进行认证。

以下是一般的OAuth 2.0令牌认证过程：

1. 在Nginx配置中，使用auth_request指令将请求转发给OAuth 2.0授权服务器进行认证。
```nginx
location /api {
    auth_request /oauth/auth;
    ...
}
```
2. 配置auth_request指令中的认证请求地址，使其指向OAuth 2.0授权服务器的认证端点。例如：
```nginx
location = /oauth/auth {
    internal;
    proxy_pass http://oauth_server/auth;
    proxy_pass_request_body off;
    proxy_set_header Content-Length "";
    proxy_set_header X-Original-URI $request_uri;
}
```
这将将请求转发到http://oauth_server/auth进行认证，并将原始请求URI存储在X-Original-URI头部中。

3. OAuth 2.0授权服务器对令牌进行验证，并根据验证结果返回响应。

4. 根据OAuth 2.0授权服务器的响应，在Nginx中配置相应的行为。例如，可以使用error_page指令将未经授权的请求重定向到错误页面，或使用proxy_pass指令将请求转发到后端服务。

```nginx
error_page 401 = @oauth_error;

location @oauth_error {
    return 302 /error_page;
}

location /error_page {
    internal;
    proxy_pass http://backend_server/error_page;
}
```

## nginx pulgin
+ auth_jwt module
    + offline JWT validation

+ auth_request module
    + an API call to an IdP before proxying a request to the backend

## token introspection


## tips

+ authenticate API calls
    + X.509 client certificate
    + HTTP Basic authentication
    + OAuth 2.0 access token
        + types
            + JWT token
                + offline JWT validation
            + Opaque token
                + must be validated by sending them back to the IdP(Identity provider) that issued them
                + it can be revoked by the IdP
        + validate
            + it was indeed issued by a trusted IDP(identity provider)
                + IdPs cryptographically sign the JWTs they issue
            + not expired
+ IdP(Identity provider) 




## ref
<!-- auth -->
+ [Validating OAuth 2.0 Access Tokens with NGINX and NGINX Plus](https://www.nginx.com/blog/validating-oauth-2-0-access-tokens-nginx/)
+ [借助 JWT 和 NGINX Plus 验证 API 客户端身份](https://www.nginx-cn.net/blog/authenticating-api-clients-jwt-nginx-plus/)
+ [Nginx鉴权，验证token](https://zhuanlan.zhihu.com/p/530343073)

<!-- jwt -->
+ [Module ngx_http_auth_jwt_module](http://nginx.org/en/docs/http/ngx_http_auth_jwt_module.html)
+ [ngx_http_auth_jwt_module](https://docshome.gitbook.io/nginx-docs/he-xin-gong-neng/http/ngx_http_auth_jwt_module)
+ [github ngx-http-auth-jwt-module](https://github.com/TeslaGov/ngx-http-auth-jwt-module)
<!-- nginx plus -->
+ [借助 JWT 和 NGINX Plus 验证 API 客户端身份](https://www.nginx-cn.net/blog/authenticating-api-clients-jwt-nginx-plus/)