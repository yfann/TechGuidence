

## flow


     ┌────────────┐              ┌───────────┐
     │ rootCA.key ├──────────────►rootCA.crt ├────────────────────────────────────────────┐
     └────────────┘              └───────────┘                                            │
                                                                                          │
                                                                                          │
           ┌────────────┐       ┌──────────────────────────────────┐                      │
           │myDomain.key├───────►     myDomain.csr                 │                ┌─────▼──────┐
           └────────────┘       │(common name/CN:IP or domain name)├────────────────►myDoamin.crt│
                                └──────────────────────────────────┘                └────────────┘

## cmd
<!-- generate root ca -->
+ `openssl req -newkey rsa:2048 -x509 -nodes -keyout ecs59_ca.key -new -out ecs59_ca.crt -subj /CN=Hostname -reqexts SAN -extensions SAN -config <(cat /etc/ssl/openssl.cnf  <(printf '[SAN]\nsubjectAltName=DNS:hostname,IP:172.16.8.59'))  -sha256 -days 3650`

<!-- crt to pem -->
+ `openssl x509 -in mycert.crt -out mycert.pem -outform PEM`


## tips
+ `CA_cert.pem` This certificate must be added to the browser local authority storage to make trust all certificates that created with using this CA.
+ `localhost_cert.pem`  SSL certificate. Must be installed at WEB server.



## issues

+ `TrustAnchor is not a CA certificate`
     + `-Djdk.security.allowNonCaAnchor=true` 启动java程序时跳过Ca
     <!-- 或 -->
     + `-ext BasicConstraints=ca:true` 生成证书时添加标识

+ for No “Proceed Anyway” option on NET::ERR_CERT_INVALID in Chrome on MacOS
```sh
openssl req \
  -newkey rsa:2048 \
  -x509 \
  -new \
  -nodes \
  -keyout server.key \
  -out server.crt  \
  -subj /CN=test1   \
  -sha256  \
  -days 3650  \
  -addext "subjectAltName = DNS:foo.co.uk,IP:127.0.0.1,IP:192.168.1.1" \
  -addext "extendedKeyUsage = serverAuth"

# if MAcOS does not have addext
  openssl req \
  -newkey rsa:2048 \
  -x509 \
  -nodes \
  -keyout server.key \
  -new \
  -out server.crt \
  -subj /CN=test1 \
  -extensions v3_new \
  -config <(cat /System/Library/OpenSSL/openssl.cnf \
  <(printf '[v3_new]\nsubjectAltName=DNS:a.spectrocloud.com\nextendedKeyUsage=serverAuth')) \
  -sha256 \
  -days 3650
```

## ref
+ [self-signed-certificate-with-custom-ca.md](https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309)
+ [How to create a self-signed (or signed by own CA) SSL certificate for IP address that pass Chrome requirements](https://stackoverflow.com/questions/66558788/how-to-create-a-self-signed-or-signed-by-own-ca-ssl-certificate-for-ip-address)
+ [OpenSSL自签发配置有多域名或ip地址的证书](https://blog.csdn.net/u013066244/article/details/78725842)
+ [Self Signed SSL/TLS Certificate with IP Address](https://nodeployfriday.com/posts/self-signed-cert/)
+ [OpenSSL 自建CA及签发证书](https://blog.csdn.net/scuyxi/article/details/54898870)
<!-- issues -->
+ [How to fix "TrustAnchor is not a CA certificate" for self-signed certificates? (Java)](https://stackoverflow.com/questions/69413310/how-to-fix-trustanchor-is-not-a-ca-certificate-for-self-signed-certificates)
+ [记一次TrustAnchor with subject异常解决](https://blog.csdn.net/volcano2339/article/details/123580945)
+ [No “Proceed Anyway” option on NET::ERR_CERT_INVALID in Chrome on MacOS](https://stackoverflow.com/questions/58802767/no-proceed-anyway-option-on-neterr-cert-invalid-in-chrome-on-macos)
     + `extendedKeyUsage=serverAuth`