
# RSA签名和验签过程

## 签名
1. client对消息m生成摘要h(m),用自己的私钥对h(m)机密，生成签名s.
2. client将s和m一起，用server的pub key加密，得到密文c,发给server.

## 验签
1. server收到密文c后，用自己的private key解密，获得消息m和签名s.
2. server用client的pub key解密签名s,获得摘要h(m).
3. server使用相同的方法提取消息m的摘要h(m)与上一步解密得到的h(m)进行比较，如果相同则验签成功