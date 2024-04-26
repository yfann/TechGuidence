# keycloak

+ realm
    + 类似于tenant
    + 资源隔离

## Identity Brokering 
+ log in through a social provider
    + Facebook
    + Google

+ client-initiated account linking
    + link existing accounts to a brokered IDP




## tips
+ OpenID/SAML
+ Identity Provider(IDP)
    + 通常用于SSO
    + 外部IDP
        + LDAP
        + Active Directory
        + SAML 2.0
+ OTP（one-time password

+ CIBA(Client Initiated Backchannel Authentication)
    + OAuth2.0的扩展
    + 它旨在解决传统 OAuth 2.0 流程中的一些限制，特别是针对移动设备或不支持浏览器重定向的设备的认证场景
        + 客户端应用程序向认证服务器发起认证请求，认证服务器将认证结果通过后台通道直接发送给客户端应用程序。
    + 优点：
        + 支持无浏览器环境下的认证流程，如智能手机的锁屏状态。
        + 支持多种认证方法，包括 OTP（一次性密码）、指纹识别、生物特征识别等。
        + 减少了用户参与的交互步骤，提高了用户体验。

+ Key Distribution Center，KDC
    + 认证服务器（Authentication Server，AS）
    + 票据授予服务（Ticket Granting Service，TGS）

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
## ref
+ [Keycloak Quickstarts](https://github.com/keycloak/keycloak-quickstarts)
+ [Keycloak Documentation](https://www.keycloak.org/documentation.html)
<!-- keycloak使用 -->
+ [Keycloak搭建手把手操作指南](https://github.com/eacdy/spring-cloud-yes/blob/master/doc/keycloak-learn/Keycloak%E6%90%AD%E5%BB%BA%E6%89%8B%E6%8A%8A%E6%89%8B%E6%93%8D%E4%BD%9C%E6%8C%87%E5%8D%97.md)
<!-- details -->
+ [Securing Applications and Services Guide](https://www.keycloak.org/docs/latest/securing_apps/index.html#openid-connect-3)
<!-- book -->
+ [《Keycloak - Identity and Access Management for Modern Applications》](https://learning.oreilly.com/library/view/keycloak-identity/9781800562493/B16606_01_Final_ASB_ePub.xhtml#_idParaDest-17)