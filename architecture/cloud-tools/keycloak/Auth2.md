# Auth2.0
+ Resource owner
+ Resource server
+ client
+ Authorization server

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


## authorization-code
+ https://b.com/oauth/authorize?
  response_type=code&
  client_id=CLIENT_ID&
  redirect_uri=CALLBACK_URL&
  scope=read
    + 返回code
    + 浏览器redirect获取
+ https://a.com/callback?code=AUTHORIZATION_CODE&client_secret=CLIENT_SECRET
    + 用code换取access token(server端)

## implicit
+ https://b.com/oauth/authorize?
  response_type=token&
  client_id=CLIENT_ID&
  redirect_uri=CALLBACK_URL&
  scope=read
    + 直接返回token
        + https://a.com/callback#token=ACCESS_TOKEN
            + 浏览器跳转时，锚点不会发到服务器，就减少了泄漏令牌的风险。
+ 纯前端，无后端，省略获取code的过程

## password
+ https://oauth.b.com/token?
  grant_type=password&
  username=USERNAME&
  password=PASSWORD&
  client_id=CLIENT_ID

+ 因为直接给了用户名密码，无需跳转，直接返回access token
    + 这种方式需要用户给出自己的用户名/密码，显然风险很大，因此只适用于其他授权方式都无法采用的情况，而且必须是用户高度信任的应用。

## client credentials
+ https://oauth.b.com/token?
  grant_type=client_credentials&
  client_id=CLIENT_ID&
  client_secret=CLIENT_SECRET
    + 通过后直接返回令牌

+ 这种方式给出的令牌，是针对第三方应用的，而不是针对用户的，即有可能多个用户共享同一个令牌。

## device flow


## refresh token
+ 更新令牌
    + https://b.com/oauth/token?grant_type=refresh_token&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&refresh_token=REFRESH_TOKEN


## tips
+ token vs password
    + token短期，到期自动失效，用户无法修改
    + token可以被撤销
    + token有scope


+ Kerberos
    + Kerberos 是一个网络认证协议，用于实现身份验证服务，最初由麻省理工学院 (MIT) 开发。它为网络中的实体（通常是计算机或用户）提供了安全的身份验证机制，以确保通信双方的身份是可信的。
    + 当用户想要访问网络资源时，它首先向 AS 发送认证请求。
        + AS 将验证用户身份，并向用户返回一个加密的票据（Ticket），该票据可用于向 TGS 发送进一步的请求。
            + 用户使用票据请求 TGS 以获取针对特定服务的服务票据（Service Ticket）。服务票据允许用户访问请求的服务，而无需再次提供凭据。
    + 优点：
        + 强大的身份验证：Kerberos 使用加密票据而不是明文密码进行身份验证，从而提供更高的安全性。
        + 单一登录：用户在通过 Kerberos 认证后，可以访问网络中的多个服务而无需重复认证。
        + 适用于分布式环境：Kerberos 是一种分布式认证协议，适用于多个计算机和服务之间的安全通信。

+ JSON Web Signature (JWS)
    + token内容是透明的（不加密）
    + digital signature
        + 用于验证是否是keycloak发出的
        + the backend can both verify the token and read the contents without a request to Keycloak
            + The backend retrieves Keycloak's public keys

+ PKCE(Proof Key for Code Exchange)
    + extension to the OAuth 2.0 
    + 授权码拦截攻击
        + 授权服务器携带授权码code返回到客户端的回调地址时， 有可能不受TLS 的保护
        + 正常request时是会受tls保护的，code_challenge不会被窃取
    + 在向授权服务器的 authorize endpoint 请求时，需要额外的 code_challenge 和 code_challenge_method 参数， 向 token endpoint 请求时， 需要额外的 code_verifier 参数， 最后授权服务器会对这三个参数进行对比验证， 通过后颁发令牌。
        + client建立code_verifier
        + code_challenge == code_challenge_method(code_verifier)
            + code_challenge_method
                + plain(原始值)
                + S256


## ref
+ [OAuth 2.0 的四种方式](https://www.ruanyifeng.com/blog/2019/04/oauth-grant-types.html)
+ [GitHub OAuth 第三方登录示例教程](https://www.ruanyifeng.com/blog/2019/04/github-oauth.html)
+ [device flow](https://www.oauth.com/oauth2-servers/device-flow/)

+ [PKCE](https://www.cnblogs.com/myshowtime/p/15555538.html)