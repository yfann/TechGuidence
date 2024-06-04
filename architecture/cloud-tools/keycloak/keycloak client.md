# keycloak client

## Client setting
+ client type
    + OpenID Connect
        + Allows client to verify the identity of the Enc-user based on the authentication performed by an Authorization server.
    + SAML
        + Enables web-based authentication and authorization scenarios including crossdomain SSO and uses security tokens containing assertions to pass information.

<!-- OpenID connect client -->
+ Valid redirect URIs
    + 验证要跳转的链接防止恶意攻击

+ Web origins
    + 设置跨域

+ Consent Required
    + 弹出窗口让用户授权

+ Client authentication
    + on 
        + 对应confidential client
        + 可以进一步选择Credentials->Client Authenticator
    + off
        + 对应public client

<!-- SAML client -->
+ Client signature required
    + client sign xaml request
    + keycloak 配置client public key做验证


## client
+ 客户端是否有能力维护自己的机密性凭据 client_secret。
  + confidential client
      + 前端只是获取授权码code， 通过 code 换取access_token 这一步是在后端的api完成的， 由于是内部的服务器， 客户端有能力维护密码或者密钥信息， 这种是机密的的客户端。
      + client_secret可以被安全保存
      + Authorization Code
  + public client
      + 客户端本身没有能力保存密钥信息， 比如桌面软件， 手机App， 单页面程序(SPA)， 因为这些应用是发布出去的， 实际上也就没有安全可言， 恶意攻击者可以通过反编译等手段查看到客户端的密钥， 这种是公开的客户端。
      + 不能用client_secret，会丢失
      + Implicit 


+  Client authentication（The client needs to send backchannel request (for example, to exchange code for the token, or to refresh the token)）: 
    + client ID and client secret
        + client needs to config a secret
        + secret配置在client的keycloak.json
    + client authentication with signed JWT(Signed JWT)
        + The client must have the private key and certificate
            + keystore file存储
        + keycloak 会通过client暴露的url(http://myhost.com/myapp/k_jwks)获取public key
        + During authentication, the client generates a JWT token and signs it with its private key and sends it to Keycloak in the particular backchannel request (for example, code-to-token request) in the client_assertion parameter.
        + keycloak 验证jwt
    + client authentication with signed JWT using client secret.
        + 过程类似于Signed JWT，用client secret代替private key和certificate
        + secret配置在client的keycloak.json