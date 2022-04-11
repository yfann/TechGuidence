
# OpenID Connect

+ SAML
    + XML

## OpenID connect(OIDC)
+ 用于单点登录和身份管理
+ 在OAuth2的基础上加了身份验证(authentication)
    + 底层授权用OAuth

+ ID Token（用户身份信息,JWT）
    + client通过OPenID provider的Auth2认证终端，得到ID Token
    + 可以被服务端验证，可以作为无状态session
    + 和 OpenID provider交换access token
    + 含有签名，防止篡改，可以直接身份验证(无需再找authorization server验证)

+ userinfo endpoint
    + 可以获取用户信息
+ 提供RESTful HTTP API
    + JSON

## OAuth
+ 主要是用户委派授权（authorization）
    + 因为OAuth用的是Client ID 而不是User ID
    + OAuth协议中没有针对user的信息
        + Oauth不在意who
+ 可以简单身份验证（authentication）
+ 可以SSO 验证
<!-- OAuth modes -->
+ authorization code mode（code换token）
    + back channel(安全的)
        + access token只存在于后端
    + Front channel(浏览器)
        + 存放authorization code,query中附带

+ implicit mode
    + 没有后端服务器，纯前端，直接返回access token
        + Single page app

+ resource owner password credentials mode（back channel only）
    + 为了向前兼容

+ client credentials mode （back channel only）
    +  machine 和machine或者services之间的通信

## tips

+ public key 验证 JWT

## ref
+ [OAuth 2.0 和 OpenID Connect 的基本原理和区别（干货）](https://blog.csdn.net/qq_24550639/article/details/111089296)
+ [SSO的通用标准OpenID Connect](https://developer.aliyun.com/article/780006)
+ [安全声明标记语言SAML2.0初探](https://developer.aliyun.com/article/779947?spm=a2c6h.12873581.0.dArticle779947.a569733brFatso)
+ [Help! I’m Stuck in a Redirect Loop!](https://www.scottbrady91.com/openid-connect/help-im-stuck-in-a-redirect-loop)