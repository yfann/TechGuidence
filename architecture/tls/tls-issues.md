<!-- self signed issues -->

+ `TrustAnchor is not a CA certificate`
     + `-Djdk.security.allowNonCaAnchor=true` 启动java程序时跳过Ca
     <!-- 或 -->
     + `-ext BasicConstraints=ca:true` 生成证书时添加标识

+ `for No “Proceed Anyway” option on NET::ERR_CERT_INVALID in Chrome on MacOS`
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

+ `javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target`
    + usually java server

## ref
<!-- issues -->
+ [How to fix "TrustAnchor is not a CA certificate" for self-signed certificates? (Java)](https://stackoverflow.com/questions/69413310/how-to-fix-trustanchor-is-not-a-ca-certificate-for-self-signed-certificates)
+ [记一次TrustAnchor with subject异常解决](https://blog.csdn.net/volcano2339/article/details/123580945)
+ [No “Proceed Anyway” option on NET::ERR_CERT_INVALID in Chrome on MacOS](https://stackoverflow.com/questions/58802767/no-proceed-anyway-option-on-neterr-cert-invalid-in-chrome-on-macos)
     + `extendedKeyUsage=serverAuth`