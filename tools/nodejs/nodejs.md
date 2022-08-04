

## tips

+ when call https request, issue: `Client request error: unable to verify the first certificate` happens

```js
export NODE_TLS_REJECT_UNAUTHORIZED='0'
node app.js
```

## ref

+ [How to create an https server?](https://nodejs.org/en/knowledge/HTTP/servers/how-to-create-a-HTTPS-server/)