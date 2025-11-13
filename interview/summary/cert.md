

## PKI，Public Key Infrastructure
+ CA 是 Certificate Authority（证书颁发机构）
    + 可信的签名者
    + 用自己的私钥为别人签发证书，证明“这个公钥属于某个主体（如网站、服务）”
    
+ 信任链
    + Root CA（根证书） ---签发--> Intermediate CA（中间CA，可选） ---签发--> End-Entity Certificate（服务器或客户端证书）


## 双向tls


## 验证签名链

## tips
+ ca.key
    + CA的私钥
    + 签发tls.crt

+ ca.crt
    + CA公钥证书
    + 表示签发者（Certificate Authority，CA）的公钥证书
    + 用途：
        + 用于验证 tls.crt
            + 客户端需要 ca.crt 来验证服务器身份。

+ tls.crt
    + 服务器对外展示的证书，包含公钥、域名、签发者、有效期等信息。
    + 用途：
        + 客户端连接服务器时，服务器会发送这个证书。
        + 客户端使用 ca.crt 验证 tls.crt 的签名是否可信。

+ tls.key
    + 服务端私钥
    + 用途：
        + 与 tls.crt 匹配使用，用于握手时签名和解密。


+ X.509
    + 一种数字证书标准
    + 内容标准，定义了结构
    + 封装格式
        + pem
            + base64
            + .pem, .crt, .cer, .key
        + der
            + 二进制
            + .der, .cer