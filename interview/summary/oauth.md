

## OAuth
+ Resource Owner：用户
+ Client：你的应用（前端 / 后端）
+ Authorization Server：Keycloak
+ Resource Server：后端 API

### 1. code flow
```md
Client -> /authorize -> Keycloak
User login
Keycloak -> redirect with code
Client -> /token (code + client_secret) -> tokens
```
+ access token存在后端不发往浏览器
+ 给浏览器端发session id(session token)和后端access token一一对应
+ redirect url指向client

### 2. Authorization Code + PKCE（Proof Key for Code Exchange）
+ Authorization Code 的增强版，用于没有 client_secret 的客户端。
+ 额外步骤
    + 客户端先生成 code_verifier(随机字符串)
    + 发送 /authorize 时带 code_challenge（code_verifier hash）
        + keycloak 会记住code_challenge（code_verifier
    + code换 token 时再带 code_verifier
        + keycloak会比较code_challenge和code_verifier
+ 防止 code 被中间人截获后换 token
+ 现代前端 OAuth 标准做法。
    + SPA
    + 移动端

### 3. client credentials
```md
Client -> /token (client_id + secret)
Keycloak -> access_token
```
+ 机器对机器（M2M）
+ 没有用户，只有client身份
    + 没有登录过程
+ 用于后台服务
    + 没有用户

### 4. Device Authorization Flow
```md
(1) Device -> /device -> device_code + user_code  + verify_uri
(2) User 在手机/PC 打开 verify_uri 输入user_code，登录后 用户和device_code绑定
(3) Device 轮询 /token (device_code)
(4) 登录成功 -> access_token
```
+ 用于
    + 用户在无输入设备上登录
        + IoT


### 5. implicit
+ 直接返回access token,没有code和refresh token
+ 废弃

### 6. Resource Owner Password Credentials
```md
Client collects username/password
-> /token
```
+ 客户端直接接触用户密码
+ 破坏 OAuth 初衷


## OAuth 2.0 vs OpenID connect(OIDC)
+ 在OAuth 2.0基础上加了身份认证
    + ID Token(身份标识)
        + JWT
+ 在OAuth2.0基础上加了`scope=openid`


## JWT


## ref
+ [auth2](https://www.ruanyifeng.com/blog/2014/05/oauth_2_0.html)