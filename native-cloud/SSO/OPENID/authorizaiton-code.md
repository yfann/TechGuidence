# authorization-code

+ 适用于有前后端的Web应用
    + 前端传输code
    + 后端保存token




## process

1. A ----> B(keycloak)
    + A向B请求auth_code
```code
https://b.com/oauth/authorize?
  response_type=code&
  client_id=CLIENT_ID&
  redirect_uri=CALLBACK_URL&
  scope=read
```
2. B会要求用户登录，询问是否同一授权给A
```code
https://a.com/callback?code=AUTHORIZATION_CODE
```

3. A前端把code传给后端，后端向B请求token
```code
https://b.com/oauth/token?
 client_id=CLIENT_ID&
 client_secret=CLIENT_SECRET&
 grant_type=authorization_code&
 code=AUTHORIZATION_CODE&
 redirect_uri=CALLBACK_URL
```


## ref
+ [OAuth 2.0 的四种方式](http://www.ruanyifeng.com/blog/2019/04/oauth-grant-types.html)