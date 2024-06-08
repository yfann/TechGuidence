# WebAuthn
+ 由万维网联盟（W3C）和FIDO联盟（Fast IDentity Online）联合制定的一项标准，旨在为基于网页的身份验证提供一种强大、安全且用户友好的机制。它使得网站可以通过公钥加密技术来验证用户的身份，从而减少对传统的密码系统的依赖，提高整体的安全性。

+ 场景
     + 无密码登录：通过 WebAuthn，用户可以使用生物识别或安全密钥直接登录，无需输入密码。
     + 双因素认证（2FA）：WebAuthn 可以作为一种更安全的二次验证方式，替代基于 SMS 或应用程序的二次认证。
     + 提高应用安全性：各种 Web 应用和服务都可以通过集成 WebAuthn 来提高其安全性，减少账户被盗的风险。

+ Relying Party 依赖方 (RP) ：指服务提供方，即网站

## FIDO2 
+ WebAuthn
    + 负责浏览器与访客设备
+ CTAP（Client to Authenticator Protocol）
    + 访客设备与认证设备之间的通信


##  Credential Management API 
+ `navigator.credentials.create()`
    + 请求认证器生成公私钥对
+ `navigator.credentials.get()`
    + 获取公钥


## 验证认证器
+ 如果用户在使用伪造的或是自制的认证器，认证器的安全性就得不到保证
+ `navigator.credentials.create()`
    + attestation非none

+ attestation
    + Basic attestation
        + 认证器用私钥签名
    + Self Attestation
        + 用凭证私钥签名
    + Attestation CA
    + ECDAA

## tips
+ webauthn只能在安全的上下文中使用
    + https
    + localhost
+ 认证器(usb key)通常会为每个依赖方和用户的组合都创建一对公私钥
    + 计算出来的无限公钥
+ Trust On First Use (TOFU) 
## ref
+ [webauthn api](https://webauthn.guide/#webauthn-api)
+ [谈谈 WebAuthn](https://flyhigher.top/develop/2160.html)
+ [Sign-in on the Web — Credential Management API and Best Practices](https://medium.com/dev-channel/sign-in-on-the-web-credential-management-api-and-best-practices-d21aed14b6fe)
