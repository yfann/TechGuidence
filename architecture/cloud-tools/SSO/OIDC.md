
# OpenID Connect

+ OAuth2
    + authorazation

+ OIDC
    + 在OAuth2的基础上加了authentication
        + 兼容Auth2
    + 基于JWT
        + client通过OPenID provider的Auth2认证终端，得到ID Token
        + ID Token（用户身份信息）
            + 可以被服务端验证，可以作为无状态session
            + 和 OpenID provider交换access token

    + 用于单点登录和身份管理
    + 提供RESTful HTTP API
        + JSON

+ SAML
    + XML


## ref
+ [SSO的通用标准OpenID Connect](https://developer.aliyun.com/article/780006)
+ [安全声明标记语言SAML2.0初探](https://developer.aliyun.com/article/779947?spm=a2c6h.12873581.0.dArticle779947.a569733brFatso)