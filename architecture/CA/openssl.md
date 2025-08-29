
## CA
+ `openssl genrsa -out root.key 4096`
+ `openssl req -new -x509 -days 1000 -key root.key -out root.crt`
+ `openssl x509 -text -in root.crt -noout` 验证root ca


## cmd
+ `openssl help`
+ `openssl x509 -in <cert file path>  -noout -subject -issuer -fingerprint`
## ref
+ [OpenSSL 常用命令](https://iguoli.github.io/2018/07/27/Openssl-Commands.html)
+ [openssl-req](https://www.openssl.org/docs/manmaster/man1/openssl-req.html)
+ [OpenSSL命令详解（一）——标准命令](https://blog.csdn.net/scuyxi/article/details/54884976)
+ [openssl commands](https://www.openssl.org/docs/man1.1.1/man1/)