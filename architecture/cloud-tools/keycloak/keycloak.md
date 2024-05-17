# keycloak

## realm
+ 类似于tenant
+ 资源隔离





## User
+ 添加Attribute
    + Realm settings->User profile->Create attribute
    + 通过在Client scope中添加Mapper可以使attribute出现在Token中


## Identity Brokering 
+ log in through a social provider
    + Facebook
    + Google

+ client-initiated account linking
    + link existing accounts to a brokered IDP


## tokens
+ id token
+ access token
+ refresh token

## tips


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


## ref

+ [Keycloak Documentation](https://www.keycloak.org/documentation.html)
+ [server admin](https://www.keycloak.org/docs/latest/server_admin/#user-profile)



<!-- book -->
+ [《Keycloak - Identity and Access Management for Modern Applications》](https://learning.oreilly.com/library/view/keycloak-identity/9781800562493/B16606_01_Final_ASB_ePub.xhtml#_idParaDest-17)

<!-- detials -->
+ [Custom Attribute in Keycloak Access Token](https://medium.com/@ramanamuttana/custom-attribute-in-keycloak-access-token-831b4be7384a)

<!-- examples -->
+ [Keycloak Quickstarts](https://github.com/keycloak/keycloak-quickstarts)