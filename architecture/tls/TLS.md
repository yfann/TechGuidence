## tips

+ SSL（Secure Socket Layer）
    + TLS的前身
+ TLS (Transport Layer Security)

+ CA(certificate authority)
    + Digital Certificate
        + CA机构用自己的private key对 他人的public key，以及其他信息加密
        + 用户用CA 的 public key 得到证书中的public key，防止public key被冒用

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

+ 数字签名
    + 对内容hash后，用private key加密，随内容一起发送

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
<!-- crt to pem -->
+ `openssl x509 -in mycert.crt -out mycert.pem -outform PEM`
<!-- pem to crt -->
+ `openssl x509 -outform der -in your-cert.pem -out your-cert.crt`??
## tips

+ files
    + `server.key`: a private RSA key to sign and authenticate the public key
    + `server.pem/server.crt`: self-signed X.509 public keys for distribution
    + `rootca.crt`: a certificate authority public key for signing .csr files
    + `host.csr`: a certificate signing request to access the CA
    + `ca-root`: 根证书
        + 根证书是CA认证中心给自己颁发的证书,是信任链的起始点。安装根证书意味着对这个CA认证中心的信任。
    + `*.cert` 是证书
        + `-----BEGIN CERTIFICATE-----`    
    + `*.key` 私钥
        + `-----BEGIN RSA PRIVATE KEY-----`
    + `*.crt` 证书
    + `*.pem` 由RFC1421至1424定义的一种数据格式
        + 里面可能是cert or key or both
    

+ keystore
+ truststore

## issues
+ `x509: cannot validate certificate for <ipaddress> because it doesn't contain any IP SANs`

+ `Client request error: unable to verify the first certificate`


+ `curl: (60) SSL certificate problem: unable to get local issuer certificate`
+ `curl: (60) SSL certificate problem: self signed certificate`








## ref
<!-- 数字签名 -->
+ [数字签名是什么](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
+ [数字签名,数字证书,https](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
+ [digital signature](http://www.youdzone.com/signature.html)
+ [什么是数字签名和证书？](https://www.jianshu.com/p/9db57e761255)

<!-- 证书 -->
+ [如何创建自签名的 SSL 证书](https://www.jianshu.com/p/e5f46dcf4664)
+ [什么是CSR文件](https://www.jianshu.com/p/66d84ca65f41)
+ [数字证书中主题(Subject)中字段的含义](https://blog.csdn.net/baidu_36649389/article/details/78115638)
+ [客户端证书与服务端证书](https://skypacer210.github.io/2015/04/08/client-certificate-vs-server-certificate/)
+ [Secure gRPC with TLS/SSL](https://bbengfort.github.io/2017/03/secure-grpc/)
<!-- 加密算法 -->
+ [RSA算法原理](http://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html)

<!-- others -->
+ [SSL Certificate Verification](https://curl.se/docs/sslcerts.html)
+ [SSL：证书文件](https://zhuanlan.zhihu.com/p/86926335)