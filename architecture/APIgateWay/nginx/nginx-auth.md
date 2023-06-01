## HTTP Basic Authentication

1. 基于 HTTP Basic Authentication（基本认证）：
HTTP Basic Authentication 使用用户名和密码进行鉴权。可以通过配置 Nginx 的 auth_basic 和 auth_basic_user_file 指令来实现。

示例配置：

```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        auth_basic "Restricted Access";
        auth_basic_user_file /path/to/htpasswd;
        proxy_pass http://backend_service;
    }
}
```
解释：
+ auth_basic "Restricted Access"; 设置认证提示信息为 "Restricted Access"，这将显示在要求用户输入用户名和密码的对话框中。
+ auth_basic_user_file /path/to/htpasswd; 指定包含用户名和密码的文件的路径。该文件可以使用 htpasswd 命令生成。


2. 基于 HTTP Authorization（授权头）：
使用授权头进行鉴权可以根据自定义的逻辑进行鉴权验证。可以通过配置 Nginx 的 auth_request 指令来实现，它将请求转发给其他服务进行验证。

示例配置：

```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        auth_request /auth;
        proxy_pass http://backend_service;
    }

    location = /auth {
        internal;
        proxy_pass http://auth_service;
        proxy_pass_request_body off;
        proxy_set_header Content-Length "";
        proxy_set_header X-Original-URI $request_uri;
    }
}
```
解释：

+ auth_request /auth; 配置将请求转发给 /auth 路径进行鉴权。
+ location = /auth { ... } 定义了 /auth 路径的配置，指定将请求转发给 auth_service 进行鉴权。
+ proxy_pass_request_body off; 禁用请求体的传递。
+ proxy_set_header Content-Length ""; 设置请求头中的 Content-Length 为空，以确保请求体不会被传递。
+ proxy_set_header X-Original-URI $request_uri; 设置 X-Original-URI 请求头，将原始的请求 URI 传递给 auth_service。

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

## nginx 基于JWT 中的role授权
要根据 JWT Token 中的角色进行授权，可以结合 Nginx 的 ngx_http_auth_jwt_module 模块和自定义 Nginx 配置来实现。
以下是一个基本的示例配置：

1. 安装 ngx_http_auth_jwt_module 模块：
首先，需要确保 Nginx 已安装并编译了 ngx_http_auth_jwt_module 模块。可以通过在编译 Nginx 时包含该模块或使用第三方 Nginx 包来实现。

2. 配置示例：

```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        auth_jwt "Restricted Area";
        auth_jwt_key_file /path/to/public_key.pem;
        auth_jwt_alg RS256;
        auth_jwt_claim_set $jwt_roles roles;

        # 角色授权
        if ($jwt_roles ~* "admin") {
            # 允许管理员角色访问
            proxy_pass http://backend_service_admin;
        }
        if ($jwt_roles ~* "user") {
            # 允许用户角色访问
            proxy_pass http://backend_service_user;
        }
        # 其他角色或无角色的拒绝访问
        return 403;
    }
}
```
解释：

+ auth_jwt "Restricted Area"; 设置 JWT 鉴权的提示信息为 "Restricted Area"，这将显示在要求用户提供 JWT Token 的对话框中。
+ auth_jwt_key_file /path/to/public_key.pem; 指定包含公钥的 PEM 文件的路径，用于验证 JWT 的签名。
+ auth_jwt_alg RS256; 指定 JWT 的签名算法，此处使用 RS256。
+ auth_jwt_claim_set $jwt_roles roles; 定义了将 JWT 中的 roles 声明设置到 $jwt_roles 变量中，用于后续的角色授权判断。
+ if ($jwt_roles ~* "admin") { ... } 和 if ($jwt_roles ~* "user") { ... } 是基于 $jwt_roles 变量进行的角色授权判断。根据具体需求，可以添加更多的角色授权条件。

3. 判断JWT是否过期
```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        auth_jwt "Restricted Area";
        auth_jwt_key_file /path/to/public_key.pem;
        auth_jwt_alg RS256;
        auth_jwt_claim_set $jwt_exp exp;

        # 验证 Token 是否过期
        if ($jwt_exp < $date_gmt) {
            return 401;
        }

        # 其他配置和代理规则
        proxy_pass http://backend_service;
    }
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
+ [NGINX JWT Module](https://nginx-extras.getpagespeed.com/modules/jwt/)

<!-- nginx plus -->
+ [借助 JWT 和 NGINX Plus 验证 API 客户端身份](https://www.nginx-cn.net/blog/authenticating-api-clients-jwt-nginx-plus/)