

## tips
+ `Client request error: unable to verify the first certificate`
    + `await Wreck.get('https://.....',{ rejectUnauthorized: false });`
        + TLS flag indicating whether the client should reject a response from a server with invalid certificates.

## ref

+ [wreck](https://hapi.dev/module/wreck/)
+ [hapijs/wreck](https://github.com/hapijs/wreck)