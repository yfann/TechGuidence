# JOSE(JavaScript Object Signing and Encryption)


## JSON Web Token (JWT, RFC 7519)
+ Consists of two base64url-encoded JSON documents separated by a dot, a header, and a set of claims

## JSON Web Signature (JWS, RFC 7515)
+ Adds a digital signature of the header and the claims

## JSON Web Encryption (JWE, RFC 7516)
+ Encrypts the claims

## JSON Web Algorithms (JWA, RFC 7518)
+ Defines the cryptographic algorithms that should be leveraged for JWS and JWE

## JSON Web Key (JWK, RFC 7517)
+ Defines a format to represent cryptographic keys in JSON format
+ JWK to pem
+ JWKS 通常用于发布和分发公钥，以便其他系统可以用来验证签名或解密数据。

## JWKS（JSON Web Key Set）
+ 用于表示一组 JSON Web Keys (JWK) 的 JSON 数据结构