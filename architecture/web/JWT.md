# JWT


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