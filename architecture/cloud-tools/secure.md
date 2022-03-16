## openVPN
+ VPN加密通道
+ OpenSSL
    - 安全通信的软件包
    - 实现了SSL和TLS

## TLS/SSL
+ Transport Layer Security/Secure Sockets Layer
    - 加密传输，防窃听
    - 校验签名，防篡改
    - 证书, 防身份冒用
+ SSL的升级版TLS
+ HTTPS以SSL进行加密
+ 使用公私钥加密算法
+ process
    + 客户端索要Pub key
    + 公钥加密传递session key(用于对称加密)
    + 每次请求使用session key加密(对称加密速度快于非对称加密)
+ handshake(握手阶段明文)
    1. clientHello
        - TLS 版本
        - 随机数(用于生产对话秘钥)A
        - 支持的加密方法(RSA)
        - 支持的压缩方
        - 没包含域名(默认服务器只有一个网址一张证书)
    2. serverHello
        - 确认 TLS版本
        - 服务端随机数(对话秘钥)B
        - 确认加密方法
        - 服务器证书
        - 可能要求客户端证书(USB key)
    3. client response
        - client端验证证书(可信机构颁布,证书域名是否与实际域名相同,是否过期)
        - 取出公钥
        - 发送
            - 公钥加密的随机数（pre-master key）C
            - 编码通知
            - client握手结束通知
        - A,B,C三个随机数，各自生成session key  
    4. server resonse
        - A,B,C三个随机数生成session key
        - 编码改变通知,随后的信息按照约定的方式进行
        - 服务端握手结束通知
        - hash值 做校验
## ssh

+ windows command:`ssh -i ...` 
    - too open issue(需要更改key文件的权限为只有自己)
        + ` chmod 600 ./xxx.pem`
    - using git bash instead
    - using putty instead

## ref
+ [OpenVPN on macOS](https://tunnelblick.net/)
+ [SSL/TLS 握手过程详解](https://www.jianshu.com/p/7158568e4867)
+ [SSL/TLS协议运行机制的概述](https://www.ruanyifeng.com/blog/2014/02/ssl_tls.html)
<!-- tools -->
+ openVPN connect
    + proxy