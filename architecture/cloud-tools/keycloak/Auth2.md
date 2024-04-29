# Auth2.0
+ Resource owner
+ Resource server
+ client
+ Authorization server

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
+ no data entry required on the device!
  + 扫码登录
+ client_id=a17c21ed
  + device 向认证服务器发请求获取device code和url
+ device 通过发请求(device code)到认证服务器获取access token
  + 间隔请求直到获取token，或错误
+ user用其他设备打开url，输入认证信息和device code完成认证

## refresh token
+ 更新令牌
    + https://b.com/oauth/token?grant_type=refresh_token&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&refresh_token=REFRESH_TOKEN


## tips
+ token vs password
    + token短期，到期自动失效，用户无法修改
    + token可以被撤销
    + token有scope



## ref
+ [OAuth 2.0 的四种方式](https://www.ruanyifeng.com/blog/2019/04/oauth-grant-types.html)
+ [GitHub OAuth 第三方登录示例教程](https://www.ruanyifeng.com/blog/2019/04/github-oauth.html)
+ [OAuth for Browserless and Input-Constrained Devices](https://www.oauth.com/oauth2-servers/device-flow/)