

## cmd

+ `npm install -g n`


+ `n --insecure --lts`
+ `sudo n stable`

+ `n` list downloaded version
+ ` n <version>` install a version of Node.js

+ `n uninstall`

+ `n ls-remote latest`



<!-- proxy -->
```bash
export NODE_MIRROR='http://nodejs.org/dist'
export http_proxy='http://host:port/path'
n --lts
```

## debug

+ `curl --proxy localhost:8080 https://nodejs.org/dist/`

## ref
+ [n](https://github.com/tj/n)
+ [n proxy](https://github.com/tj/n/blob/master/docs/proxy-server.md)