## tips

+ SSL（Secure Socket Layer）
    + TLS的前身
+ TLS (Transport Layer Security)

+ certificate authority，简称CA
    + Digital Certificate

+ 自签名证书
    + 不通过CA签发
    + 不能吊销
    + 一般会报错：signing certificate authority is unknown and not trusted

+ 私有CA
    + 用自签名证书签名自签名证书

+ CSR (Certificate Signing Request)
    + 证书签名请求
    + 用于向CA申请证书
    + 也可自签名

##  cmd
<!-- 生成私钥 -->
<!-- 需要删除 Passphrase -->
+ ` openssl genrsa  -out server.key 1024`
    + `-des3` 私钥密码
<!-- 生成CSR -->
+ `openssl req -new -key server.key -out server.csr`
<!-- 自签名CSR -->
+ `openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt`

## ref
<!-- 数字签名 -->
+ [数字签名是什么](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
+ [数字签名,数字证书,https](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
+ [digital signature](http://www.youdzone.com/signature.html)
+ [什么是数字签名和证书？](https://www.jianshu.com/p/9db57e761255)

+ [如何创建自签名的 SSL 证书](https://www.jianshu.com/p/e5f46dcf4664)
+ [什么是CSR文件](https://www.jianshu.com/p/66d84ca65f41)