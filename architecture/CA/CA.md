## CA
+ Catificate Authority


## openSSL
+ CAserial
    + 每张 X.509 证书都必须有一个唯一的 序列号 (serial number)
    + 这个号用于区分不同的证书、支持吊销、追踪签发记录。
    + openssl x509 -req 签发，CA 需要为每张新证书生成一个唯一的序列号




## tips
+ 如果使用的证书没有签证，或者未在浏览器受信的 CA 签证
    + `NET::ERR_CERT_AUTHORITY_INVALID`
+ 注册的是localhost,访问的是127.0.0.1
    + `NET::ERR_CERT_COMMON_NAME_INVALID`
## ref
+ [细说 CA 和证书](https://www.barretlee.com/blog/2016/04/24/detail-about-ca-and-certs/)
