
## Authenticated encryption
+ 保证了
    + confidentiality (机密性)
    + integrity (完整性)
+ 算法
    + AES-GCM
    + AES-CCM


## tips
+ Nonce(Number Used Once)
    + 一次性数字或一次性值
    + nonce 的主要作用是增加加密算法的安全性
        + 防止重放攻击
        + 确保唯一性
            +  Nonce 确保每个加密操作的结果都是唯一的，即使相同的明文和密钥多次加密也会产生不同的密文
        + 提高随机性
        + 用于初始化向量（IV）

## ref
+ [Authenticated Encryption in .NET with AES-GCM](https://www.scottbrady91.com/c-sharp/aes-gcm-dotnet)