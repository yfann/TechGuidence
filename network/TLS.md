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

+ RSA
    + 非对称加密算法 
    + 1024位，2048位

##  cmd
<!-- 生成私钥 -->
+ ` openssl genrsa  -out server.key 1024`
    + `-des3` 私钥密码
<!-- 生成CSR -->
+ `openssl req -new -key server.key -out server.csr`
<!-- 自签名CSR 生成证书crt-->
+ `openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt`
<!-- 生成私钥和自签名证书 -->
+ `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${KEY_FILE} -out ${CERT_FILE} -subj "/CN=${HOST}/O=${HOST}"`

## ref
<!-- 数字签名 -->
+ [数字签名是什么](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
+ [数字签名,数字证书,https](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
+ [digital signature](http://www.youdzone.com/signature.html)
+ [什么是数字签名和证书？](https://www.jianshu.com/p/9db57e761255)
<!-- 证书 -->
+ [如何创建自签名的 SSL 证书](https://www.jianshu.com/p/e5f46dcf4664)
+ [什么是CSR文件](https://www.jianshu.com/p/66d84ca65f41)

<!-- 加密算法 -->
+ [RSA算法原理](http://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html)