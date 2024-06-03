
## openid-connect/auth
+ 展示登录页面
```js
http://localhost:8080/realms/{realm-name}/protocol/openid-connect/auth
?client_id=your-client-id
&response_type=code
&redirect_uri=http://localhost:8080/callback
&scope=openid%20profile%20email
&state=some-random-state
```


## tips
+ `http://{{host}}:{{port}}/realms/myrealm/protocol/openid-connect/userinfo`
    + 需要 `"scope": "openid profile email"` 才可以访问

## ref
+ [endpoints](https://www.keycloak.org/docs/latest/securing_apps/index.html#endpoints)

+ [keycloak restapi](https://documenter.getpostman.com/view/7294517/SzmfZHnd#20caddc9-5fb7-4f43-885c-fa62aa268b0e)

+ [](https://www.keycloak.org/docs-api/latest/rest-api/index.html#_key)

+ [AuthorizationEndpoint](https://openid.net/specs/openid-connect-core-1_0.html#AuthorizationEndpoint)