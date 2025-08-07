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
```sh
set http_proxy=http://xxxx:xxx
set https_proxy=http://xxxx:xxx
pip3 install xxxx
```

## maven
+ `{maven}/conf/settings.xml`
.m2/settings.xml


## apt

+ /etc/apt/apt.conf
```conf
Acquire::http::Proxy "http://proxy_server:port";
Acquire::https::Proxy "http://proxy_server:port";
```


## windows
+ ping 不通的原因，ping的协议不是http，也不是https，是ICMP协议。设Http代理不会影响ping
+ 验证用`curl http://www.google.com`




## debug in vscode
+ set proxy in coding
```py
os.environ['HTTP_PROXY'] = 'xxxxx'
os.environ['HTTPS_PROXY'] = 'xxxxx'
```

+ set proxy in launch.json
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python Debugger: Current File",
            "type": "debugpy",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal",
            "env": {
                "HTTP_PROXY": "xxxxx",
                "HTTPS_PROXY": "xxxxx"
            }
        }
    ]
}

```



## ref
+ [给 Windows 的终端配置代理](https://zcdll.github.io/2018/01/27/proxy-on-windows-terminal/)
+ [在 Windows 上给 Git SSH 设置代理](https://walkedby.com/sshwindowsproxy/)