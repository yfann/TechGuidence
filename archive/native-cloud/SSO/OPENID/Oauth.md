
## auth2
+ 授权机制
+ token（令牌）
    - 短期，会自动失效
    - 可被撤销
    - 有权限范围(scope)

## 四种方式
+ 授权码（authorization-code）
    - 现获取授权码再获取令牌
    - 安全性最高
    - 授权码在前端，令牌保存在后端
    - 有回调
+ 隐藏式（implicit）
    - 适合纯前端无后端的应用
    - 有回调（令牌传递位置是锚点fragment,不是querystring,防止中间人攻击,锚点不会发到后端）
+ 密码式（password）
    - 直接username,pwd
    - 不跳转
+ 客户端凭证（client credentials）


## keywords
+ digital signature
+ digital certificate
+ certificate authority(CA)
+ public/private key

## ref
<!-- auth2 -->
+ [理解OAuth 2.0](http://www.ruanyifeng.com/blog/2014/05/oauth_2_0.html)
+ [OAuth 2.0 的一个简单解释](http://www.ruanyifeng.com/blog/2019/04/oauth_design.html)
+ [OAuth 2.0 的四种方式](http://www.ruanyifeng.com/blog/2019/04/oauth-grant-types.html)
+ [GitHub OAuth 第三方登录示例教程](http://www.ruanyifeng.com/blog/2019/04/github-oauth.html)
<!-- other -->
+ [OpenId](https://www.biaodianfu.com/learn-openid.html)
[Ref](http://self-issued.info/docs/draft-ietf-oauth-v2-bearer.html#toc)