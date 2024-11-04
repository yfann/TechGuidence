# JWT
+ Header.Payload.Signature

```json
{
  "header": {
    "alg": "HS256",
    "typ": "JWT"
  },
  "payload": {
    "sub": "1234567890",
    "name": "John Doe",
    "iat": 1622782384
  },
  "signature": "HMACSHA256(base64UrlEncode(header) + '.' + base64UrlEncode(payload), secretKey)"
}
```

## sub
+ 

## claims
+ iss(Issuer)
    + 令牌发行者

+ sub（subject/主题)
    + JWT所针对的主体或用户
    + 一般唯一标识,UserId

+ aud(Audience)
    + 预期接收令牌的一方

+ exp(Expiration Time)
    + 过期时间

+ nbf(not before)
    + 令牌的生效时间

+ iat(Issued At)
    + JWT签发时间

+ jti(JWT ID)
    + JWT唯一标识
    + 防止重放攻击

## tips
+ JWT可以认证或交换信息
+ 跨域认证
    + 一个公司有两个域名，一个登陆后另一个也自动登陆
+ 无状态(不用session)
+ JWT默认不加密
+ JWT带有signature，防止篡改
+ JWT:header,Payload,signature
+ Base64URL串行化JWT,JWT可能会放在url中
+ client每次请求都带上JWT
    + header: Authorization: Bearer <jwt token>
+ JWT一旦签发，过期之前都有效
    + 中间不能废弃和更改权限
+ 推荐HTTPS传输JWT

## ref
+ [JWT](http://www.ruanyifeng.com/blog/2018/07/json_web_token-tutorial.html)

+ [auth0 JWT](https://auth0.com/docs/secure/tokens/json-web-tokens/json-web-token-claims)