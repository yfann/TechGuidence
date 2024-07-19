# keycloak python client



## pyjwt
+ ` pip install pyjwt`
+ code
```py
import jwt
from jwt import PyJWKClient
KEYCLOAK_PUBLIC_KEY_URL = 'http://localhost:8080/realms/myrealm/protocol/openid-connect/certs'
KEYCLOAK_ISSUER = 'http://localhost:8080/realms/myrealm'
jwks_client = PyJWKClient(KEYCLOAK_PUBLIC_KEY_URL)
signing_key = jwks_client.get_signing_key_from_jwt(token)
try:
    payload = jwt.decode(token, signing_key.key, algorithms=['RS256'], audience='account', issuer=KEYCLOAK_ISSUER)
except jwt.ExpiredSignatureError:
    return jsonify({"msg": "Token has expired"}), 401
except jwt.InvalidTokenError:
    return jsonify({"msg": "Invalid token"}), 401
```


## ref
+ [python-keycloak-client](https://python-keycloak-client.readthedocs.io/en/latest/)