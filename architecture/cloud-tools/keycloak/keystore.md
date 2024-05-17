# keystore
+ 是一种加密文件，存储着私钥、公钥和证书。Keystore 文件可以保护这些敏感信息不被未授权的访问者获取。
+ 格式
    + JKS（Java KeyStore）：这是 Java 应用程序常用的 Keystore 格式。
    + PKCS12（P12 或 PFX）：这是一个标准化的格式，支持跨平台使用，兼容性更好，适用于多种应用程序和系统。
+ Keystore 文件通常通过工具生成和管理
    + keytool：这是 Java 提供的命令行工具，用于生成、管理和查看 Keystore 文件中的密钥和证书
    + OpenSSL：用于生成和管理 PKCS12 格式的 Keystore 文件。
+ 常见用途
    + SSL/TLS：在 Web 服务器（如 Tomcat、Jetty）中配置 SSL/TLS 时，需要 Keystore 文件来存储服务器的私钥和证书，以便进行加密通信。
    + 签名和验证：在移动应用开发中（如 Android），Keystore 文件用于对应用进行签名，确保应用的完整性和来源可信。
    + 安全存储：在各种安全应用中，Keystore 文件用于安全存储加密密钥和证书，以保护敏感信息。



## keytool
+ `keytool -genkeypair -alias mykey -keyalg RSA -keystore mykeystore.jks -storepass password -validity 365`


## java读取keystore
```java
import java.io.FileInputStream;
import java.security.KeyStore;

public class LoadKeyStore {
    public static void main(String[] args) throws Exception {
        FileInputStream is = new FileInputStream("mykeystore.jks");
        KeyStore keystore = KeyStore.getInstance(KeyStore.getDefaultType());
        keystore.load(is, "password".toCharArray());
        
        // 获取密钥
        Key key = keystore.getKey("mykey", "password".toCharArray());
        System.out.println(key);
    }
}

```