
## certificate

+ 根证书
+ 服务器证书
+ 客户端证书

## Root CA（根证书颁发机构，Root Certificate Authority
+ 自签名
+ Root CA 通常离线保存，只用来签发少数中级 CA。
+ 操作系统和浏览器厂商会把可信的 Root CA 根证书预装在设备里。

## 证书链（Certificate Chain）
+ [Root CA] ──签发──> [Intermediate CA] ──签发──> [example.com 的 SSL 证书]
+ 证书链是 一系列相互签发的证书
+ 服务器证书 (Server Certificate)
    + 给具体的域名签发，例如 www.example.com。
+ 中级证书 (Intermediate CA Certificate)
    + 由 Root CA 签发，负责给服务器颁发证书。
    + 好处是 Root CA 不需要直接参与日常签发，提升安全性。
+ 根证书 (Root CA Certificate)
    + 最顶层，自签名。
    + 预装在操作系统、浏览器、手机等设备的受信任根证书库中
+ verify
    + 服务器会把 服务器证书 + 中级证书 发给浏览器。
    + 浏览器验证：
        + 服务器证书 是否由 中级证书 签发；
        + 中级证书 是否由 Root CA 签发；
            + Intermediate CA 证书 包含它的签名值（由 Root CA 私钥生成）
            + 客户端会取出 Root CA 公钥，对 Intermediate CA 证书中的签名进行验证
        + root CA 是否在本地系统的受信任列表里。
    + 如果都成立，就说明这条证书链是可信的。

## digital signature(数字签名)
+ 对内容做hash生成Digest
+ 用私钥对Digest加密生成signature

+ 无法解决公钥被替换

## digital certificate(数字证书)
+ CA用自己的私钥对公钥和相关信息一起加密生成Digital Certificate
+ 内容+signature+Digital certificate 一起发给对方
    + 对方用CA的pub key从digital cert中拿到发送方的pub key


## 握手时SNI的验证
+ 客户端在握手时通过SNI把域名带过去，服务端就知道该返回哪个证书。
+ SNI ！= 证书域名，TLS 握手失败。
```python
from kubernetes_asyncio import client
configuration = client.Configuration()
configuration.host = "frp-sever-frps-internal..."
configuration.tls_server_name = "ph-lws-xxxx"
```
+ kubernetes_asyncio.client.ApiClient底层用aiohttp
    + aiohttp.TCPConnector 默认会这样构建 SSL context：
        + server_hostname（SNI）如果没特别指定，就等于你请求 URL 里的 host。
        + 如果你传了一个 ssl context，并设置了 check_hostname 或 server_hostname，才会覆盖。

+ 当 host 是普通 DNS 时 → tls_server_name 被忽略。
    + host被设置成SNI
    + tls_server_name并不会自动传给 aiohttp 的 server_hostname 参数

+ 当 host 是 IP / localhost 时 → tls_server_name 生效。
    + tls_server_name会被设置成SNI
    + 默认 SNI = 127.0.0.1,但 127.0.0.1 不可能和证书匹配
    + 这时你设置的 tls_server_name 就会被当成 fallback 使用（因为 aiohttp/OpenSSL 会自动把它塞进 server_hostname，否则握手直接失败）。

+ 指定SNI
```py
import ssl
from aiohttp import TCPConnector
from kubernetes_asyncio.client import ApiClient, Configuration

configuration = build_configuration()

ssl_context = ssl.create_default_context(cafile=configuration.ssl_ca_cert)
ssl_context.check_hostname = True

connector = TCPConnector(ssl=ssl_context, server_hostname=configuration.tls_server_name)

api_client = ApiClient(configuration=configuration, connector=connector)

```

## tips
+ root certificates
+ intermediates
+ .key 私钥
+ .csr (certificate signing request)证书签名请求，含有公钥信息
+ .crl 证书吊销列表
+ .pem 导出导入时的证书格式
+ .p12 为把证书与中间证书及私钥加密放在一个文件中，为二进制文件
+ SAN(Subject Alternative Name)
+ 证书域名（Common Name / SAN
    + 在 HTTPS / TLS 证书里，有两类跟域名相关的字段：
        + Common Name (CN) —— 早期的域名字段
            + CN = www.example.com
        + Subject Alternative Name (SAN) —— 现在的标准字段
            + DNS Name = www.example.com
            + DNS Name = example.com
    + 现代浏览器和客户端 只检查 SAN，不再依赖 CN
+ SNI（Server Name Indication）
    + 在 TLS 握手开始时，客户端告诉服务端 “我想访问的域名”
    + 有了 SNI，客户端在握手时把 域名带过去，服务端就知道该返回哪个证书。
        + 这样，一个服务器 + 一个 IP，就可以托管多个 HTTPS 域名。

## ref
+ [SSH 证书登录教程](http://www.ruanyifeng.com/blog/2020/07/ssh-certificate.html)
+ [数字签名是什么？](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
+ [证书链-Digital Certificates](https://www.jianshu.com/p/46e48bc517d0)

+ [Root CA configuration file](https://jamielinux.com/docs/openssl-certificate-authority/appendix/root-configuration-file.html)

<!-- TLDR -->
+ [X.509 证书](zhaowenyu.com/https-doc/pki/x509.html)


<!-- cert config -->
+ [x509v3_config](https://www.openssl.org/docs/manmaster/man5/x509v3_config.html)
+ [openssl-x509v3_config配置文件学习](https://soulchild.cn/2410.html)
