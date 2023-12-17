#!/bin/sh
cookieJar=$(mktemp "${TMPDIR:-/tmp}/cookie.jar.XXXX")
# set -v 
clientId=opensearch
redirectUrl=https://..../opensearch/auth/openid/login
username=
password=
clientSecret=
keycloakauth=https://...../auth/realms/China-OP/protocol/openid-connect/auth
keycloaktokenurl=https://....../auth/realms/China-OP/protocol/openid-connect/token

formurl=$(curl -k -vvv  -sSL --get --cookie "$cookieJar" --cookie-jar "$cookieJar"  \
    --data-urlencode "client_id=${clientId}" \
    --data-urlencode "response_type=code" \
    --data-urlencode "scope=openid profile email address phone" \
    --data-urlencode "redirect_uri=${redirectUrl}" \
     "${keycloakauth}" \
     | grep -o 'https[^"]*' )

formurl=${formurl//\&amp;/\&}

echo $formurl


codeUrl=$(curl -k -sS --cookie "$cookieJar" --cookie-jar "$cookieJar" \
  --data-urlencode "username=$username" \
  --data-urlencode "password=$password" \
  --write-out "%{redirect_url}" \
  "$formurl")


echo $codeUrl
code=${codeUrl##*code=}
echo $code

accessToken=$(curl -k -sS --cookie "$cookieJar" --cookie-jar "$cookieJar" \
  --data-urlencode "client_id=$clientId" \
  --data-urlencode "client_secret=$clientSecret" \
  --data-urlencode "redirect_uri=$redirectUrl" \
  --data-urlencode "code=$code" \
  --data-urlencode "grant_type=authorization_code" \
  "${keycloaktokenurl}" \
  )

echo $accessToken