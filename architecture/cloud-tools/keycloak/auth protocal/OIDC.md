# OpenID Connect(OIDC)
+ 在OAuth 2.0基础上加了身份认证
    + ID Token(身份标识)
        + JWT

+ 在OAuth2.0基础上加了`scope=openid`

## flows
+ Authorization Code flow
    + 和OAuth2.0相同，但返回三个tokens
        + ID token
        + access token
        + refresh token

+ Hybrid flow
    + ID token和authorization code在第一步一起返回

+ implicit flow

+ 没有Client Credential flow和 the Device flow
    + 这俩个flow没有user参与


## tokens
+ ID token
    + 透明
    + 包含values(claims)

+ access token
    + 不透明
    + verify access token
        + Retrieving the JWKS URL from the OpenID Connect Discovery endpoint.
        + Downloading the public signing keys for the OpenID Provider from the JWKS URL endpoint. These are typically cached/stored at the Resource Server.
        + Verifying the signature of the token using the public signing keys from the OpenID Provider.


## ref
+ [Authenticating Users with OpenID Connect](https://learning.oreilly.com/library/view/keycloak-identity/9781800562493/B16606_04_Final_ASB_ePub.xhtml)