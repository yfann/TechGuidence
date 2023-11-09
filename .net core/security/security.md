
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
+ padded
    + 填充（padding）是为了确保待加密的数据块满足加密算法的要求。许多加密算法要求输入数据的长度是特定的倍数，通常是块大小的倍数。如果数据不符合这个要求，就需要进行填充。
        + 满足块大小要求： 加密算法通常按块处理数据。如果数据长度不是块大小的整数倍，就需要填充使其达到标准块大小。
        + 避免信息泄露： 在某些情况下，如果不进行填充，加密后的数据可能会泄漏有关原始数据长度的信息，这可能对安全性造成影响。通过填充，可以消除这些潜在的信息泄露风险
        + 确保唯一性： 填充可以确保每个输入块都是唯一的，这对某些加密模式和算法是必要的，以防止一些攻击。

+ Base64 vs hexadecimal
    + Base64 编码使用64个字符（A-Z，a-z，0-9，+，/，以及可能的填充字符）来表示二进制数据。每个Base64编码的字符代表6个比特（2^6 = 64），因此，每三个字节的数据（24比特）被编码为四个Base64字符。
    + 而在十六进制编码中，每个十六进制数字表示4个比特。因此，每两个十六进制数字表示一个字节。相比之下，Base64编码可以更紧凑地表示数据，因为它使用更大的字符集，每个字符代表更多的比特。
## ref
+ [Authenticated Encryption in .NET with AES-GCM](https://www.scottbrady91.com/c-sharp/aes-gcm-dotnet)
+ [BouncyCastle](https://www.liaoxuefeng.com/wiki/1252599548343744/1305362418368545)
+ [Encrypting credit card numbers in a database](http://web.archive.org/web/20121017062956/http://www.di-mgt.com.au/cryptoCreditcard.html)