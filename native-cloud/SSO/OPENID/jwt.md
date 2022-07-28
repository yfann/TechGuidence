# JWT
+ 可以被直接验证
+ 足够小
    + 可以放在url,header中
+ used in
    + authentication
        + ID token
    + authorization
        + Access Token(could be JWT formate)
    + Information Exchange
        + securely signed

## JWT Structure(Baswe64url-encoded)
+ JOSE header
    + metadata
        + the type of token
        + cryptographic algorithms
+ JWS payload
+ JWS signature

## JWT claims
+ claims are pieces of information asserted about a subject.
+ claims
    + reserved
        + iss
        + sub
            + Subject of the JWT (the user)
        + exp (expiration time)
    + custom

## tips
+ simple web tokens (SWTs) 
+ Security Assertion Markup Language (SAML)

## ref
+ [JSON Web Token Claims](https://auth0.com/docs/secure/tokens/json-web-tokens/json-web-token-claims)
+ [parse jwt](https://jwt.io/)
+ [ ID Token](https://openid.net/specs/openid-connect-core-1_0.html#IDToken)