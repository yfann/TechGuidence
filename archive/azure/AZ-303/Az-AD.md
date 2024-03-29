# Az Active directory

+ multi-tenant cloud-based directory

+ SSO to SaaS

## define users

+ Cloud identities
    + 存在于Az AD中

+ Directory-synchronized identites
    + on-premises中的windows server AD

+ Guset users
    + outside Az
        + Miscrosoft account(Xbox)

## Az AD Connect


+ AD to Az AD

+ AD DS Enterprise Administrator
    + configure on-premise AD
    + only used during installation
+ Az AD Global Administrator
    + used during the installation

## Multiple tenant

+ user who creats a new tenant
    + the user is global admin role for that tenant

+ tenant之间同步
    + Az AD connect
        + single AD forest
    + Az Active tenant Connector
        + one or more on-premise forests
        + non Az AD data resources
+ tenant 不是 Az subscription的子资源


## Domains 

+ verifying Custom domain names


## Az Multi-Factor Authentication

+ sign-in event

+ something you know

+ something you have

+ something your are
    + fingerprint
    + face

## tips
+ Az tenant
    + represent a single organization

+ Az AD directory
    + 每个Az tenant都有一个 Az AD directory
    + 包含了tenant中的user,group,apps...



+ Active Directory domain
+ AD DS
    + Active Directory Domain Services
+ Synchronization Rules editor(GUI)
+ UPN
    + user principal name

+ Az AD Join
    + SSO

+ new device under Az AD
    + registering
    + Joining

+ Az service principals
    + proxy account
    + each principal for each tenant 
    + grant access to resources under the tenant

+ Az B2B
    + Az AD is not required
        + partner use their own identities

+ Az B2C
    + social login
    + Standards-based authentication
        + Open ID
        + OAuth2.0

+ MFA
    + 所知
    + 所持
        + 手机
    + 身份信息
        + 指纹

+ Active Directory Federation Services
    + a feature and web service in the Windows Server Operating System that allows sharing of identity information outside a company’s network.

+ Azure AD Privileged Identity Management(PIM)
    + manage who,what,when,where,why for resources

+ Roles
    + Contributor

+ Access control(IAM)
    + 设置访问权限RBAC

+ managed identity
    + 开启Az AD
