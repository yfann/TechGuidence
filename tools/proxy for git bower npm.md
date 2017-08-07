## Git

`git config --global http.proxy http://xxxxxx`
`git config --global --list`

```js
//.gitconfig
[http]
   proxy = http://165.225.96.34:10015
[credential]        
    helper = store 
```

## NPM

`npm config set proxy http://xxxxxx`
`npm config set https-proxy http://xxxxxx`

```js
//.npmrc
//proxy=http://165.225.96.34:10015/
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