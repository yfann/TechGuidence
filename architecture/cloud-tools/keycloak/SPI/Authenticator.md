# Authenticator
+ CredentialValidators
    + CredentialProvider
        + 创建存储凭证
        + CredentialInput -> UserCredentialModel
    + CredentialInputValidator
        + 验证凭证
        + isValid()
            + ests whether a credential is valid for a given user in a given realm

+ Authenticator
    + authenticate()
        + Initial call for the authenticator
    + action()
        +  Called from a form action invocation.

## AuthenticationFlowContext 
+ success()
+ form()


## Authentication flow
+ flow is initiated
    + OpenID/SAML creates AuthenticationSessionModel
+ flow is complete
    + authentication processor creates UserSessionModel and associates it with the AuthenticationSessionModel


## template
+ jar包中资源的位置 
    + theme-resources/templates
    + theme-resources/resources
    + theme-resources/messages
+ `${properties.someValue}`
    +  theme.properties文件中有定义

+ `${msg("someValue")}`
    + 多语言(.properties files)
    

## ref
+ [Authentication SPI](https://www.keycloak.org/docs/latest/server_development/#_auth_spi)