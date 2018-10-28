## Git

`git config --global http.proxy http://xxxxxx`
`git config --global --list`

```js
//.gitconfig
[http]
   proxy = http://xxxx
[credential]        
    helper = store 
```

## NPM

`npm config set proxy http://xxxxxx`
`npm config set https-proxy http://xxxxxx`

```js
//.npmrc
//proxy=http://xxxx
//registry=https://registry.npmjs.org/
//registry=https://registry.npm.taobao.org/
```

## bowerrc

```js
//.bowerrc
{
  "proxy":       "http://xxxxxx",
  "https-proxy": "http://xxxxxx",
  "strict-ssl":  false
}
```

## pip3

set http_proxy=http://xxxx:xxx
set https_proxy=http://xxxx:xxx
pip3 install xxxx

## maven

.m2/settings.xml